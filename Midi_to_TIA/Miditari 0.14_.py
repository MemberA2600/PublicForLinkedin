import os
from tkinter import *
import re
from tkinter.filedialog import *
from tkinter import messagebox
import tkinter.scrolledtext as tkscrolled
import mido
from mido import MidiFile
import pyperclip
import subprocess

import rtmidi
import time
from numba import jit

@jit(nopython=True)

class Felulet():
    def __init__(self, master):
        self.file_name=""
        self.merged1=[]
        self.merged2=[]

        self.valtozott = True
        #self.forcetotrembe=False
        self.Open_Button=Button(master, width=14, text="Open Midi File", command=self.open_midi)
        self.Open_Button.place(x=5, y=5)
        self.Open_Button=Button(master, width=14, text="Open SID File", command=self.open_sid)
        self.Open_Button.place(x=120, y=5)
        #self.ListenB=Button(master, width=20, text="Listen to File", state=DISABLED, command=self.Listen)
        #self.ListenB.place(x=170, y=5)
        self.path_var=StringVar()
        self.path_entry=Entry(master, textvariable=self.path_var, width=61, state=DISABLED, justify=LEFT)
        self.path_entry.place(x=5, y=35)
        self.channels_list=[0]
        self.channels_avaiable=[0]
        self.channel1=StringVar()
        self.channel1.set("None")
        self.channel2=StringVar()
        self.channel2.set("None")

        self.channels_messages={}

        self.SID1=IntVar()
        self.SIDbox1=Checkbutton(master, text="SID-effect", variable=self.SID1)
        self.SIDbox1.place(x=7, y=116)
        self.SID2=IntVar()
        self.SIDbox2=Checkbutton(master, text="SID-effect", variable=self.SID2)
        self.SIDbox2.place(x=192, y=116)


        self.Tempo=StringVar()
        self.Tempo.set("50")
        self.TempoText=Label(master, text="Tempo:")
        self.TempoText.place(x=10, y=62)

        self.TempoEntry=Entry(master, width=3, textvariable=self.Tempo)
        self.TempoEntry.place(x=62, y=62)

        self.AutoTempo=Button(master, width=10, text="AutoTempo", command=self.autotempo)
        self.AutoTempo.place(x=94, y=59)

        self.Test_Button1=Button(master, text="Listen to Channel", width=22, command=self.Set_Test1, state=DISABLED)
        self.Test_Button1.place(x=8, y=177)
        self.Test_Button2=Button(master, text="Listen to Channel", width=22, command=self.Set_Test2, state=DISABLED)
        self.Test_Button2.place(x=193, y=177)


        self.Convert_Button1 = Button(master, text="Convert to bB data", width=22, command=self.Convert1, state=DISABLED)
        self.Convert_Button1.place(x=8, y=203)
        self.Convert_Button2 = Button(master, text="Convert to bB data", width=22, command=self.Convert2, state=DISABLED)
        self.Convert_Button2.place(x=193, y=203)

        #self.Stopper=Button(master, text="Stop Channel Test", width=22, command=self.StopTest, state=DISABLED)
        #self.Stopper.place(x=100, y=320)

        #self.force1=IntVar()
        #self.force1box=Checkbutton(master, variable=self.force1, text="Force 'pure' channel")
        #self.force1box.place(x=8, y=109)
        #self.force2=IntVar()
        #self.force2box=Checkbutton(master, variable=self.force2, text="Force 'pure' channel")
        #self.force2box.place(x=193, y=109)
        #self.force3=IntVar()
        #self.force4=IntVar()

        #self.force3box=Checkbutton(master, variable=self.force3, text="Force 'pure' channel")
        #self.force3box.place(x=8, y=219)
        #self.force4box=Checkbutton(master, variable=self.force4, text="Force 'pure' channel")
        #self.force4box.place(x=193, y=219)

        self.octaves=tuple(["-2","-1","0","1","2"])
        self.octave1=StringVar()
        self.octave2=StringVar()

        self.octave1.set("0")
        self.octave2.set("0")



        self.octave_menu1=OptionMenu(master, self.octave1, *self.octaves)
        self.octave_menu1.config(width=2)
        self.octave_menu1.place(x=8,y=144)
        self.octave1_text=Label(master, text="chords change.")
        self.octave1_text.place(x=65, y=152)

        self.octave_menu2=OptionMenu(master, self.octave2, *self.octaves)
        self.octave_menu2.config(width=2)
        self.octave_menu2.place(x=193,y=144)
        self.octave2_text=Label(master, text="chords change.")
        self.octave2_text.place(x=250, y=152)



        self.Merge=Button(master, text="Create 'Merged' Channel", width=22, command=self.merger, state=DISABLED)
        self.Merge.place(x=100, y=245)

        self.Auto=Button(master, text="Channel Autoselect", width=22, command=self.AutoS, state=DISABLED)
        self.Auto.place(x=100, y=273)

        self.forceit=IntVar()
        self.forcer=Checkbutton(master, text="Force note sorting", variable=self.forceit)
        self.forcer.place(x=240, y=5)

        self.ASM=Button(master, text="Create ASM code", width=22, command=self.assembler, state=DISABLED)
        self.ASM.place(x=100, y=299)

        self.box=tkscrolled.ScrolledText(master, width=52, height=12, state=DISABLED, font=("Times New Roman", 10))
        self.box.place(x=23, y=330)

        self.copybutton=Button(master, text="Copy to Clipboard", width=22, command=self.Copy, state=DISABLED)
        self.copybutton.place(x=100, y=520)

        self.creator=Label(master, text="Created by Fehér János Zoltán (Member) in 2019\nemail/paypal: feher.janos.zoltan@gmail.com\npatreon: https://www.patreon.com/AtarianHungary\nyoutube: https://www.youtube.com/user/M3MB3Rrr\n\nSid to Midi module was created by:\nMichael Schwendt (sidplay@geocities.com)\nNot all heroes wear capes!", padx=16, pady=10, borderwidth=2, relief="groove", anchor=W, justify=LEFT)

        self.creator.place(x=23, y=560)

        self.checker(master)

    def autotempo(self):
        times=[]
        another=[]
        wholenumbers={}
        for message in mido.MidiFile(self.file_name):

            try:
                regex=re.findall(r'channel\=\d+',str(message))
                regex=regex[0].replace("channel=","")
                if regex==self.channel1.get() or regex==self.channel2.get() or regex==self.channel3.get() or regex==self.channel4.get():
                    regex=re.findall(r'time=\d+\.\d+',str(message))
                    regex=regex[0].replace("time=","")[:4]


                    times.append(regex)

            except:
                pass

        try:
            for number in range(1, 100):
                counter=0
                for elem in times:
                    zergling=float(elem)*number
                    try:
                        characters=re.findall(r'\.\d+', str(zergling))

                        characters=characters[0]
                        OK=True
                        for character in characters:
                            if character!="." and character!="0":
                                OK=False
                        if OK==True:
                            counter+=1
                    except:
                        pass
                if counter>0:
                    wholenumbers.setdefault(counter, [])
                    another.append(counter)
                    wholenumbers[counter].append(number)
            another=set(another)
            another=list(another)
            another.sort(reverse=1)
            formessage="Recommended tempo values are:\n"
            for elem in wholenumbers[another[0]]:
                formessage = formessage + str(elem) + ", "
            formessage=formessage[:-2]+"!"
            self.Tempo.set(str(wholenumbers[another[0]][0]))

            messagebox.showinfo(title="AutoTempo", message=formessage)
        except:
            messagebox.showerror(title="AutoTempo", message="Couldn't calculate recommended tempo!")



    def Copy(self):
        text=str(self.box.get(0.0, END))
        pyperclip.copy(text)

    def Set_Test1(self):
        channeltoplay=int(self.channel1.get())
        self.Channel_Test(channeltoplay)
    def Set_Test2(self):
        channeltoplay=int(self.channel2.get())
        self.Channel_Test(channeltoplay)
    def Set_Test3(self):
        channeltoplay=int(self.channel3.get())
        self.Channel_Test(channeltoplay)
    def Set_Test4(self):
        channeltoplay=int(self.channel4.get())
        self.Channel_Test(channeltoplay)

    def AutoS(self):
        TrackLen=[]
        counter=0


        for tracknumber in self.channels_list:
            TrackLen.append([0, tracknumber])
            for track in mido.MidiFile(self.file_name).tracks:
                for message in track:
                    try:
                        regex = re.findall(r'channel\=\d+\s', str(message))
                        regex = int(regex[0].replace('channel=', "").replace(" ", ""))
                        if regex==int(tracknumber):

                            TrackLen[counter][0]+= message.time
                    except:
                        pass
            counter+=1
        TrackLen.sort(reverse=1)
        templist=[]
        for elemek in TrackLen:
            templist.append(elemek[1])

        self.channel1.set(templist[0])
        self.channel2.set(templist[1])




    def Convert1(self):
        if self.channel1.get()=="Merged1":
            code=[]
            for elem in self.merged1:
                code.append(elem)
        elif self.channel1.get()=="Merged2":
            code=[]
            for elem in self.merged2:
                code.append(elem)
        else:
            changechord=int(self.octave1.get())*12
            channeltoconvert=int(self.channel1.get())
            SIDeffect=self.SID1.get()
            code=self.ConvertChannel(channeltoconvert, changechord, SIDeffect)

            code.append("\t255")

        for line in code:
            self.box.insert(END, line)

    def Convert2(self):
        if self.channel2.get()=="Merged1":
            code=[]
            for elem in self.merged1:
                code.append(elem)
        elif self.channel2.get()=="Merged2":
            code=[]
            for elem in self.merged2:
                code.append(elem)
        else:
            changechord=int(self.octave2.get())*12
            channeltoconvert=int(self.channel2.get())
            SIDeffect=self.SID2.get()
            code=self.ConvertChannel(channeltoconvert, changechord, SIDeffect)


            code.append("\t255")

        for line in code:
            self.box.insert(END, line)


    def rounder(self, toconvert):
        original = float(toconvert)
        toconvert=str(toconvert)

        lenght=0
        for chara in toconvert:
            if chara==".":
                break
            else:
                lenght+=1

        toconvert = toconvert.replace(".", "")
        while len(toconvert) > lenght:
            if int(toconvert[-1]) < 5:
                number = toconvert[-2]
            else:
                number = str(int(toconvert[-2]) + 1)

            try:
                toconvert = toconvert[:-2] + number
            except:
                toconvert = number
        toconvert=int(toconvert)
        remainder = original - toconvert
        return (toconvert, remainder)


    def ConvertChannel(self, channeltoconvert, changechord, SIDeffect):
        AUDC_1 = {36: 31, 37: 29, 38: 28, 39: 26, 41: 23, 42: 22, 43: 19, 45: 18, 46: 17, 47: 16, 48: 15, 49: 14, 50: 13, 53: 11, 56: 9, 58: 8, 60: 7, 62: 6, 65: 5, 68: 4, 72: 3, 77: 2, 84: 1, 96: 0}
        AUDC_4 = {71: 31, 72: 29, 73: 27, 74: 26, 75: 24, 76: 23, 77: 21, 78: 20, 79: 19, 80: 18, 81: 17, 82: 16, 83: 15, 84: 14, 85: 13, 88: 11, 91: 9, 93: 8, 95: 7, 97: 6, 100: 5, 103: 4, 107: 3}
        AUDC_6 = {24: 30, 25: 28, 26: 27, 27: 25, 28: 24, 29: 22, 30: 21, 31: 20, 38: 13, 39: 12, 42: 10, 50: 6}
        AUDC_12 = {52: 31, 53: 29, 54: 27, 55: 26, 56: 24, 57: 23, 59: 20, 60: 19, 61: 18, 62: 17, 63: 16, 64: 15, 65: 14, 66: 13, 69: 11, 72: 9, 74: 8, 76: 7, 78: 6, 81: 5, 84: 4, 88: 3, 93: 2, 100: 1}

        AUDC_14_plus = {21: 14, 22: 12, 23: 10}
        AUDC_1_plus = {40: 25, 44: 18, 51: 12, 52: 12, 54: 10, 55: 10, 57: 8, 59: 7, 61: 6, 63: 5, 64: 5, 66: 4, 67: 4, 69: 3, 70: 3, 71: 3, 73: 2, 74: 2, 75: 2, 76: 2, 78: 1, 79: 1, 80: 1, 81: 1, 82: 1, 83: 1, 85: 0, 86: 0, 87: 0, 88: 0, 89: 0, 90: 0, 91: 0, 92: 0, 93: 0, 94: 0, 95: 0}
        AUDC_4_plus = {86: 12, 87: 12, 89: 10, 90: 10, 92: 8, 94: 7, 96: 6, 98: 5, 99: 5, 101: 4, 102: 4, 104: 3, 105: 3, 106: 3, 108: 2}
        AUDC_6_plus = {32: 19, 33: 18, 34: 17, 35: 16, 36: 15, 37: 14, 40: 11, 41: 11, 43: 9, 44: 9, 45: 8, 46: 8, 47: 7, 48: 7, 49: 6, 51: 6, 52: 5, 53: 5, 54: 5, 55: 4, 56: 4, 57: 3, 58: 3, 59: 2, 60: 2, 61: 1, 62: 1, 63: 0, 64: 0}
        AUDC_12_plus = {58: 22, 67: 12, 68: 12, 70: 10, 71: 10, 73: 8, 75: 7, 77: 6, 79: 6, 80: 5, 82: 5, 83: 4, 85: 4, 86: 3, 87: 3, 89: 3, 90: 2, 91: 2, 92: 2, 94: 2, 95: 2, 96: 1, 97: 1, 98: 1, 99: 1, 101: 1, 102: 0, 103: 0, 104: 0, 105: 0, 106: 0, 107: 0}

        self.box.config(state=NORMAL)
        self.box.delete(0.0, END)
        duration=0
        durations=[]
        remainder=0
        for message in mido.MidiFile(self.file_name):
            if not message.is_meta:
                duration+=message.time
                try:


                    regex = re.findall(r'channel\=\d+\s', str(message))
                    regex = int(regex[0].replace('channel=', "").replace(" ", ""))

                    if self.forceit.get()==1:
                        try:
                            regex2 = re.findall(r'note\=\d+\s', str(message))
                            regex2 = int(regex2[0].replace('note=', "").replace(" ", ""))
                            if regex2<36:
                                regex=0
                            elif regex2<52:
                                regex=1
                            elif regex2<71:
                                regex=2
                            else:
                                regex=3

                        except:
                            pass



                    if channeltoconvert==regex:

                            try:
                                regex2 = re.findall(r'note_off', str(message))
                                regex2=regex2[0]

                                toconvert=duration*int(self.Tempo.get())
                                converted, new_remainder=self.rounder(toconvert)
                                remainder+=new_remainder
                                if remainder>1:
                                    converted+=1
                                    remainder-=1
                                elif remainder<-1:
                                    converted-=1
                                    remainder+=1
                                else:
                                    pass
                                durations.append(converted)
                                duration=0

                            except:
                                pass
                            try:
                                regex2 = re.findall(r'note_on', str(message))
                                regex2 = regex2[0]

                                toconvert = duration * int(self.Tempo.get())
                                converted, new_remainder = self.rounder(toconvert)
                                remainder += new_remainder
                                if remainder > 1:
                                    converted += 1
                                    remainder -= 1
                                elif remainder < -1:
                                    converted -= 1
                                    remainder += 1
                                else:
                                    pass
                                durations.append(converted)
                                duration=0
                            except:
                                pass
                except:
                    pass


        try:
            string="\t0, 0, 0\n\t"+str(durations[0])+"\n"

            code=[string]
        except:
            code=[]
        counter=1


        for message in mido.MidiFile(self.file_name):
            if not message.is_meta:
                duration += message.time
                try:

                        regex = re.findall(r'channel\=\d+\s', str(message))
                        regex = int(regex[0].replace('channel=', "").replace(" ", ""))

                        if self.forceit.get() == 1:
                            try:
                                regex2 = re.findall(r'note\=\d+\s', str(message))
                                regex2 = int(regex2[0].replace('note=', "").replace(" ", ""))


                                if regex2 < 36:
                                    regex = 0
                                elif regex2 < 52:
                                    regex = 1
                                elif regex2 < 71:
                                    regex = 2
                                else:
                                    regex = 3



                            except:
                                pass

                        if channeltoconvert == regex:
                            try:
                                regex2=re.findall(r'note_off', str(message))
                                regex2 = regex2[0]
                                string="\t0, 0, 0\n\t"+str(durations[counter])+"\n"
                                code.append(string)
                                counter+=1
                            except:
                                pass



                            try:
                                regex2=re.findall(r'note_on', str(message))
                                regex2 = regex2[0]
                                string=""

                                velocity=re.findall(r'velocity\=\d+\s', str(message))
                                velocity = int(velocity[0].replace('velocity=', "").replace(" ", ""))
                                note=re.findall(r'note\=\d+\s', str(message))
                                note = int(note[0].replace('note=', "").replace(" ", ""))

                                note+=changechord



                                AUDV=round(velocity/10)
                                AUDV, remainder=self.rounder(AUDV)

                                if note < 52:
                                    if AUDV > 6:
                                        AUDV -= 6
                                    else:
                                        AUDV = 1

                                if note > 51:
                                    if note > 69:
                                        if note in AUDC_4:
                                            AUDC=4
                                            AUDF=AUDC_4[note]
                                        elif note in AUDC_12:
                                            AUDC=12
                                            AUDF=AUDC_12[note]
                                        elif note in AUDC_4_plus:
                                            AUDC=4
                                            AUDF = AUDC_4_plus[note]
                                        elif note in AUDC_12_plus:
                                            AUDC=12
                                            AUDF = AUDC_12_plus[note]
                                        elif note in AUDC_1:
                                            AUDC=1
                                            AUDF = AUDC_1[note]
                                        elif note in AUDC_1_plus:
                                            AUDC=1
                                            AUDF = AUDC_1_plus[note]
                                        elif note in AUDC_6:
                                            AUDC=6
                                            AUDF = AUDC_6[note]
                                        elif note in AUDC_6_plus:
                                            AUDC=6
                                            AUDF = AUDC_6_plus[note]
                                        else:
                                            AUDC=14
                                            AUDF = AUDC_14_plus[note]
                                    else:
                                        if note in AUDC_12:
                                            AUDC=12
                                            AUDF=AUDC_12[note]
                                        elif note in AUDC_4:
                                            AUDC=4
                                            AUDF=AUDC_4[note]
                                        elif note in AUDC_12_plus:
                                            AUDC=12
                                            AUDF = AUDC_12_plus[note]
                                        elif note in AUDC_4_plus:
                                            AUDC=4
                                            AUDF = AUDC_4_plus[note]
                                        elif note in AUDC_1:
                                            AUDC=1
                                            AUDF = AUDC_1[note]
                                        elif note in AUDC_1_plus:
                                            AUDC=1
                                            AUDF = AUDC_1_plus[note]
                                        elif note in AUDC_6:
                                            AUDC=6
                                            AUDF = AUDC_6[note]
                                        elif note in AUDC_6_plus:
                                            AUDC=6
                                            AUDF = AUDC_6_plus[note]
                                        else:
                                            AUDC=14
                                            AUDF = AUDC_14_plus[note]
                                else:
                                    if note < 36:
                                        if note in AUDC_6:
                                            AUDC=6
                                            AUDF=AUDC_6[note]
                                        elif note in AUDC_1:
                                            AUDC=1
                                            AUDF=AUDC_1[note]
                                        elif note in AUDC_6_plus:
                                            AUDC=6
                                            AUDF = AUDC_6_plus[note]
                                        elif note in AUDC_1_plus:
                                            AUDC=1
                                            AUDF = AUDC_1_plus[note]
                                        elif note in AUDC_12:
                                            AUDC=12
                                            AUDF = AUDC_12[note]
                                        elif note in AUDC_12_plus:
                                            AUDC=12
                                            AUDF = AUDC_12_plus[note]
                                        elif note in AUDC_4:
                                            AUDC=4
                                            AUDF = AUDC_4[note]
                                        elif note in AUDC_12_plus:
                                            AUDC=12
                                            AUDF = AUDC_12_plus[note]
                                        else:
                                            AUDC=14
                                            AUDF = AUDC_14_plus[note]
                                    else:
                                        if note in AUDC_1:
                                            AUDC=1
                                            AUDF=AUDC_1[note]
                                        elif note in AUDC_6:
                                            AUDC=6
                                            AUDF=AUDC_6[note]
                                        elif note in AUDC_1_plus:
                                            AUDC=1
                                            AUDF = AUDC_1_plus[note]
                                        elif note in AUDC_6_plus:
                                            AUDC=6
                                            AUDF = AUDC_6_plus[note]
                                        elif note in AUDC_12:
                                            AUDC=12
                                            AUDF = AUDC_12[note]
                                        elif note in AUDC_12_plus:
                                            AUDC=12
                                            AUDF = AUDC_12_plus[note]
                                        elif note in AUDC_4:
                                            AUDC=4
                                            AUDF = AUDC_4[note]
                                        elif note in AUDC_4_plus:
                                            AUDC=4
                                            AUDF = AUDC_4_plus[note]
                                        else:
                                            AUDC=14
                                            AUDF = AUDC_14_plus[note]




                                string="\t"+str(AUDV)+", "+str(AUDC)+", "+str(AUDF)+"\n\t"+str(durations[counter])+"\n"
                                if SIDeffect == True and AUDV!=0 and AUDC!=0:
                                    note2=note-12

                                    if note2 < 52:
                                        if AUDV > 6:
                                            AUDV2 = AUDV-6
                                        else:
                                            AUDV2 = 1
                                    else:
                                        AUDV2=AUDV

                                    if note2 > 51:
                                        if note2 > 69:
                                            if note2 in AUDC_4:
                                                AUDC2 = 4
                                                AUDF2 = AUDC_4[note2]
                                            elif note2 in AUDC_12:
                                                AUDC2 = 12
                                                AUDF2 = AUDC_12[note2]
                                            elif note2 in AUDC_4_plus:
                                                AUDC2 = 4
                                                AUDF2 = AUDC_4_plus[note2]
                                            elif note2 in AUDC_12_plus:
                                                AUDC2 = 12
                                                AUDF2 = AUDC_12_plus[note2]
                                            elif note2 in AUDC_1:
                                                AUDC2 = 1
                                                AUDF2 = AUDC_1[note2]
                                            elif note2 in AUDC_1_plus:
                                                AUDC2 = 1
                                                AUDF2 = AUDC_1_plus[note2]
                                            elif note2 in AUDC_6:
                                                AUDC2 = 6
                                                AUDF2 = AUDC_6[note2]
                                            elif note2 in AUDC_6_plus:
                                                AUDC2 = 6
                                                AUDF2 = AUDC_6_plus[note2]
                                            else:
                                                AUDC2 = 14
                                                AUDF2 = AUDC_14_plus[note2]
                                        else:
                                            if note2 in AUDC_12:
                                                AUDC2 = 12
                                                AUDF2 = AUDC_12[note2]
                                            elif note2 in AUDC_4:
                                                AUDC2 = 4
                                                AUDF2 = AUDC_4[note2]
                                            elif note2 in AUDC_12_plus:
                                                AUDC2 = 12
                                                AUDF2 = AUDC_12_plus[note2]
                                            elif note2 in AUDC_4_plus:
                                                AUDC2 = 4
                                                AUDF2 = AUDC_4_plus[note2]
                                            elif note2 in AUDC_1:
                                                AUDC2 = 1
                                                AUDF2 = AUDC_1[note2]
                                            elif note2 in AUDC_1_plus:
                                                AUDC2 = 1
                                                AUDF2 = AUDC_1_plus[note2]
                                            elif note2 in AUDC_6:
                                                AUDC2 = 6
                                                AUDF2 = AUDC_6[note2]
                                            elif note2 in AUDC_6_plus:
                                                AUDC2 = 6
                                                AUDF2 = AUDC_6_plus[note2]
                                            else:
                                                AUDC2 = 14
                                                AUDF2 = AUDC_14_plus[note2]
                                    else:
                                        if note2 < 36:
                                            if note2 in AUDC_6:
                                                AUDC2 = 6
                                                AUDF2 = AUDC_6[note2]
                                            elif note2 in AUDC_1:
                                                AUDC2 = 1
                                                AUDF2 = AUDC_1[note2]
                                            elif note2 in AUDC_6_plus:
                                                AUDC2 = 6
                                                AUDF2 = AUDC_6_plus[note2]
                                            elif note2 in AUDC_1_plus:
                                                AUDC2 = 1
                                                AUDF2 = AUDC_1_plus[note2]
                                            elif note2 in AUDC_12:
                                                AUDC2 = 12
                                                AUDF2 = AUDC_12[note2]
                                            elif note2 in AUDC_12_plus:
                                                AUDC2 = 12
                                                AUDF2 = AUDC_12_plus[note2]
                                            elif note2 in AUDC_4:
                                                AUDC2 = 4
                                                AUDF2 = AUDC_4[note2]
                                            elif note2 in AUDC_12_plus:
                                                AUDC2 = 12
                                                AUDF2 = AUDC_12_plus[note2]
                                            else:
                                                AUDC2 = 14
                                                AUDF2 = AUDC_14_plus[note2]
                                        else:
                                            if note2 in AUDC_1:
                                                AUDC2 = 1
                                                AUDF2 = AUDC_1[note2]
                                            elif note2 in AUDC_6:
                                                AUDC2 = 6
                                                AUDF2 = AUDC_6[note2]
                                            elif note2 in AUDC_1_plus:
                                                AUDC2 = 1
                                                AUDF2 = AUDC_1_plus[note2]
                                            elif note2 in AUDC_6_plus:
                                                AUDC2 = 6
                                                AUDF2 = AUDC_6_plus[note2]
                                            elif note2 in AUDC_12:
                                                AUDC2 = 12
                                                AUDF2 = AUDC_12[note2]
                                            elif note2 in AUDC_12_plus:
                                                AUDC2 = 12
                                                AUDF2 = AUDC_12_plus[note2]
                                            elif note2 in AUDC_4:
                                                AUDC2 = 4
                                                AUDF2 = AUDC_4[note2]
                                            elif note2 in AUDC_4_plus:
                                                AUDC2 = 4
                                                AUDF2 = AUDC_4_plus[note2]
                                            else:
                                                AUDC2 = 14
                                                AUDF2 = AUDC_14_plus[note2]




                                    divider=3

                                    last=False
                                    shit=int(string.split("\n")[1])


                                    whole=shit//divider
                                    remainder=shit%divider
                                    for number in range(0, whole):
                                        if number%2==0:
                                            string = "\t" + str(AUDV) + ", " + str(AUDC) + ", " + str(AUDF) + "\n\t" + str(divider) + "\n"
                                            code.append(string)

                                            last=True
                                        else:

                                            string = "\t" + str(AUDV2) + ", " + str(AUDC2) + ", " + str(AUDF2) + "\n\t" + str(divider) + "\n"
                                            code.append(string)

                                            last=False

                                    if last==True:
                                        string = "\t" + str(AUDV2) + ", " + str(AUDC2) + ", " + str(AUDF2) + "\n\t" + str(remainder) + "\n"

                                    else:
                                        string = "\t" + str(AUDV) + ", " + str(AUDC) + ", " + str(AUDF) + "\n\t" + str(remainder) + "\n"
                                    code.append(string)

                                counter+= 1
                                if SIDeffect == False or AUDV==0 or AUDC==0:
                                    code.append(string)

                            except:
                                pass
                except:
                    pass




                            #self.box.insert(END, string)
                            #self.box.insert(END, "\n")



        code=self.CheckForZeroError(code)
        code=self.Check_for_255(code)
        code=self.Check_for_Zero(code)


        code=self.Add_Fadeout(code)

        return(code)


    def CheckForZeroError(self, code):
        newcode=[]
        for line in code:
            Vars=line.split("\n")[0]

            Vars=re.sub(r'\t0,\s\d+,\s\d+', "\t0, 0, 0", Vars)
            Vars=re.sub(r'\t\d+,\s0,\s\d+', "\t0, 0, 0", Vars)

            newcode.append(str(Vars+"\n"+line.split("\n")[1]+"\n"))
        return(newcode)




    def Check_for_255(self, code):
        newcode=[]
        for line in code:
            duration=int(line.split("\n")[1].replace('\t', ''))
            if duration>255:
                for i in range(0, int(duration//255)):
                    newcode.append(line.split("\n")[0]+"\n\t255\n")
                newcode.append(line.split("\n")[0]+"\n\t"+str(int(duration%255))+"\n")

            else:
                newcode.append(line)

        return(newcode)

    def Check_for_Zero(self, code):
        newcode=[]
        for line in code:
            duration=int(line.split("\n")[1].replace('\t', ''))
            if duration>0:
                newcode.append(line)

        return(newcode)


    def Add_Fadeout(self, code):
        newcode = []
        for number in range(0, len(code)-1):
            if code[number].split("\n")[0]==code[number+1].split("\n")[0]:

                if code[number].split("\n")[0]!="\t0, 0, 0":
                    duration=""
                    for chara in code[number].split("\n")[1]:
                        try:
                            duration=duration+str(int(chara))
                        except:
                            pass
                    duration=int(duration)

                    if duration<2:
                        newcode.append(code[number])
                    elif duration>3:
                        newcode.append(str(code[number].split("\n")[0]+"\n")+"\t"+str(duration-2)+"\n")
                        volume=int(code[number].split("\n")[0].split(",")[0].replace("\t", ""))
                        channel=code[number].split("\n")[0].split(",")[1]
                        frekv=code[number].split("\n")[0].split(",")[2]
                        if volume>4:
                            volume=2
                        else:
                            volume=1
                        forappend="\t"+str(volume)+","+channel+","+frekv+"\n\t2\n"
                        newcode.append(forappend)
                    else:
                        newcode.append(str(code[number].split("\n")[0]+"\n")+"\t"+str(duration-1)+"\n")
                        volume = int(code[number].split("\n")[0].split(",")[0].replace("\t", ""))
                        channel = code[number].split("\n")[0].split(",")[1]
                        frekv = code[number].split("\n")[0].split(",")[2]
                        if volume > 4:
                            volume = 2
                        else:
                            volume = 1
                        forappend = "\t" + str(volume) + "," + channel + "," + frekv + "\n\t1\n"
                        newcode.append(forappend)
                else:
                    newcode.append(code[number])
            else:
                newcode.append(code[number])

        newcode.append(code[-1])

        return(newcode)



    def Channel_Test(self, channeltoplay):


        #self.Stopper.config(state=NORMAL)
        #self.abort=0
        shouldwait=False
        midiout=rtmidi.MidiOut()
        secondsleft=10
        duration=0
        if midiout.get_ports():
            midiout.open_port(0)
        else:
            midiout.open_virtual_port("Tester")

        for message in mido.MidiFile(self.file_name):
            regex=666

            try:
                regex=re.findall(r'channel\=\d+\s', str(message))
                regex=int(regex[0].replace('channel=', ""). replace(" ", ""))
            except:
                pass
            if not message.is_meta:
                if shouldwait==True:
                    time.sleep(message.time)
                    duration=duration+message.time
                    secondsleft = secondsleft - message.time

                if regex!=666 and channeltoplay!=regex:
                    continue
                if channeltoplay==regex:
                    try:
                        regex2 = re.findall(r'note_off', str(message))
                        regex2=regex2[0]
                        shouldwait = True

                    except:
                        pass

                if secondsleft<1:
                    break

                duration=0
                midiout.send_message(message.bytes())



        #self.Stopper.config(state=DISABLED)
        midiout.close_port()

    def StopTest():
        self.Stopper.config(state=DISABLED)
        self.abort=1

    def create_channelbuttons(self, master):
        try:
            self.text_channel0.destroy()
            self.text_channel1.destroy()
            self.text_channel2.destroy()
            self.text_channel3.destroy()

            self.Menu_channel0.destroy()
            self.Menu_channel1.destroy()
            self.Menu_channel2.destroy()
            self.Menu_channel3.destroy()
        except:
            pass



        self.text_channel0=Label(master, text="TIA Channel 0:")
        self.text_channel0.place(x=5, y=95)
        self.Menu_channel0=OptionMenu(master, self.channel1, *self.channels_avaiable)
        self.Menu_channel0.config(width=7)
        self.Menu_channel0.place(x=90, y=92)

        self.text_channel1=Label(master, text="TIA Channel 1:")
        self.text_channel1.place(x=190, y=95)
        self.Menu_channel1=OptionMenu(master, self.channel2, *self.channels_avaiable)
        self.Menu_channel1.config(width=7)
        self.Menu_channel1.place(x=275, y=92)






    def checker(self, master):

        if self.channel1.get()=="Merged1" or self.channel1.get()=="Merged2":
            self.octave_menu1.config(state=DISABLED)
            self.SID1.set(0)
            self.SIDbox1.config(state=DISABLED)
        else:
            self.octave_menu1.config(state=NORMAL)
            self.SIDbox1.config(state=NORMAL)

        if self.channel2.get()=="Merged1" or self.channel2.get()=="Merged2":
            self.octave_menu2.config(state=DISABLED)
            self.SID2.set(0)
            self.SIDbox2.config(state=DISABLED)
        else:
            self.octave_menu2.config(state=NORMAL)
            self.SIDbox2.config(state=NORMAL)

        self.path_var.set(self.file_name)

        if self.channel1.get()!="None" and self.channel2.get()!="None":
            self.AutoTempo.config(state=NORMAL)
        else:
            self.AutoTempo.config(state=DISABLED)

        if len(self.channels_list)>1:
            self.Merge.config(state=NORMAL)
        else:
            self.Merge.config(state=DISABLED)




        try:
            teszt=int(self.Tempo.get())
        except:
            self.Tempo.set(self.Tempo.get()[:-1])

        if self.box.get(0.0, END)=="\n":
            self.copybutton.config(state=DISABLED)
        else:
            self.copybutton.config(state=NORMAL)



        checkforchange=[]
        for elem in self.channels_avaiable:
            checkforchange.append(elem)
        checkforchange=tuple(checkforchange)


        self.channels_avaiable=[]
        for elem in self.channels_list:
            self.channels_avaiable.append(elem)
        if self.merged1!=[] and self.channel1.get()!="Merged1" and self.channel2.get()!="Merged1":
            self.channels_avaiable.insert(0, "Merged1")
        if self.merged2!=[] and self.channel1.get()!="Merged2" and self.channel2.get()!="Merged2":
            self.channels_avaiable.insert(0, "Merged2")

        self.channels_avaiable.insert(0,"None")
        try:
            self.channels_avaiable.remove(int(self.channel1.get()))
        except:
            pass
        try:
            self.channels_avaiable.remove(int(self.channel2.get()))
        except:
            pass
        try:
            self.channels_avaiable.remove(int(self.channel3.get()))
        except:
            pass
        try:
            self.channels_avaiable.remove(int(self.channel4.get()))
        except:
            pass

        self.channels_avaiable=tuple(self.channels_avaiable)

        self.available_ports = rtmidi.MidiOut().get_ports()

        if self.channels_avaiable == checkforchange:
            self.valtozott=False
        else:
            self.valtozott=True

        if self.valtozott==True:
            self.create_channelbuttons(master)


        if self.file_name=="":
            self.channel1.set("None")
            self.channel2.set("None")
            self.Menu_channel0.config(state=DISABLED)
            self.Menu_channel1.config(state=DISABLED)
            self.Auto.config(state=DISABLED)
            #self.ListenB.config(state=DISABLED)
        else:
            self.Menu_channel0.config(state=NORMAL)
            self.Menu_channel1.config(state=NORMAL)
            self.Auto.config(state=NORMAL)

            #self.ListenB.config(state=NORMAL)





        if self.channel1.get()=="None":
            self.Test_Button1.config(state=DISABLED)
            self.Convert_Button1.config(state=DISABLED)
        else:
            self.Test_Button1.config(state=NORMAL)
            self.Convert_Button1.config(state=NORMAL)

        if self.channel2.get()=="None":
            self.Test_Button2.config(state=DISABLED)
            self.Convert_Button2.config(state=DISABLED)

        else:
            self.Test_Button2.config(state=NORMAL)
            self.Convert_Button2.config(state=NORMAL)




        if self.channel1.get()=="Merged1" or self.channel1.get()=="Merged2":
            self.Test_Button1.config(state=DISABLED)
        if self.channel2.get()=="Merged1" or self.channel2.get()=="Merged2":
            self.Test_Button2.config(state=DISABLED)


        if self.channel1.get() == "None" and self.channel2.get() == "None" :
            self.ASM.config(state=DISABLED)
        else:
            self.ASM.config(state=NORMAL)
        global name
        name=self.file_name
        Ablak.after(250, self.checker, master)

    def open_midi(self):
        self.file_name = askopenfilename(initialdir="*", title="Open Midi", filetypes=(("midi (*.mid)", "*.mid"),))
        self.savename=self.file_name
        self.open_midi2()



    def open_sid(self):
        self.file_name = askopenfilename(initialdir="*", title="Open SID", filetypes=(("sid (*.sid)", "*.sid"),))
        self.savename=self.file_name

        batfile = open("temp.bat", "w")
        batfile.write('"sid2midi.exe" '+self.file_name+' '+str(self.file_name).replace("sid", "mid"))
        batfile.close()
        try:
            os.remove(str(self.file_name).replace("sid", "mid"))
        except:
            pass
        subprocess.call("temp.bat")
        self.file_name=str(self.file_name).replace("sid", "mid")
        self.open_midi2()
        os.remove("temp.bat")



    def open_midi2(self):
        try:
            self.channels_list = [0]
            self.merged1 = []
            self.merged2 = []

            self.channels_avaiable = [0]

            if self.forceit.get()==0:

                for track in mido.MidiFile(self.file_name).tracks:
                    for message in track:
                        try:
                            regex = re.findall(r'channel\=\d+\s', str(message))
                            regex = int(regex[0].replace('channel=', "").replace(" ", ""))
                            self.channels_list.append(int(regex))
                        except:
                            pass

            else:
                self.channels_list.append(0)
                self.channels_list.append(1)
                self.channels_list.append(2)
                self.channels_list.append(3)




            self.channel1.set("None")
            self.channel2.set("None")

            self.channels_list = set(self.channels_list)
            self.channels_list = list(self.channels_list)
            self.channels_list.sort()
            self.box.delete(0.0, END)
            self.box.config(state=DISABLED)

        except:
            MessageBox = messagebox.showerror("Import Error!", "Cannot open file!")



    def assembler(self):
        code1=""
        code2=""

        self.channel_number=0
        codetemp1=""
        codetemp2=""


        if self.channel1.get()!="None":
            codetemp1 = []

            if self.channel1.get()=="Merged1":
                codetemp1=[]
                for elem in self.merged1:
                    codetemp1.append(elem)
                codetemp1.pop()
            elif self.channel1.get()=="Merged2":
                codetemp1=[]
                for elem in self.merged2:
                    codetemp1.append(elem)
                codetemp1.pop()
            else:
                channeltoconvert = int(self.channel1.get())
                changechord = int(self.octave1.get()) * 12
                number=1
                SIDeffect=self.SID1.get()
                codetemp1 = self.ConvertChannel(channeltoconvert, changechord, SIDeffect)

        if self.channel2.get()!="None":
            codetemp2 = []

            if self.channel2.get() != "None":
                if self.channel2.get() == "Merged1":
                    codetemp2 = []
                    for elem in self.merged1:
                        codetemp2.append(elem)
                    codetemp2.pop()
                elif self.channel2.get() == "Merged2":
                    codetemp2 = []
                    for elem in self.merged2:
                        codetemp2.append(elem)
                    codetemp2.pop()
                else:
                    channeltoconvert = int(self.channel2.get())
                    changechord = int(self.octave2.get()) * 12
                    number=2
                    SIDeffect = self.SID2.get()
                    codetemp2 = self.ConvertChannel(channeltoconvert, changechord, SIDeffect)






        lenght={}
        uuu=[]
        if codetemp1!="":
            counter=0
            for elem in codetemp1:
                elem=int(elem.split('\n')[1].replace("\t",""))
                counter+=elem
            lenght.setdefault(1,counter)
            uuu.append(counter)
        if codetemp2!="":
            counter=0
            for elem in codetemp2:
                elem=int(elem.split('\n')[1].replace("\t",""))
                counter+=elem
            lenght.setdefault(2, counter)
            uuu.append(counter)



        uuu.sort(reverse=1)

        if codetemp1!="":
            dif=uuu[0]-lenght[1]
            while dif>0:
                if dif>255:
                    codetemp1.append("\t0, 0, 0\n\t255\n")
                    dif-=255
                else:
                    codetemp1.append("\t0, 0, 0\n\t"+str(dif)+"\n")
                    dif=0
            code = codetemp1
            number = 1
            code1 = self.convertcode(code, number)

        if codetemp2!="":
            dif=uuu[0]-lenght[2]
            while dif>0:
                if dif>255:
                    codetemp2.append("\t0, 0, 0\n\t255\n")
                    dif-=255
                else:
                    codetemp2.append("\t0, 0, 0\n\t"+str(dif)+"\n")
                    dif=0
            code = codetemp2
            number = 2
            code2 = self.convertcode(code, number)




        main_code = ".Declare_Variables\n"

        memoryaddress=[]
        number1=["8", "9", "a", "b", "c", "d", "e", "f"]
        number2=["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
        for a in number1:
            for b in number2:
                memoryaddress.append(a+b)





        segment=self.declare_code(code1, code2, memoryaddress)
        main_code=main_code+segment




        main_code=main_code+".Game\n"
        main_code=main_code+".Music_Player\n"



        main_code=main_code+".LoadNext1\n"
        if code1!="":
            number=1
            segment=self.load_channel(number)
            main_code=main_code+segment
        main_code = main_code + ".LoadNext2\n"

        if code2!="":
            number=2
            segment=self.load_channel(number)
            main_code=main_code+segment
        main_code=main_code+".LoadEnd\n"



        main_code = main_code + "\tJMP\t.Game\n"


        if code1 != "":
            main_code=main_code+code1
        if code2 != "":
            main_code=main_code+code2


        self.box.delete(0.0, END)
        self.box.insert(0.0, main_code)



    def convertcode(self, code, number):
        returncode=".MusicChannel_"+str(number)+"\n"
        for elem in code:
            volume = elem.split("\n")[0].split(",")[0].replace("\t", "")
            channel = elem.split("\n")[0].split(",")[1]
            frekv = elem.split("\n")[0].split(",")[2].replace(" ", "")
            duration = elem.split("\n")[1].replace("\t", "")
            if volume=="0":
                returncode=returncode+"\t.BYTE\t#0\n\t.BYTE\t#"+duration+"\n"
            else:
                volume_bin=bin(int(volume)).replace("0b","")
                volume_bin=str("0"*(4-len(volume_bin)))+volume_bin

                channel_bin=bin(int(channel)).replace("0b","")
                channel_bin=str("0"*(4-len(channel_bin)))+channel_bin

                returncode=returncode+"\t.BYTE\t#%"+str(channel_bin)+str(volume_bin)+"\n"+"\t.BYTE\t#"+frekv+"\n\t.BYTE\t#"+duration+"\n"
        returncode=returncode+"\t.BYTE\t#255\n"
        return(returncode)

    def declare_code(self, code1, code2, memoryaddress):
        memoryaddress_counter = 0
        code=""
        if code1!="":
            code = code + "Channel_1Duration = $" + str(memoryaddress[memoryaddress_counter]) + "\n"
            code = code + "Channel_1Counter = $" + str(memoryaddress[memoryaddress_counter + 1]) + "\t; This is a pointer, needs 16 bits.\n"
            memoryaddress_counter += 3
        if code2!="":
            code = code + "Channel_2Duration = $" + str(memoryaddress[memoryaddress_counter]) + "\n"
            code = code + "Channel_2Counter = $" + str(memoryaddress[memoryaddress_counter + 1]) + "\t; This is a pointer, needs 16 bits.\n"
            memoryaddress_counter += 3

        code = code + ".RestartMusic\n"
        code = code + "\tLDA\t#1\n"
        if code1!="":
            code = code + "\tSTA\tChannel_1Duration\n"
        if code2 != "":
            code = code + "\tSTA\tChannel_2Duration\n"
        if code1 != "":
            code = code + "\tLDA\t#<.MusicChannel_1\n\tSTA\tChannel_1Counter\n"
            code = code + "\tLDA\t#>.MusicChannel_1\n\tSTA\tChannel_1Counter+1\n"
        if code2!="":
            code = code + "\tLDA\t#<.MusicChannel_2\n\tSTA\tChannel_2Counter\n"
            code = code + "\tLDA\t#>.MusicChannel_2\n\tSTA\tChannel_2Counter+1\n"



        return(code)

    def load_channel(self, number):
        code=""
        code = code + "\tDEC\tChannel_"+str(number)+"Duration\n\tLDA\tChannel_"+str(number)+"Duration\n"
        if number==1:
            code = code + "\tBNE\t.LoadNext2\n"
        else:
            code = code + "\tBNE\t.LoadEnd\n"
        code = code + "\tLDX\t#Channel_"+str(number)+"Counter\n\tLDA\t(0,x)\n\tINC\t0,x\n\tBNE\t*+4\n\tINC	1,x\n"

        code = code + "\tCMP\t#255\n\tBNE\t.Not255_"+str(number)+"\n"
        code = code + "\tLDA\t#<.MusicChannel_"+str(number)+"\n\tSTA\tChannel_"+str(number)+"Counter\n"
        code = code + "\tLDA\t#>.MusicChannel_"+str(number)+"\n\tSTA\tChannel_"+str(number)+"Counter+1\n"
        code = code + "\tLDX\t#Channel_"+str(number)+"Counter\n\tLDA\t(0,x)\n\tINC\t0,x\n\tBNE\t*+4\n\tINC	1,x\n"

        code = code + ".Not255_"+str(number)+"\n"

        code = code + "\tSTA\tAUDV"+str(self.channel_number)+"\n"


        code = code + "\tCMP\t#0\n\tBEQ\t.GotoDuration"+str(number)+"\n"

        code = code + "\tlsr\n\tlsr\n\tlsr\n\tlsr\n"
        code = code + "\tSTA\tAUDC"+str(self.channel_number)+"\n"

        code = code + "\tLDX\t#Channel_"+str(number)+"Counter\n\tLDA\t(0,x)\n\tINC\t0,x\n\tBNE\t*+4\n\tINC	1,x\n"

        code = code + "\tSTA\tAUDF"+str(self.channel_number)+"\n"


        code = code + ".GotoDuration"+str(number)+"\n"
        code = code + "\tLDX\t#Channel_"+str(number)+"Counter\n\tLDA\t(0,x)\n\tINC\t0,x\n\tBNE\t*+4\n\tINC	1,x\n"

        code = code + "\tSTA\tChannel_" + str(number) + "Duration\n"
        self.channel_number+=1
        return(code)




    def merger(self):
        self.GGGGG=["None"]
        for elem in self.channels_list:
            self.GGGGG.append(elem)
        self.options=tuple(self.GGGGG)
        self.merge = Toplevel()
        self.merge.title("Merging Channels")
        root_x = Ablak.winfo_x()
        root_y = Ablak.winfo_y()
        root_width = Ablak.winfo_width()
        root_height = Ablak.winfo_height()
        self.merge.resizable(False, False)
        self.merge.geometry("%dx%d+%d+%d" % (640, 380, root_x + root_width / 2 - 220, root_y + root_height / 2 - 250))
        self.mergetext1=Label(self.merge, text="-=Primary Channel=-")
        self.mergetext1.place(x=20, y=5)
        self.mergetext2 = Label(self.merge, text="-=2nd Channel=-")
        self.mergetext2.place(x=146, y=5)
        self.mergetext3 = Label(self.merge, text="-=3rd Channel=-")
        self.mergetext3.place(x=252, y=5)
        self.mergetext4 = Label(self.merge, text="-=4rd Channel=-")
        self.mergetext4.place(x=358, y=5)
        self.mergetext5 = Label(self.merge, text="-=Result Channel=-")
        self.mergetext5.place(x=500, y=5)

        #self.forcer = IntVar()
        #self.forcerbox = Checkbutton(self.merge, variable=self.forcer, text="Force 'pure' channel")
        #self.forcerbox.place(x=21, y=335)

        self.octaveM = StringVar()
        self.octaveM.set("0")
        self.octaveM_fuck=StringVar()
        self.octaveM_fuck.set("0")


        self.octave_menu = OptionMenu(self.merge, self.octaveM, *self.octaves)
        self.octave_menu.config(width=2)
        self.octave_menu.place(x=23, y=335)
        self.octave_text = Label(self.merge, text="chords change.")
        self.octave_text.place(x=80, y=343)

        self.channel_1=StringVar()
        self.channel_2=StringVar()
        self.channel_3=StringVar()
        self.channel_4=StringVar()
        self.channel_1.set("None")
        self.channel_2.set("None")
        self.channel_3.set("None")
        self.channel_4.set("None")

        self.Merge_channel0=OptionMenu(self.merge, self.channel_1, *self.options)
        self.Merge_channel1=OptionMenu(self.merge, self.channel_2, *self.options)
        self.Merge_channel2=OptionMenu(self.merge, self.channel_3, *self.options)
        self.Merge_channel3=OptionMenu(self.merge, self.channel_4, *self.options)

        self.Merge_channel0.config(width=10)
        self.Merge_channel0.place(x=26, y=25)
        self.Merge_channel1.config(width=10)
        self.Merge_channel1.place(x=141, y=25)
        self.Merge_channel2.config(width=10)
        self.Merge_channel2.place(x=248, y=25)
        self.Merge_channel3.config(width=10)
        self.Merge_channel3.place(x=356, y=25)

        self.Listento1=Button(self.merge, text="Listen to Channel", command=self.Set_Test_1, state=DISABLED)
        self.Listento2=Button(self.merge, text="Listen to Channel", command=self.Set_Test_2, state=DISABLED)
        self.Listento3=Button(self.merge, text="Listen to Channel", command=self.Set_Test_3, state=DISABLED)
        self.Listento4=Button(self.merge, text="Listen to Channel", command=self.Set_Test_4, state=DISABLED)
        self.Listento1.place(x=27, y=55)
        self.Listento2.place(x=142, y=55)
        self.Listento3.place(x=249, y=55)
        self.Listento4.place(x=357, y=55)

        self.CheckCode1=tkscrolled.ScrolledText(self.merge, width=16, height=20, state=DISABLED, font=("Times New Roman", 7))
        self.CheckCode1.place(x=27, y=90)
        self.CheckCode2=tkscrolled.ScrolledText(self.merge, width=16, height=20, state=DISABLED, font=("Times New Roman", 7))
        self.CheckCode2.place(x=142, y=90)
        self.CheckCode3=tkscrolled.ScrolledText(self.merge, width=16, height=20, state=DISABLED, font=("Times New Roman", 7))
        self.CheckCode3.place(x=249, y=90)
        self.CheckCode4=tkscrolled.ScrolledText(self.merge, width=16, height=20, state=DISABLED, font=("Times New Roman", 7))
        self.CheckCode4.place(x=357, y=90)

        self.DoneCode=tkscrolled.ScrolledText(self.merge, width=18, height=20, state=DISABLED, font=("Times New Roman", 7))
        self.DoneCode.place(x=503, y=90)

        self.mergebutton=Button(self.merge, text="MERGE CHANNELS", command=self.mergethem, state=DISABLED)
        self.mergebutton.place(x=503, y=25)

        self.OKbutton=Button(self.merge, text="OK", width=15, command=self.OK, state=DISABLED)
        self.OKbutton.place(x=503, y=55)

        self.mergeselect=IntVar()
        self.mergeselect.set(1)

        self.mergeselector1=Radiobutton(self.merge, text="Set 'Merged1'", variable=self.mergeselect, value=1)
        self.mergeselector2=Radiobutton(self.merge, text="Set 'Merged2'", variable=self.mergeselect, value=2)

        self.automatic=IntVar()
        self.automatic.set(1)
        self.SIDm=IntVar()
        self.SIDm.set(0)
        self.SIDmbox=Checkbutton(self.merge, text="SID-effect", variable=self.SIDm)
        self.autobox=Checkbutton(self.merge, text="Automatic update", variable=self.automatic)

        self.SIDmbox.place(x=180, y=333)
        self.autobox.place(x=180, y=353)
        self.mergeselector1.place(x=505, y=333)
        self.mergeselector2.place(x=505, y=353)

        self.fuck1 = self.channel_1.get()
        self.fuck2 = self.channel_2.get()
        self.fuck3 = self.channel_3.get()
        self.fuck4 = self.channel_4.get()

        self.check_merger()

    def OK(self):
        self.merged_temp=self.DoneCode.get(0.0,END).split("\n")

        if self.mergeselect.get()==1:
            self.merged1=[]
            for number in range(0, len(self.merged_temp), 2):
                if self.merged_temp[number]!="" and self.merged_temp[number]!="\n":
                    self.merged1.append(str(self.merged_temp[number]+"\n"+self.merged_temp[number+1]+"\n"))

            if self.merged1[-1]=='\t255\n\n' or self.merged1[-1]=='\t255\n':
                self.merged1[-1]='\t255'
            self.merge.destroy()
        else:
            self.merged2 = []
            for number in range(0, len(self.merged_temp), 2):
                if self.merged_temp[number] != "" and self.merged_temp[number] != "\n":
                    self.merged2.append(str(self.merged_temp[number] + "\n" + self.merged_temp[number + 1] + "\n"))

            if self.merged2[-1] == '\t255\n\n' or self.merged2[-1] == '\t255\n':
                self.merged2[-1] = '\t255'
            self.merge.destroy()

    def Set_Test_1(self):
        try:
            channeltoplay=int(self.channel_1.get())
            self.Channel_Test(channeltoplay)
        except:
            pass
    def Set_Test_2(self):
        try:
            channeltoplay=int(self.channel_2.get())
            self.Channel_Test(channeltoplay)
        except:
            pass
    def Set_Test_3(self):
        try:
            channeltoplay=int(self.channel_3.get())
            self.Channel_Test(channeltoplay)
        except:
            pass
    def Set_Test_4(self):
        try:
            channeltoplay=int(self.channel_4.get())
            self.Channel_Test(channeltoplay)
        except:
            pass

    def check_merger(self):

        if self.DoneCode.get(0.0,END)!="" and self.DoneCode.get(0.0,END)!="\n":
            self.OKbutton.config(state=NORMAL)
        else:
            self.OKbutton.config(state=DISABLED)



        if self.channel_1.get()!="None":
            self.Listento1.config(state=NORMAL)
        else:
            self.Listento1.config(state=DISABLED)
            self.CheckCode1.delete(0.0, END)
            self.CheckCode1.config(state=DISABLED)

        if self.channel_2.get()!="None" :
            self.Listento2.config(state=NORMAL)
        else:
            self.Listento2.config(state=DISABLED)
            self.CheckCode2.delete(0.0, END)
            self.CheckCode2.config(state=DISABLED)


        if self.channel_3.get()!="None" :
            self.Listento3.config(state=NORMAL)
        else:
            self.Listento3.config(state=DISABLED)
            self.CheckCode3.delete(0.0, END)
            self.CheckCode3.config(state=DISABLED)


        if self.channel_4.get()!="None" :
            self.Listento4.config(state=NORMAL)
        else:
            self.Listento4.config(state=DISABLED)
            self.CheckCode4.delete(0.0, END)
            self.CheckCode4.config(state=DISABLED)

        if self.channel_1.get()!=self.fuck1 and self.channel_1.get()!="None":
            self.CheckCode1.config(state=NORMAL)
            self.CheckCode1.delete(0.0, END)

            try:

                channeltoconvert = int(self.channel_1.get())
                changechord = int(self.octaveM.get()) * 12
                SIDeffect = self.SIDm.get()
                code = self.ConvertChannel(channeltoconvert, changechord, SIDeffect)
                code.append("\t255")
                self.CheckCode1.config(state=NORMAL)
                self.CheckCode1.delete(0.0, END)
                for line in code:
                    self.CheckCode1.insert(END, line)
            except:
                pass

        if self.channel_2.get()!=self.fuck2 and self.channel_2.get()!="None":
            self.CheckCode2.config(state=NORMAL)
            self.CheckCode2.delete(0.0, END)

            try:
                channeltoconvert = int(self.channel_2.get())
                changechord = int(self.octaveM.get()) * 12
                SIDeffect = self.SIDm.get()
                code = self.ConvertChannel(channeltoconvert, changechord, SIDeffect)
                code.append("\t255")

                for line in code:
                    self.CheckCode2.insert(END, line)
            except:
                pass

        if self.channel_3.get()!=self.fuck3 and self.channel_3.get()!="None":
            self.CheckCode3.config(state=NORMAL)
            self.CheckCode3.delete(0.0, END)

            try:
                channeltoconvert = int(self.channel_3.get())
                changechord = int(self.octaveM.get()) * 12
                SIDeffect = self.SIDm.get()
                code = self.ConvertChannel(channeltoconvert, changechord, SIDeffect)
                code.append("\t255")

                for line in code:
                    self.CheckCode3.insert(END, line)
            except:
                pass

        if self.channel_4.get()!=self.fuck4 and self.channel_4.get()!="None":
            self.CheckCode4.config(state=NORMAL)
            self.CheckCode4.delete(0.0, END)

            try:
                channeltoconvert = int(self.channel_4.get())
                changechord = int(self.octaveM.get()) * 12
                SIDeffect = self.SIDm.get()
                code = self.ConvertChannel(channeltoconvert, changechord, SIDeffect)
                code.append("\t255")

                for line in code:
                    self.CheckCode4.insert(END, line)
            except:
                pass


        KUTYA=0
        if self.channel_1.get()!="None":
            KUTYA+=1
        if self.channel_2.get()!="None":
            KUTYA+=1
        if self.channel_3.get()!="None":
            KUTYA+=1
        if self.channel_4.get()!="None":
            KUTYA+=1

        if KUTYA>1:
            self.mergebutton.config(state=NORMAL)
        else:
            self.mergebutton.config(state=DISABLED)

        if self.octaveM.get()!=self.octaveM_fuck.get() and self.automatic.get()==1:
            self.updateall()


        self.fuck1 = self.channel_1.get()
        self.fuck2 = self.channel_2.get()
        self.fuck3 = self.channel_3.get()
        self.fuck4 = self.channel_4.get()
        self.octaveM_fuck.set(self.octaveM.get())

        self.merge.after(250, self.check_merger)


    def updateall(self):
        if self.channel_1.get()!="None":
            self.CheckCode1.config(state=NORMAL)
            self.CheckCode1.delete(0.0, END)
            try:

                channeltoconvert = int(self.channel_1.get())
                changechord = int(self.octaveM.get()) * 12
                SIDeffect=self.SIDm.get()
                code = self.ConvertChannel(channeltoconvert, changechord, SIDeffect)
                code.append("\t255")
                self.CheckCode1.config(state=NORMAL)
                self.CheckCode1.delete(0.0, END)
                for line in code:
                    self.CheckCode1.insert(END, line)
            except:
                pass

        if self.channel_2.get()!="None":
            self.CheckCode2.config(state=NORMAL)
            self.CheckCode2.delete(0.0, END)

            try:

                channeltoconvert = int(self.channel_2.get())
                changechord = int(self.octaveM.get()) * 12
                SIDeffect = self.SIDm.get()
                code = self.ConvertChannel(channeltoconvert, changechord, SIDeffect)
                code.append("\t255")
                self.CheckCode2.config(state=NORMAL)
                self.CheckCode2.delete(0.0, END)
                for line in code:
                    self.CheckCode2.insert(END, line)
            except:
                pass
        if self.channel_3.get()!="None":
            self.CheckCode3.config(state=NORMAL)
            self.CheckCode3.delete(0.0, END)

            try:

                channeltoconvert = int(self.channel_3.get())
                changechord = int(self.octaveM.get()) * 12
                SIDeffect = self.SIDm.get()
                code = self.ConvertChannel(channeltoconvert, changechord, SIDeffect)
                code.append("\t255")
                self.CheckCode3.config(state=NORMAL)
                self.CheckCode3.delete(0.0, END)
                for line in code:
                    self.CheckCode3.insert(END, line)
            except:
                pass
        if self.channel_4.get()!="None":
            self.CheckCode4.config(state=NORMAL)
            self.CheckCode4.delete(0.0, END)

            try:

                channeltoconvert = int(self.channel_4.get())
                changechord = int(self.octaveM.get()) * 12
                SIDeffect = self.SIDm.get()
                code = self.ConvertChannel(channeltoconvert, changechord, SIDeffect)
                code.append("\t255")
                self.CheckCode4.config(state=NORMAL)
                self.CheckCode4.delete(0.0, END)
                for line in code:
                    self.CheckCode4.insert(END, line)
            except:
                pass

    def mergethem(self):
        self.merged_temp={}
        self.DoneCode.config(state=NORMAL)
        self.DoneCode.delete(0.0, END)

        if self.channel_1.get()!="None":
            code=str(self.CheckCode1.get(0.0, END)).split("\n")
            self.MMMerge(code)
        if self.channel_2.get()!="None":
            code=str(self.CheckCode2.get(0.0, END)).split("\n")
            self.MMMerge(code)
        if self.channel_3.get()!="None":
            code=str(self.CheckCode3.get(0.0, END)).split("\n")
            self.MMMerge(code)
        if self.channel_4.get()!="None":
            code=str(self.CheckCode4.get(0.0, END)).split("\n")
            self.MMMerge(code)

        self.BringZeroToEnd()
        self.DeMerge()


    def MMMerge(self, code):
        try:
            counter = 0
            for number in range(0, len(code), 2):
                duration = int(code[number + 1].replace("\t", ""))

                for YYY in range(counter, counter + duration):
                    self.merged_temp.setdefault(YYY, [])
                    if code[number]!="\t0, 0, 0":
                        self.merged_temp[YYY].append(code[number])
                counter += duration
        except:
            pass


    def BringZeroToEnd(self):
        for number in range(0, len(self.merged_temp)):
            if len(self.merged_temp[number])>0:
                while self.merged_temp[number][0]=="\t0, 0, 0":
                    if len(self.merged_temp[number])>1:
                        self.merged_temp[number].pop(0)
                    else:
                        break


    def DeMerge(self):
        duration=1
        code=[]
        for number in range(0, len(self.merged_temp)):
            try:

                if self.merged_temp[number]!=[] and self.merged_temp[number+1]!=[]:
                    if self.merged_temp[number][0]==self.merged_temp[number+1][0]:
                        duration+=1
                    else:
                        code.append(str(self.merged_temp[number][0]) + "\n\t" + str(duration) + '\n')
                        duration=1
                elif self.merged_temp[number]!=[] and self.merged_temp[number+1]==[]:
                    code.append(str(self.merged_temp[number][0]) + "\n\t" + str(duration) + '\n')
                    duration = 1
                elif self.merged_temp[number]==[] and self.merged_temp[number+1]!=[]:
                    code.append(str("\t0, 0, 0\n\t" + str(duration) + '\n'))
                    duration = 1
                elif self.merged_temp[number] == [] and self.merged_temp[number + 1] ==[]:
                    duration+=1
            except:
                try:
                    code.append(str(self.merged_temp[number][0]) + "\n\t" + str(duration) + '\n')
                except:
                    pass

        code=self.CheckForZeroError(code)
        code=self.Check_for_255(code)
        code=self.Check_for_Zero(code)
        code=self.Add_Fadeout(code)
        code.append("\t255")
        #code=self.MergeDoubleZeros(code)
        #code=self.Check_for_255(code)
        for elem in code:
            self.DoneCode.insert(END, elem)

if __name__ == "__main__":
    Ablak = Tk()
    Ablak.title("Miditari MIDI and SID to TIA converter v0.11")
    Ablak.geometry("375x695")
    Ablak.resizable(False,False)
    Felul = Felulet(Ablak)
    name=""
    Ablak.mainloop()
    try:
        os.remove("temp.mid")
    except:
        pass

    try:
        name=name.replace("mid", "sid")
        nyehh=open(name, "r")
        nyehh.close()
        name = name.replace("sid", "mid")
        os.remove(name)
    except:
        pass

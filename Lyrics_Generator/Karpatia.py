class GetContent:


    def __init__(self):
        import os


        self.albums=[]
        self.titles=[]
        self.songs=[]
        self.baseurl = "http://www.zeneszoveg.hu/"

        self.GetAlbumTitles()
        print("Albumlinkek letöltve.")
        for title in self.albums:
            self.GetTitles(title)
        print("Zeneszám linkek letöltve.")
        for title in self.titles:
            self.GetSongs(title)
        print("Dalszövegek letöltve.")

        del self.albums
        del self.titles

        self.songs.append(open("extra.txt").read())
        print("Manuálisan letöltött dalszövegek betöltve.")
        print("Dalok kimentése későbbi használathoz...")

        file=open('raw.txt', 'w')
        for dal in self.songs:
            file.write(dal)
        file.close()

    def GetAlbumTitles(self):
        import requests
        import re

        Text=requests.get("http://www.zeneszoveg.hu/egyuttes/1068/karpatia--dalszovegei.html").text
        Regex=re.findall(r'href="album\/[a-zA-Z0-9\.\/-]+" title="Kárpátia', Text)
        for album in Regex:
            self.albums.append(self.baseurl+album.replace('href="','').replace('" title="Kárpátia',''))

    def GetTitles(self, title):
        import requests
        import re

        Text = requests.get(title).text
        Regex = re.findall(r'href="dalszoveg\/[a-zA-Z0-9\.\/-]+" title="Kárpátia', Text)
        for album in Regex:
            self.titles.append(self.baseurl + album.replace('href="', '').replace('" title="Kárpátia', '').replace('eloado', 'karpatia-'))

    def GetSongs(self, title):
        import requests
        import re

        while True:
            try:
                Text = requests.get(title).text
                Text.replace("'", "")
                Regex = re.findall(r'<div class="lyrics-plain-text">[˝\s\nA-Z-a-z0-9áéűúőóüöíÉÁŰÚŐÓÜÖÍ,<\/>!.:?"()]+<!--', Text)
                if len(Regex)==0:
                    print("Sikertelen letöltés: "+title)
                else:
                    Regex[0]=re.sub('\s+', ' ', Regex[0])
                    self.songs.append(
                        Regex[0].replace('<div class="lyrics-plain-text">', '').replace('<!--', '').replace('<br>', '').replace(
                            '</br>', '\n').replace('<br />','\n').replace(',', '\n'))
                break
            except:
                print("Kiszolgáló nem válaszolt, új próbálkozás!")


class CreateText:
    def __init__(self, songs):
        import os

        if os.path.exists('dalok.txt') is False:
            self.songs=songs
            Text=""
            for song in self.songs:
                Text=Text+song
            file = open('dalok.txt', 'w')
            file.write(Text)
            file.close()
        else:
            Text=songs

        print("Mihaszna írásjelek törlése...")
        Text=Text.replace('\n', ' ').replace("<", "").replace(">","").replace(',', '').replace('?', '').replace('!', '').replace('(', '').replace(')', '').replace('.', '').lower()
        Text=Text.replace("</div","").replace("Refrén:", "").replace(",", "\n")
        Text=Text.split(' ')
        while True:
            try:
                Text.remove('')
            except:
                break

        print("Rövid szavak törlése...")
        Text=self.Remove_Short(Text)
        print("Hasonló szavak szűrése...")
        Text=self.Remove_Similar(Text)
        del Text[360]
        """print("Ritka (15<) szavak törlése...")
        for num in range(1, 15):
            try:
                del Text[num]
            except:
                pass"""

        self.Text = Text

    def Remove_Short(self, Text):
        New_List=[]
        for word in Text:
            if len(word)>2:
                New_List.append(word)

        return(New_List)

    def Remove_Similar(self, Text):
        import os
        import subprocess
        file=open("temp.txt", "w")
        for word in Text:
            file.write(word)
            file.write('\n')

        file.close()
        subprocess.call('SzoSzuro.exe', creationflags=0x08000000)
        Text=open("tempout.txt", "r").read().split("\n")
        os.remove("temp.txt")
        #os.remove("tempout.txt")
        How=[]
        Dict={}
        for line in Text:
            temp=line.split(" ")
            if len(temp)!=2:
                continue
            How.append(int(temp[1]))
        How.sort(reverse=1)
        for key in How:
            Dict[key]=[]
        for line in Text:
            temp=line.split(" ")
            if len(temp)!=2:
                continue
            Dict[int(temp[1])].append(temp[0])

        file=open("wprds.csv", "w")


        return(Dict)

"""
class Generator:
    def __init__(self):
        self.Text=CreateText.Text
        self.lines=open("raw.txt", "r").read().replace(",", "\n").split("\n")
        self.max=0
        for num in self.Text.keys():
            if num>self.max:
                self.max=num

        while True:
            try:
                number = int(input("Hány Kárpátia dalt óhajt generálni?> "))
                break
            except:
                print("Egész számot kérek!")
        number=abs(number)
        track=1
        import os
        for void in range(0,number):
            while os.path.exists(str("dalok/{0:04d}.txt".format(track))):
                track+=1
            file=open(str("dalok/{:04d}.txt".format(track)), "w")
            file.write(self.do_song())
            file.close()


    def do_song(self):
        from datetime import datetime
        song=""

        number_of_lines=(int((str(datetime.now()).split(".")[1])))%7
        number_of_lines+=4
        if number_of_lines%2==1:
            number_of_lines+=1

        if ((int((str(datetime.now()).split(".")[1])))%100)>49:
            number_of_lines_chorus=number_of_lines
        else:
            number_of_lines_chorus=number_of_lines-2

        self.line_lenght=0
        self.song=self.CreateVerse(number_of_lines, 0)+"\n"
        print("*")
        self.song=self.song+"Refrén:\n"+self.CreateVerse(number_of_lines_chorus, 0)
        print("**")
        self.song = self.song+"\n"+self.CreateVerse(number_of_lines, self.line_lenght)+"\nRefrén\n\n"
        print("***")
        self.song = self.song +self.CreateVerse(2,0)+"\nRefrén"

        print(self.song)
        return(self.song)


    def CreateVerse(self, line_number, line_lenght):
        import re
        verse=""
        last3 = ""
        last3_2 = ""
        for num in range(0,line_number):
            done=False
            while True:
                minus=2
                countdown=len(self.lines)-1
                if num==0:
                    for iii in range(0, len(self.lines)):
                        line=self.lines[iii]
                        keyword = self.Getword()

                        if (iii==len(self.lines)-1):
                            print(num, keyword)
                            if minus<4:
                                minus+=1

                        if len(re.findall(keyword[0:3], line))>0:
                            L = 0
                            for letter in line:
                                if letter in "aáeéiíoóöőuúüű":
                                    L += 1
                            if self.line_lenght!=0 and self.line_lenght!=L:
                                continue
                            verse=line+"\n"
                            last3=line.replace(",", "").replace(".","").replace("?", "").replace("!","")[-4:-1]
                            self.line_lenght=L


                            done=True
                            break
                    if done==True:
                        break
                else:
                    for iii in range(0, len(self.lines)):
                        line=self.lines[iii]
                        keyword = self.Getword()

                        if (iii==len(self.lines)-1):
                            print(num, keyword)
                            if minus<4:
                                minus+=1


                        if len(re.findall(keyword[0:3], line))>0:

                            test=line.replace(",", "").replace(".","").replace("?", "").replace("!","")[-4:-1]


                            if num%2==0 and last3!=test:
                                continue
                            if num%2==1 and num>1 and last3_2!=test:
                                continue
                            L2 = 0
                            for letter in line:
                                if letter in "aáeéiíoóöőuúüű":
                                    L2 += 1
                            if abs(L-L2)>minus:
                                continue
                            if (len(re.findall(line, verse))==True):
                                continue

                            if num==1:
                                last3_2=test
                            verse=verse+line+"\n"
                            done=True
                            break

                    if done==True:
                        break

        return(verse)

    def Getword(self):
        num=self.random_number_for_words()
        while True:
            try:
                word=list(set(self.Text[num]))[0]
                break
            except:
                num=num+1

        return(word)

    def random_number_for_words(self):
        from datetime import datetime
        import time
        max=int(str(datetime.now()).split(".")[1])%(self.max+len(self.Text))
        if max>self.max:
            max=self.max

        min=((int(str(datetime.now()).split(".")[1]))<<12)%123

        step=int(str(datetime.now()).split(".")[1])%17

        multi=int(str(datetime.now()).split(".")[1])%11*35>>22
        XXX=1
        result=min
        while multi>0:
            result=result+step
            if result>max:
                result=min+(XXX*(result%19))-step
                XXX+=1
            multi=multi-1
        result=max-result+min
        #if result > max:
        #    result=max-min
        return(result)
"""

class CreateBigDic:
    def __init__(self):
        self.Text=CreateText.Text
        self.lines = open("raw.txt", "r").read().replace(",", "\n").split("\n")
        self.BIG={}
        counter=0
        print("NAGY adatbázis generálása...")
        for key in self.Text:
            for value in self.Text[key]:
                self.BIG[value.replace(".","").replace(" ","")]=[]

        print("Szópárok keresése...")

        #Empty=[]

        for line in self.lines:
            templine=line.split(' ')
            for key in self.BIG:
                for i in range(0, len(templine)-1):
                    word=templine[i]
                    if word==key:
                        counter+=1
                        if len(templine[i+1].replace(".","").replace(" ","").replace("2x","").replace("2-szer", ""))>2:
                            self.BIG[key].append(templine[i+1].replace(".","").replace(" ","").replace("2x","").replace("2-szer", ""))
                        """self.BIG[key].sort(reverse=1)
                        while True:
                            Done=False
                            for num in range(1, len(self.BIG[key])+1):
                                if num==len(self.BIG[key]):
                                    Done=True
                                    break
                                if self.BIG[key][num-1]==self.BIG[key][num]:
                                    self.BIG[key].pop(num)
                                    break

                            if Done==True:
                                break"""
                #if self.BIG[key]==[]:
                 #   Empty.append(key)

        """for key in Empty:
            try:
                del self.BIG[key]
            except:
                pass"""
        #for key in self.BIG:
         #   print(key,"-",self.BIG[key])
        delete_list=[]
        print("Sehova nem vezető szavak törlése...")
        for key in self.BIG:
            for value in self.BIG[key]:
                if value not in self.BIG.keys():
                    delete_list.append(value)
        for item in delete_list:
            for key in self.BIG:
                try:
                    while True:
                        self.BIG[key].remove(item)
                except:
                    pass
        del delete_list


class FoReal:
    def __init__(self):
        self.BIG=BigDic.BIG
        self.Text=CreateText.Text

        while True:
            try:
                number = int(input("Hány Kárpátia dalra van szüksége a Hazának?> "))
                break
            except:
                print("Egész számot kérek!")
        number = abs(number)
        track = 1
        import os
        for void in range(0, number):
            while os.path.exists(str("dalok/{0:04d}.txt".format(track))):
                track += 1
            file = open(str("dalok/{:04d}.txt".format(track)), "w")
            file.write(self.do_song())
            file.close()



    def do_song(self):
            self.song=""
            self.verse_line_len = 0
            self.chorus_line_len = 0
            self.short_lin_len = 0
            self.verse_line_num = 0
            self.chorus_line_num = 0
            self.short_line_num = 0

            self.ShitList=[]
            for key in self.Text:
                for i in range(1, len(self.Text[key])):
                    self.ShitList.append(self.Text[key][i])
            #print(len(self.ShitList))

            self.DoTheJob()
            self.song=self.DoVerse(self.verse_line_num, self.verse_line_len)
            self.song=self.song+"\nRefrén:\n\n"
            self.song=self.song+self.DoVerse(self.chorus_line_num, self.chorus_line_len)
            self.song=self.song+"\n"
            self.song=self.song+self.DoVerse(self.verse_line_num, self.verse_line_len)
            self.song=self.song+"\nRefrén\n\n"
            self.song=self.song+self.DoVerse(self.short_line_num, self.short_line_len)
            self.song=self.song+"\nRefrén\n"


            print("--- \m|.>_<.|m/ ---")
            print(self.song.replace("xxx", "\n"))
            return(self.song)

    """def DoVerse(self, the_num, the_len):
        import random
        import requests
        import re
        import difflib
        from datetime import datetime

        try:
            html = requests.get(
            "https://www.random.org/integers/?num=1&min=1&max=" + "999" + "&col=5&base=10&format=html&rnd=new").text
            random.seed(int(re.findall(r'\d+', (re.findall(r'<pre class="data">\d+\s+<\/pre>', html)[0]))[0]))
        except:
            random.seed(int(str(datetime.now()).split(".")[1][-4:-1]))
        Last3_1 = ""
        Last3_2 = ""
        verse = ""
        prevWord=""

        for linenum in range(1, the_num+1):
            line=self.StartingWord()
            prevWord=line
            trial=0
            while True:
                if prevWord not in self.BIG:
                    print(linenum, "Prev nem volt benne a szótárban!", prevWord)
                    trial+=1
                    prevWord = self.StartingWord()
                if trial>100:
                    while True:
                        try:
                            newWord = self.ShitList[int(str(datetime.now()).split(".")[1][-5:-1])].replace(",", "").replace(".","").replace(" ","")
                            trial=0
                            print("Helyettesítő kifejezés:", newWord)
                            break
                        except:
                            pass
                else:
                    try:
                        newWord = self.BIG[prevWord][random.randint(1, len(self.BIG[prevWord]) - 1)]
                    except:
                        while True:
                            try:
                                newWord = self.BIG[random.randint(1, len(self.BIG)+1)]
                                break
                            except:
                                pass

                if (the_len - self.LineLenght(line) > 2):
                    if newWord not in self.BIG:
                        print(linenum, "New nincs a szótárban!", newWord)
                        self.BIG[newWord]=[]


                    if self.BIG[newWord]==[]:
                        print(linenum, "New után nem jön semmi!", newWord, self.BIG[newWord])
                        trial += 1

                        while True:
                            try:
                                newWord = difflib.get_close_matches(newWord, self.ShitList)
                                newWord=newWord[random.randint(0,len(newWord))-1]
                                trial = 0
                                print("Helyettesítő kifejezés:", newWord)
                                break
                            except:
                                pass


                line=line+" "+newWord

                if (the_len-self.LineLenght(line)<3):
                    if (self.LineLenght(line)-the_len)>2:
                        line=line.split(' ')
                        line.pop()
                        line = " ".join(line)
                        print(linenum, "Túlnyúlt!")
                        trial += 1
                        continue

                    if linenum==1:
                        Last3_1=line[-3:]

                    elif linenum==2:
                        Last3_2=line[-3:]
                    elif linenum%2==1:
                        if line[-3:]!=Last3_1:
                            if trial > 50:
                                Last3_1 = line[-3:]
                            else:
                                line = line.split(' ')
                                line.pop()
                                line = " ".join(line)
                                print(linenum, "Nem rímel! (páratlan)", newWord , Last3_1)
                                trial += 1
                                continue
                    else:
                        if line[-3:]!=Last3_2:
                            if trial > 50:
                                Last3_2 = line[-3:]
                            else:
                                line = line.split(' ')
                                line.pop()
                                line = " ".join(line)
                                print(linenum, "Nem rímel! (páros)", newWord, Last3_2)
                                trial += 1
                                continue

                    prevWord = newWord
                    print(line)
                    print(linenum, ". sor kész.")

                    trial=0
                    verse=verse+line+"\n"
                    break
                else:
                    prevWord = newWord
        verse=re.sub(r'\s+', " ", verse)

        return(verse)"""

    def DoVerse(self, the_num, the_len):
        import random
        import requests
        import re
        from datetime import datetime
        import difflib
        try:
            html = requests.get(
            "https://www.random.org/integers/?num=1&min=1&max=" + "999" + "&col=5&base=10&format=html&rnd=new").text
            random.seed(int(re.findall(r'\d+', (re.findall(r'<pre class="data">\d+\s+<\/pre>', html)[0]))[0]))
        except:
            random.seed(int(str(datetime.now()).split(".")[1][-4:-1]))
        verse = ""
        prevWord=""
        for linenum in range(1, the_num+1):
            try:
                if prevWord!="" and len(self.BIG[prevWord])>2:
                    line=self.BIG[prevWord][random.randint(1, len(self.BIG[prevWord]) - 1)]
                else:
                    GRRRR
            except:
                line=self.StartingWord()



            if self.LineLenght(line)>8:
                #print(line)
                verse = verse + line + "xxx"
                linenum+=1
                continue

            prevWord=line
            while True:
                try:
                    newWord = self.BIG[prevWord][random.randint(1, len(self.BIG[prevWord]) - 1)]
                except:
                    newWord = self.ShitList[random.randint(0, len(self.ShitList)-1)]


                if (the_len - self.LineLenght(line) > 2) and self.BIG[newWord]==[]:
                        #print(linenum, "New után nem jön semmi!", newWord, self.BIG[newWord])
                        try:
                            ind = self.BIG[prevWord].index(newWord)
                        except:
                            try:
                                ind = random.randint(0, len(self.BIG[prevWord])-1)
                            except:
                                ind= random.randint(0, 10)
                        newWord = self.GetOther(ind, prevWord, newWord)
                        #print("Sorban következő kifejezés:", newWord)

                line=line+" "+newWord

                if (the_len-self.LineLenght(line)<3):
                    if (self.LineLenght(line)-the_len)>2:
                        line=line.split(' ')
                        line.pop()
                        line = " ".join(line)
                        #print(linenum, "Túlnyúlt!")
                        continue
                    prevWord = newWord
                    verse=verse+line+"xxx"
                    break
                else:
                    prevWord = newWord
                    continue
        verse=re.sub(r'\s+', " ", verse)
        verse=verse.replace("xxx","\n")

        verse=self.FindSimilar(verse)


        return(verse)

    def getlines(self):
        lines=open("dalok.txt", "r").read().replace("<", "").replace(">","").replace(',', '').replace('?', '').replace('!', '').replace('(', '').replace(')', '').replace('.', '').lower()
        lines=lines.replace("</div","").replace("Refrén:", "").replace(",", "\n")
        lines=lines.split("\n")
        lines=list(set((lines)))
        return(lines)


    def FindSimilar(self, verse):
        import difflib

        verse=verse.split("\n")
        lines=self.getlines()
        new_verse=""

        for sor in verse:
            zzz=difflib.get_close_matches(sor, lines)
            if len(zzz)==0:
                new_verse=new_verse+sor+"\n"
            else:
                new_verse=new_verse+self.tryelse(sor, lines)+"\n"

        new_verse=self.twolines(new_verse, lines)
        new_verse=self.Rhymes(new_verse, lines)

        return(new_verse)

    def twolines(self, new_verse, lines):
        import difflib

        new_verse=new_verse.split("\n")
        double_verse=[]
        double_lines=[]
        try:
            for num in range(0, len(new_verse),2):
                double_verse.append(str(new_verse[num]+"\n"+new_verse[num+1]))
        except:
            pass
        try:
            for num in range(0, len(lines),2):
                double_lines.append(str(lines[num]+"\n"+lines[num+1]))
        except:
            pass

        new_verse=""
        for pair in double_verse:

            temp=difflib.get_close_matches(pair, double_lines)
            if len(temp)>0:
                temp2=[]
                hossz=self.LineLenght(pair)
                for elem in temp:
                    print(abs(self.LineLenght(elem)-hossz))
                    if abs(self.LineLenght(elem)-hossz)<4:
                        temp2.append(elem)
                if len(temp2)>0:
                    new_verse=new_verse+temp2[0]+"\n"
                else:
                    new_verse = new_verse + pair + "\n"
            else:
                new_verse=new_verse+pair+"\n"

        if len(new_verse)%2==1:
            double_verse.append(new_verse[-1])

        if len(lines)%2==1:
            double_verse.append(lines[-1])

        return(new_verse)

    def tryelse(self, sor, lines):
        sor=sor.split(" ")
        new_sor=""
        templine = []
        for line in lines:
            line = line.split(" ")
            try:
                for num2 in range(0, len(line)):
                    templine.append(str(line[num2] + " " + line[num2 + 1]))
            except:
                pass

        for num in range(0, len(sor), 2):
            import difflib
            try:
                temp_sor = sor[num]+ " " + sor[num+1]
                tempest=difflib.get_close_matches(temp_sor, templine)
                if len(tempest)>0:
                    new_sor=new_sor+" "+tempest[0]
                else:
                    new_sor=new_sor+" "+temp_sor
            except:
                pass


        if len(sor)%2==1:
            new_sor=new_sor+" "+sor[-1]
        #print(new_sor)
        return(new_sor)


    def Rhymes(self, new_verse, lines):
        import difflib
        words=[]
        for line in lines:
            temp=line.split(' ')
            for w in temp:
                words.append(w)

        words=list(set(words))

        temp_lines=new_verse.split("\n")
        new_verse=""
        counter=1
        last1=[]
        last2=[]
        success=0
        for line in temp_lines:
            szavak=line.split(" ")
            szavak2=[]
            for szo in szavak:
                if szo!="":
                    szavak2.append(szo)

            if len(szavak2)==0:
                continue

            if counter==1:
                if szavak2[-1][-1] in "aáeéiíoóöőuúüű":
                    last1.append(szavak2[-1][-1])
                    last1.append(-1)
                elif szavak2[-1][-2] in "aáeéiíoóöőuúüű":
                    last1.append(szavak2[-1][-3:])
                    last1.append(-2)
                else:
                    last1.append(szavak2[-1][-5:])
                    last1.append(-5)
            elif counter==2:
                if szavak2[-1][-1] in "aáeéiíoóöőuúüű":
                    last2.append(szavak2[-1][-1])
                    last2.append(-1)
                elif szavak2[-1][-2] in "aáeéiíoóöőuúüű":
                    last2.append(szavak2[-1][-3:])
                    last2.append(-2)
                else:
                    last2.append(szavak2[-1][-5:])
                    last2.append(-5)
            elif counter%2==1:
                if last1[1]==-1:
                    if szavak2[-1][-1]!=last1[0]:

                        temp=difflib.get_close_matches(szavak2[-1], words)
                        if len(temp)>0:
                            for szo in temp:
                                if szo[-1] == last1[0]:
                                    szavak2[-1]=temp[-1]
                                    success+=1

                elif last1[1]==-2:
                    if szavak2[-1][-1]!=last1[0]:

                        temp=difflib.get_close_matches(szavak2[-1], words)
                        if len(temp)>0:
                            for szo in temp:
                                if szo[-2] == last1[0]:
                                    szavak2[-1]=temp[-1]
                                    success+=1


                elif last1[1]==-5:
                    if szavak2[-1][-1]!=last1[0]:

                        temp=difflib.get_close_matches(szavak2[-1], words)
                        if len(temp)>0:
                            for szo in temp:
                                if szo[-5:] == last1[0]:
                                    szavak2[-1]=temp[-1]
                                    success+=1


            else:
                if last2[1]==-1:
                    if szavak2[-1][-1]!=last1[0]:

                        temp=difflib.get_close_matches(szavak2[-1], words)
                        if len(temp)>0:
                            for szo in temp:
                                if szo[-1] == last2[0]:
                                    szavak2[-1]=temp[-1]
                                    success+=1


                elif last2[1]==-2:
                    if szavak2[-1][-1]!=last2[0]:

                        temp=difflib.get_close_matches(szavak2[-1], words)
                        if len(temp)>0:
                            for szo in temp:
                                if szo[-2] == last2[0]:
                                    szavak2[-1]=temp[-1]
                                    success+=1


                elif last2[1]==-5:
                    if szavak2[-1][-1]!=last2[0]:

                        temp=difflib.get_close_matches(szavak2[-1], words)
                        if len(temp)>0:
                            for szo in temp:
                                if szo[-5:] == last2[0]:
                                    szavak2[-1]=temp[-1]
                                    success+=1

            print(success)
            new_verse=new_verse+" ".join(szavak2)+"\n"
            counter+=1


        return(new_verse)


    def GetOther(self, id, prevWord, newWord):
        import difflib
        import random

        fos=list(set(self.BIG[prevWord]))
        temp=newWord
        while temp == newWord:
            try:
                if len(self.BIG[prevWord])<3:
                    EEEEXXXXCEEEPTTTT

                if ind == len(fos) - 1:
                    ind = 0
                else:
                    ind += 1
                newWord = fos[ind]

            except:

                    #print(newWord, temp)
                    try:
                        newWord = difflib.get_close_matches(newWord, fos)

                        newWord = newWord[random.randint(0, len(newWord)) - 1]


                    except:
                        pass
                    if temp==newWord or newWord==[] or newWord==None:
                        ind=random.randint(0,len(self.ShitList)-1)
                        while temp == newWord or newWord==[] or newWord==None:
                            newWord=self.ShitList[ind]


                            if temp == newWord:
                                if ind==len(self.ShitList)-1:
                                    ind=0
                                else:
                                    ind=ind+1

        return(newWord)


    """
    def DoVerse(self, the_num, the_len):
        import random
        import requests
        import re

        html=requests.get("https://www.random.org/integers/?num=1&min=1&max="+"999"+"&col=5&base=10&format=html&rnd=new").text
        random.seed(int(re.findall(r'\d+', (re.findall(r'<pre class="data">\d+\s+<\/pre>',html)[0]))[0]))

        Last3_1=""
        Last3_2=""
        verse = ""
        #print("Szar elkezdve")
        for linenum in range(1, the_num+1):


            #print(abs(the_len - self.LineLenght(line)), the_len, self.LineLenght(line))
            line=""
            while(abs(the_len-self.LineLenght(line))>2 and the_len>self.LineLenght(line)):
                line = self.StartingWord()
                prevWord = line + " "
                fff = 0
                while (abs(the_len-self.LineLenght(line))>2):
                    #import time
                    #time.sleep(1)
                    while True:
                        print(tries)
                        if tries>100:
                            newWord=self.ShitList[fff]
                            if fff<len(self.ShitList)-1:
                                fff+=1
                            else:
                                fff=0


                        else:
                            while True:
                                try:
                                    newWord=self.BIG[prevWord][random.randint(1, len(self.BIG[prevWord])-1)]
                                    break
                                except:
                                    prevWord=self.StartingWord()

                        if newWord not in self.BIG:
                            tries += 1
                            continue
                        print(">>", linenum, newWord, self.BIG[newWord])
                        if abs(the_len-self.LineLenght(line))>4:

                            if self.BIG[newWord]==[]:
                                tries+=1
                                continue


                            line=line+" "+newWord
                            prevWord=newWord
                            break
                        else:
                            if linenum<3:
                                if linenum==1:
                                    line = line + newWord
                                    prevWord = newWord
                                    Last3_1=newWord[-4:-1]
                                    break
                                else:
                                    line = line + newWord
                                    prevWord = newWord
                                    Last3_2=newWord[-4:-1]
                                    break

                            else:
                                if linenum%2=="1":
                                    if newWord[-4:-1]!=Last3_1:
                                        tries += 1
                                        continue
                                    line = line + newWord
                                    prevWord = newWord
                                    break
                                else:
                                    if newWord[-4:-1]!=Last3_2:
                                        tries += 1
                                        continue
                                    line = line + newWord
                                    prevWord = newWord
                                    break
                    line=line+" "
            print(line)
            verse=verse+line+"\n"
            verse=re.sub("\s\s", " ", verse)
        return(verse)
        """


    def LineLenght(self, line):
        num=0
        for L in line:
            if L in "aáeéiíoóöőuúüű":
                num+=1
        return(num)


    def DoTheJob(self):
        import random
        import requests
        import re


        try:
            html = requests.get(
            "https://www.random.org/integers/?num=1&min=1&max=" + "999" + "&col=5&base=10&format=html&rnd=new").text
            random.seed(int(re.findall(r'\d+', (re.findall(r'<pre class="data">\d+\s+<\/pre>', html)[0]))[0]))
        except:
            from datetime import datetime
            random.seed(int(str(datetime.now()).split(".")[1][-4:-1]))


        self.verse_line_num=random.randint(4,8)
        self.chorus_line_num=random.randint(2,6)
        self.short_line_num=random.randint(2,6)

        if self.chorus_line_num>self.verse_line_num:
            self.chorus_line_num = self.verse_line_num-2


        self.verse_line_len=random.randint(4,8)
        self.chorus_line_len=random.randint(3,6)
        self.short_line_len=random.randint(4,10)



    def StartingWord(self):
        from datetime import datetime
        import random
        import re
        import requests

        try:
            html = requests.get(
            "https://www.random.org/integers/?num=1&min=1&max=" + "999" + "&col=5&base=10&format=html&rnd=new").text
            random.seed(int(re.findall(r'\d+', (re.findall(r'<pre class="data">\d+\s+<\/pre>', html)[0]))[0]))
        except:
            from datetime import datetime
            random.seed(int(str(datetime.now()).split(".")[1][-4:-1]))

        while True:
            starter = self.ShitList[random.randint(0, len(self.ShitList) - 1)]
            if len(self.BIG[starter])<2:
                continue
            break
        return(starter)



if __name__ == "__main__":
    import os
    if os.path.exists('dalok.txt') is False:
        GetContent=GetContent()
        CreateText=CreateText(GetContent.songs)
    else:
        print("Lementett dalszöveg kivonat betöltése...")
        CreateText=CreateText(open("dalok.txt", "r").read())
    #BigDic=CreateBigDic()
    #Generator()
    #Saver()
    #CreateForReal=FoReal()



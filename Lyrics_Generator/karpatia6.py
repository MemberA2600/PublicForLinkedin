class CreateDict:

    def __init__(self):
        import re
        songs=(open("dalok3.txt", "r").read()+open("katonadalok_1.txt", "r").read()+open("reviz.txt", "r").read()).replace('\n',' ').split(' ')
        songs2=(open("dalok3.txt", "r").read()+open("katonadalok_1.txt", "r").read()+open("reviz.txt", "r").read()).split('\n')

        self.firstwords=[]
        for line in songs2:
            self.firstwords.append(line.split(" ")[0].lower())

        tempsongs=""
        for word in songs:
            if word!='':
                tempsongs=tempsongs+word+' '
        songs=""
        tempsongs=tempsongs.lower()
        for c in tempsongs:
            if c.isdigit()==True or c.isalpha()==True or c==" " or c=="-":
                songs=songs+c

        words=songs.split(' ')
        self.words=words
        self.MyDict={}
        for num in range(0, len(words)):
            if words[num] not in self.MyDict.keys():
                self.MyDict[words[num]]={}
            if num<len(words)-1:
                if words[num+1] not in self.MyDict[words[num]].keys():
                    self.MyDict[words[num]][words[num+1]] = {}
            if num<len(words)-2:
                if words[num+2] not in self.MyDict[words[num]][words[num+1]].keys():
                    self.MyDict[words[num]][words[num+1]][words[num+2]] = {}
            if num<len(words)-3:
                if words[num+3] not in self.MyDict[words[num]][words[num+1]][words[num+2]].keys():
                    self.MyDict[words[num]][words[num+1]][words[num+2]][words[num+3]] = {}
            if num<len(words)-4:
                if words[num+4] not in self.MyDict[words[num]][words[num+1]][words[num+2]][words[num+3]].keys():
                    self.MyDict[words[num]][words[num+1]][words[num+2]][words[num+3]][words[num+4]] = 1
                else:
                    self.MyDict[words[num]][words[num+1]][words[num+2]][words[num+3]][words[num+4]] +=1

        """
        for key in self.MyDict.keys():
            for key2 in self.MyDict[key].keys():
                for key3 in self.MyDict[key][key2].keys():
                    for key4 in self.MyDict[key][key2][key3].keys():
                        for key5 in self.MyDict[key][key2][key3][key4].keys():
                            print(key, key2, key3, key4, key5, self.MyDict[key][key2][key3][key4][key5])
        """


class DoVerse():

    def __init__(self, number):

        self.number=number
        while self.number>0:
            self.number-=1
            self.Create_Things()

            print("---"+str(self.number+1)+"---")
            self.song = self.SongPart(self.verse_len, self.verse_line, 1) + "\n>Refrén:"
            print("\nRefrén:\n")
            self.song = self.song+self.SongPart(self.chorus_len, self.chorus_line, 2) + "\n"
            self.song = self.song + self.SongPart(self.verse_len, self.verse_line, 3) + "\n(Refrén)\n"
            print("\n(Refrén)\n")
            self.song = self.song+self.SongPart(self.extra_len, self.extra_line, 4) + "\n(Refrén)\n"
            print("\n(Refrén)\n")


    def Create_Things(self):
        import random
        from datetime import datetime

        random.seed(int(str(datetime.now()).split(".")[1]))

        self.verse_len=random.randint(4, 6)
        self.verse_line=random.randint(8, 16)
        self.chorus_len=random.randint(2, 4)
        self.chorus_line=random.randint(6, 14)
        self.extra_len=random.randint(2, 4)
        self.extra_line=random.randint(6, 18)

    def SongPart(self, mylines, mylen, id):
        import random
        from datetime import datetime
        from nltk.corpus import stopwords

        Verse = ""
        End1 = ""
        End2 = ""
        num = 0
        trial=0
        trial2=0
        random.seed(int(str(datetime.now()).split(".")[1]))

        while num < mylines+1:
            trial+=1
            if trial==1000:
                sentence=""
                trial=0
                trial2+=1
                if trial2==10 or num==0:
                    if id!=3:
                        if id==1:
                            self.verse_len = random.randint(4, 6)
                            self.verse_line = random.randint(8, 12)

                            mylines = self.verse_len
                            mylen = self.verse_line


                        elif id==2:
                            self.chorus_len = random.randint(2, 4)
                            self.chorus_line = random.randint(6, 10)
                            mylines=self.chorus_len
                            mylen = self.chorus_line
                        else:
                            self.extra_len = random.randint(2, 4)
                            self.extra_line = random.randint(6, 14)
                            mylines=self.extra_len
                            mylen = self.extra_line
                    num=0
                    Verse=""
                    trial2=0

                else:
                    num=num-1
                    Verse = Verse.split('\n')
                    try:
                        while Verse[-1]=="":
                            Verse.pop(-1)
                        temp=""
                        for num in range(0, len(Verse)-2):
                            temp=temp+Verse[num]+"\n"
                        Verse=temp
                    except:
                        num=0
                        Verse=""

                random.seed(int(str(datetime.now()).split(".")[1]))

            if num==0:
                word1=The_Dict.firstwords[random.randint(0, len(The_Dict.firstwords)-1)]
            else:
                random.seed(int(str(datetime.now()).split(".")[1]))

                try:
                    temp = sentence.split(" ")
                    while temp[-1] == " " or temp[-1] == "":
                        temp.pop(-1)
                    lastword = temp[-1]
                    tempword = list(The_Dict.MyDict[lastword].keys())[random.randint(0, len(The_Dict.MyDict[lastword]) - 4)]
                    tempword2 = list(The_Dict.MyDict[lastword][tempword].keys())[random.randint(0, len(The_Dict.MyDict[lastword][tempword]) - 4)]

                    word1 = list(The_Dict.MyDict[lastword][tempword][tempword2].keys())[random.randint(0, len(The_Dict.MyDict[lastword][tempword][tempword2]) - 4)]
                    #print(word1)
                except:
                    try:
                        tempword=list(The_Dict.MyDict[lastword].keys())[random.randint(0, len(The_Dict.MyDict[lastword])-4)]
                        word1=list(The_Dict.MyDict[lastword][tempword].keys())[random.randint(0, len(The_Dict.MyDict[lastword][tempword])-4)]
                    except:
                        try:
                            word1 = list(The_Dict.MyDict[lastword].keys())[random.randint(0, len(The_Dict.MyDict[lastword])-4)]
                        except:
                            word1 = The_Dict.firstwords[random.randint(0, len(The_Dict.firstwords)-1)]
                            #print(num, lastword)
                            #continue
            try:
                word2=list(The_Dict.MyDict[word1].keys())[random.randint(0, len(The_Dict.MyDict[word1])-4)]
            except:
                continue
            try:
                word3=list(The_Dict.MyDict[word1][word2].keys())[random.randint(0, len(The_Dict.MyDict[word1][word2])-3)]
            except:
                if trial>500:
                    word3=""
                else:
                    continue
            try:
                word4=list(The_Dict.MyDict[word1][word2][word3].keys())[random.randint(0, len(The_Dict.MyDict[word1][word2][word3])-2)]
            except:
                word4=""
            try:
                word5=list(The_Dict.MyDict[word1][word2][word3][word4].keys())[random.randint(0, len(The_Dict.MyDict[word1][word2][word3][word4])-1)]
            except:
                word5=""

            sentence= word1 + " " + word2 + " " + word3 + " " + word4 + " " + word5
            while sentence.endswith(" "):
                sentence=sentence[:-1]
            try:
                temp=sentence.split(" ")
                while temp[-1] in stopwords.words('hungarian') or temp[-1]=="":
                    temp.pop(-1)
                sentence=" ".join(temp)
            except:
                continue


            if len(temp) != len(set(temp)):
                continue

            if self.GetLen(sentence)<mylen-1 or self.GetLen(sentence)>mylen+1:
                continue



            if num%4==0:
                End1=self.CheckLast(sentence)
            elif num%4==1:
                End2=self.CheckLast(sentence)
            else:
                k1 = sentence[-(len(End1)) - 1:]
                k2 = sentence[-(len(End2)) - 1:]
                t1 = ""
                t2 = ""
                t3 = ""
                t4 = ""
                for c in End1:
                    if c in "aáeéiíoóöőuúüű":
                        t1 = t1 + c
                for c in End2:
                    if c in "aáeéiíoóöőuúüű":
                        t2 = t2 + c
                for c in k1:
                    if c in "aáeéiíoóöőuúüű":
                        t3 = t3 + c
                for c in k2:
                    if c in "aáeéiíoóöőuúüű":
                        t4 = t4 + c

                if t1 != t3 and t2 != t4:

                    continue
            trial=0
            trial2=0

            Verse=Verse+sentence+"\n"
            temp=Verse.split("\n")
            if len(temp) != len(set(temp)):
                Verse=("\n".join(temp[:-2]))+"\n"

                continue



            num+=1
        print(Verse)
        return(Verse)

    def GetLen(self, line):
        num=0
        for char in line:
            if char in "aáeéiíoóöőuúüű":
                num+=1
        return(num)

    def CheckLast(self, line):
        if line[-1] in "aáeéiíoóöőuúüű":
            return(line[-1])
        elif line[-2] in "aáeéiíoóöőuúüű":
            return(line[-3:])
        else:
            return (line[-4:])

if __name__=="__main__":
    The_Dict=CreateDict()
    DoVerse(int(input('Hány Kárpátia dalra van szüksége széles-e Honnak?> ')))
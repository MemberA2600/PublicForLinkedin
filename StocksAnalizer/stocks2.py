import os
import requests
import re
from datetime import datetime
import math

def Open_TXT_NASDAQ():
    TheList = open("List_NASDAQ.txt", "r").read().split(";")
    return(TheList)

def Open_TXT_NYSE():
    TheList = open("List_NYSE.txt", "r").read().split(";")
    return(TheList)

def Load_NASDAQ_Symbols(BaseURL):
    Symbols=[]
    ABC="ABCDEFGHIJLKLMNOPQRSTUWVXYZ"
    for char in ABC:
        try:
            Text_to_Analyze = requests.get(BaseURL + "NASDAQ/"+char+".htm").text
        except:
            print(BaseURL + "NASDAQ/"+char+".htm betöltése sikertelen!")
        Regex=re.findall(r'\/stockquote\/NASDAQ\/[A-Z]+\.htm', Text_to_Analyze)
        for elem in Regex:
            elem=elem.replace("/stockquote/NASDAQ/", "").replace(".htm", "")
            #print(elem)
            Symbols.append(elem)

    Symbols=set(Symbols)
    Symbols=list(Symbols)
    Symbols.sort()
    print("Összeállítás sikeres.")
    #print(Symbols)

    file=open("List_NASDAQ.txt", "w")
    file.write(";".join(Symbols))
    file.close()
    print("'List_NASDAQ.txt' elkészült.")
    return(Symbols)

def Load_NYSE_Symbols(BaseURL):

    Symbols=[]
    ABC="ABCDEFGHIJLKLMNOPQRSTUWVXYZ"
    for char in ABC:
        try:
            Text_to_Analyze = requests.get(BaseURL + "NYSE/"+char+".htm").text
        except:
            print(BaseURL + "NYSE/"+char+".htm betöltése sikertelen!")
        Regex=re.findall(r'\/stockquote\/NYSE\/[A-Z]+\.htm', Text_to_Analyze)
        for elem in Regex:
            elem=elem.replace("/stockquote/NYSE/", "").replace(".htm", "")
            #print(elem)
            Symbols.append(elem)

    Symbols=set(Symbols)
    Symbols=list(Symbols)
    Symbols.sort()
    print("Összeállítás sikeres.")
    #print(Symbols)

    file=open("List_NYSE.txt", "w")
    file.write(";".join(Symbols))
    file.close()
    print("'List_NYSE.txt' elkészült.")
    return(Symbols)

def Collect_Data(List_NASDAQ, List_NYSE):
    Symbols={}
    date=str(datetime.now())[:11]
    Dontcare=Check_CSV("stocks_"+date+".csv", date)

    for elem in List_NASDAQ:
        if elem not in Dontcare:
            Symbols.setdefault(elem, Collector(elem))
            print("Elemzés és kiírás...")
            Calculate_n_Write(elem, Symbols, date)
            print("-"*40)
        #print(Symbols[elem])
    for elem in List_NYSE:
        if elem not in Dontcare:
            Symbols.setdefault(elem, Collector(elem))
            print("Elemzés és kiírás...")
            Calculate_n_Write(elem, Symbols, date)
            print("-"*40)

        #print(Symbols[elem])

def Check_CSV(path, date):
    if os.path.exists(path) is False:
        print("Új fájl megnyitása...")
        file = open("stocks_" + date + ".csv", "w")
        file.write("Szimbólum;Név;Jelenlegi Ár;Részvényenkénti Bevétel;Könyvelt Érték;Likviditási Ráta;Összes Kintlévőség;Mozgótőke;Öv Éves Növekedés;Ár/Bevétel;Ár/Könyvelt Érték;Öt Éves Osztalékfizetési Hajlandóság;Bevétel Növekedése;Graham egyenlet értéke;Veszélyek;Hibák\n")
        file.close()
        return([])
    else:
        print("Töredékfájl betöltése és már kielemzett tételek átugrása...")
        Dontcare=[]
        file = open("stocks_" + date + ".csv", "r")
        lines=file.read().split('\n')
        file.close()
        for number in range(1, len(lines)):
            Dontcare.append(lines[number].split(';')[0])

        return(Dontcare)


def Calculate_n_Write(elem, Symbols, date):
    Danger=0
    Exceptions=0
    Symbol=elem
    Nev = Symbols[elem]["Name"].replace(',','')
    Ar = Symbols[elem]["Current Price"].replace(',','')
    EPS = Symbols[elem]["EPS"].replace(',','')
    BookV = Symbols[elem]["BookValue"].replace(',','')
    CurrentRatio = Symbols[elem]["CurrentRatio"].replace(',','')
    TotalDebt = Symbols[elem]["TotalDebt"].replace(',','')
    CurrentAssets = Symbols[elem]["TotalCurrentAssets"].replace(',','')
    year5GR = Symbols[elem]["Growth"].replace(',','')
    PE = Symbols[elem]["TrailingPE"].replace(',','')
    PBV = Symbols[elem]["PriceToBook"].replace(',','')
    Dividend = Symbols[elem]["FiveYearAvgDividendYield"].replace(',','')
    ThatOne = Symbols[elem]["EPS_Difference"].replace(',','')


    if EPS!="N/A" and BookV!="N/A" and Ar!="N/A":
        Graham = math.sqrt(float(EPS) * float(BookV) * 22.5)
        if Graham<float(Ar):
            Danger+=1
        Graham=str(Graham)

    else:
        Graham = "N/A"
        Danger += 1
        Exceptions += 1

    if CurrentAssets!="N/A" and TotalDebt!="N/A":
        if float(CurrentAssets)!=0:
            if (float(TotalDebt)/1000000)/float(CurrentAssets) > 1.10:
                Danger += 1
    else:
        Danger += 1
        Exceptions += 1

    if CurrentRatio!="N/A":
        if float(CurrentRatio) < 1.50:
            Danger+=1
    else:
        Danger += 1
        Exceptions += 1

    if year5GR!="N/A" and year5GR!="":
        if float(year5GR) < 0.10:
            Danger += 1
    else:
        Danger += 1
        Exceptions += 1

    if PE!="N/A":
        if float(PE) > 9.0:
            Danger += 1
    else:
        Danger += 1
        Exceptions += 1

    if PBV!="N/A":
        if float(PBV) > 1.20:
            Danger += 1
    else:
        Danger += 1
        Exceptions += 1

    if Dividend!="N/A":
        if float(Dividend) < 0.5:
            Danger += 1
    else:
        Danger += 1
        Exceptions += 1
    if ThatOne == "N/A" or float(ThatOne)<0:
        Danger += 1

    Danger=str(Danger)
    print("Veszélyek (kockázatok) száma:", Danger)
    print("Meghiúsult elemzések :", str(Exceptions))

    file=open("stocks_" + date + ".csv", "a")
    file.write(Symbol+";"+Nev+";"+ Ar + ";" + EPS + ";" + BookV + ";" + CurrentRatio + ";" + TotalDebt + ";" + CurrentAssets + ";" + year5GR + ";" + PE + ";" + PBV + ";" + Dividend+";"+ThatOne+";"+Graham+";"+Danger+";"+Symbols[elem]["Errors"]+"\n")
    file.close()



def Collector(elem):

    error=0
    Stuffs={}
    print(elem, "adatainak betöltése...")
    address_text=requests.get("https://finance.yahoo.com/quote/"+elem+"/key-statistics?p="+elem).text
    address_text2=requests.get("https://stocktwits.com/symbol/"+elem).text
    address_text3=requests.get("https://csimarket.com/stocks/balance.php?code="+elem).text
    address_text4=requests.get("https://finance.yahoo.com/quote/"+elem+"/analysis?p="+elem).text

    try:
        regex=re.findall(r'<title>[A-Za-z0-9\s\.\,\-]+\([A-Z]+\)', address_text)[0]
        Stuffs.setdefault("Name", regex.replace("<title>",""))
    except:
        Stuffs.setdefault("Name", "N/A")
        print("Nem értelmezhető a név!")

    try:
        regex=re.findall(r'"Success","last":[0-9]+', address_text2)[0].replace('"Success","last":','')
        Stuffs.setdefault("Current Price", regex)
    except:
        Stuffs.setdefault("Current Price", "N/A")
        print("Nem állapítható meg a jelenlegi ár!")
        error+=1

    try:
        regex=re.findall(r'"trailingEps":{"raw":[0-9\.]+', address_text)[0]
        Stuffs.setdefault("EPS", regex.replace('"trailingEps":{"raw":', ''))
    except:
        Stuffs.setdefault("EPS", "N/A")
        print("Nem állapítható meg a részvényenkénti bevétel!")
        error+=1

    try:
        regex=re.findall(r'"bookValue":{"raw":[0-9\.]+', address_text)[0]
        Stuffs.setdefault("BookValue", regex.replace('"bookValue":{"raw":', ''))
    except:
        Stuffs.setdefault("BookValue", "N/A")
        print("Nem állapítható meg a könyvelt érték!")
        error+=1

    try:
        regex=re.findall(r'"currentRatio":{"raw":[0-9\.]+', address_text)[0]
        Stuffs.setdefault("CurrentRatio", regex.replace('"currentRatio":{"raw":', ''))
    except:
        Stuffs.setdefault("CurrentRatio", "N/A")
        print("Nem állapítható meg a likviditási ráta!")
        error+=1

    try:
        regex=re.findall(r'"totalDebt":{"raw":[0-9\.]+', address_text)[0]
        Stuffs.setdefault("TotalDebt", regex.replace('"totalDebt":{"raw":', ''))
    except:
        Stuffs.setdefault("TotalDebt", "N/A")
        print("Nem állapítható meg az összes kintlévőség!")
        error+=1

    try:
        regex=re.findall(r'Total\sCurrent\sAssets\s<\/strong><\/a><\/td>\s+<td\sclass="debeligrub2"\s><strong><span\s>[0-9\.\,]+', address_text3)[0]
        regex2=re.findall(r'>[0-9\.\,]+',regex)[0].replace(">","")
        Stuffs.setdefault("TotalCurrentAssets", regex2)
    except:
        Stuffs.setdefault("TotalCurrentAssets", "N/A")
        print("Nem állapítható meg a mozgótőke összege!")
        error+=1

    try:
        regex=re.findall(r'"period":"-5y","endDate":null,"growth":{"raw":[0-9\-\.\,]+', address_text4)[0]
        regex2=re.findall(r'raw":[0-9\-\.\,]+', regex)[0].replace('raw":','')[:-2]
        Stuffs.setdefault("Growth", regex2)
    except:
        Stuffs.setdefault("Growth", "N/A")
        print("Nem állapítható meg a növekedés!")
        error+=1

    try:
        regex=re.findall(r'"trailingPE":{"raw":[0-9\.]+', address_text)[0]
        Stuffs.setdefault("TrailingPE", regex.replace('"trailingPE":{"raw":', ''))
    except:
        Stuffs.setdefault("TrailingPE", "N/A")
        print("Nem állapítató meg az Ár/Bevétel arány!")
        error+=1

    try:
        regex=re.findall(r'"priceToBook":{"raw":[0-9\.]+', address_text)[0]
        Stuffs.setdefault("PriceToBook", regex.replace('"priceToBook":{"raw":', ''))
    except:
        Stuffs.setdefault("PriceToBook", "N/A")
        print("Nem állapítható meg az Ár/Könyvelt érték arány!")
        error+=1

    try:
        regex=re.findall(r'"fiveYearAvgDividendYield":{"raw":[0-9\.]+', address_text)[0]
        Stuffs.setdefault("FiveYearAvgDividendYield", regex.replace('"fiveYearAvgDividendYield":{"raw":', ''))
    except:
        Stuffs.setdefault("FiveYearAvgDividendYield", "N/A")
        print("Nem állapítató meg az öt éves osztalékfizetési hajlandóság!")
        error+=1

    try:
        regex = re.findall(r'"epsDifference":{"raw":[0-9\-\.\,]+', address_text4)[0]
        Stuffs.setdefault("EPS_Difference", regex.replace('epsDifference":{"raw":','').replace('"','').replace(',',''))
    except:
        Stuffs.setdefault("EPS_Difference", "N/A")
        print("Nem állapítható meg a bevétel növekedése!")
        error += 1

    print("Hiányosságok száma: "+str(error))
    Stuffs.setdefault("Errors", str(error))

    return(Stuffs)




if __name__=="__main__":
    List_NASDAQ = []
    List_NYSE = []
    BaseURL="http://eoddata.com/stocklist/"


    if os.path.exists("List_NASDAQ.txt") is False:
        print("'List_NASDAQ.txt' összeállítása...")
        List_NASDAQ=Load_NASDAQ_Symbols(BaseURL)

    else:
        print("'List_NASDAQ.txt' betöltése...")
        List_NASDAQ=Open_TXT_NASDAQ()

    if os.path.exists("List_NYSE.txt") is False:
        print("'List_NYSE.txt' összeállítása...")
        List_NYSE = Load_NYSE_Symbols(BaseURL)

    else:
        print("'List_NYSE.txt' betöltése...")
        List_NYSE=Open_TXT_NYSE()

    Collect_Data(List_NASDAQ, List_NYSE)



class DataLine:

    def __init__(self):
        self.raw = []
        self.seq = None
        self.address = None
        self.bytes = []
        self.byteNum = 1

    def getAddressInHex(self):
        return(hex(self.address)[2:])


def loadRegisters(path):
    temp = {}

    file = open(path, "r")
    for line in file.readlines():
        line = line.split("=", 1)
        if (line[0].startswith("$") == False):
            line[0] = "$"+line[0]

        temp[line[0]] = line[1].replace("\r","").replace("\n","").replace(" ", "")

    file.close()
    return(temp)


def loadOpCodes(path):
    temp = {}
    file = open(path, "r")
    for line in file.readlines():
        line = line.split("=", 1)
        if (line[0].startswith("$") == False):
            line[0] = "$"+line[0]

        temp[line[0]] = {}
        sub = line[1].replace("\r","").replace("\n","")

        while(sub.endswith(" ")):
            sub = sub[:-1]

        sub = sub.split(" ")
        temp[line[0]]["opcode"] = sub[0]
        if len(sub) == 1:
            temp[line[0]]["format"] = None
            temp[line[0]]["bytes"] = 1
        else:
            temp[line[0]]["format"] = sub[1]
            temp[line[0]]["bytes"] = int(sub[1].count("a")/2)+1


    file.close()
    return(temp)

def normalize(text):
    import re
    new = []

    text = text.split("\n")
    for line in text:
        if ";" in line:
            line = line.split(";", 2)[0]
        elif "!" in line:
            line = line.split("!", 2)[0]

        if ((len(re.findall(r"[a-zA-Z]", line)) == 0)
            or (line.startswith("#") or line.startswith("*"))
        ):
            continue
        line = re.sub(r"\s+", " ", line)
        line = re.sub(r"\t+", " ", line)

        new.append(line)

    return("\n".join(new))

def collectVariables(text):
    variables = {}

    text = text.split("\n")
    for line in text:
        if line.startswith(" ") or ("=" not in line):
            continue
        line = line.replace(" ", "")
        variables[line.split("=")[0]] = line.split("=")[1]

    return(variables)

def sleepToCode(text):
    new = []
    text = text.split("\n")
    for line in text:
        if "sleep" not in line:
            new.append(line)
            continue
        number = int(line.split("sleep", 1)[1].replace(" ", ""))
        if (number%2==0):
            new.append(" NOP\n"*int(number/2))
        else:
            #new.append(" NOP\n"*int((number/2)-1)+" JMP *+3\n")
            new.append(" NOP\n" * int((number / 2) - 1) + " BIT $00\n")

    return("\n".join(new))

def setup(line, upper):

    if upper == True:
        copied = line.upper()
    else:
        copied = line
    if "," in copied:
        copied = copied.split(",")[0]
    copied = copied.replace("(", "").replace(")", "").replace(" ", "").replace("$", "")
    return(copied)

def getSectionNames(code):
    import re

    sections = {}

    for line in code:
        if (len(re.findall(r"[a-zA-Z]", line)) == 0) or ("=" in line):
            continue

        if line.startswith(" ") == False:
            sections[line.replace(" ", "")] = None
            continue

    return (sections)

def createSquence(code, opcodes, variables, registers):
    import re
    from copy import deepcopy
    code = code.split("\n")

    branchers = ["BCC", "BCS", "BEQ", "BMI", "BNE", "BPL", "BVC", "BVS"]
    sections = getSectionNames(code)
    codeLines = []
    freebytes = {}
    currentBank = 1

    currentSEQNumber = 1
    currentAddress = 4096

    threeByters = []

    for r in registers:
        if len(r)>3:
            threeByters.append(registers[r])

    for v in variables:
        if len(variables[v])>3:
            threeByters.append(v)


    for line in code:
        while line.endswith(" "):
            line = line[:-1]


        if (len(re.findall(r"[a-zA-Z]", line)) == 0) or ("=" in line):
            continue

        if line.startswith(" ") == False:
            sections[line.replace(" ", "")] = "$"+hex(currentAddress)[2:]
        else:


            line = line.split(" ")
            new = []
            for item in line:
                if item != "":
                    new.append(item)

            line = new
            if line[0].upper()=="ALIGN":
                while(currentAddress%int(line[1])>0):
                    codeLines.append(DataLine())
                    current = codeLines[-1]
                    current.address = currentAddress
                    currentAddress+=1
                    current.seq = currentSEQNumber
                    currentSEQNumber+=1
                    current.raw = deepcopy(line)
                    current.bytes.append(bytes([255]))

            elif line[0].upper()=="FILL":
                counter = int(line[1])
                while(counter>0):
                    codeLines.append(DataLine())
                    current = codeLines[-1]
                    current.address = currentAddress
                    currentAddress+=1
                    current.seq = currentSEQNumber
                    currentSEQNumber+=1
                    current.raw = deepcopy(line)
                    current.bytes.append(bytes([255]))
                    counter -= 1


            elif line[0].upper() == "REWIND":
                border=int("0x"+line[1], 16)
                while(currentAddress<border):
                    codeLines.append(DataLine())
                    current = codeLines[-1]
                    current.address = currentAddress
                    currentAddress += 1
                    current.seq = currentSEQNumber
                    currentSEQNumber += 1
                    current.raw = deepcopy(line)
                    current.bytes.append(bytes([255]))

            elif line[0].upper() == "saveFreeBytes".upper():
                freebytes[currentBank] = 4096 - currentAddress%4096

            elif line[0].upper() == "BANK":

                currentBank = int(line[1])
                currentAddress = currentBank * 4096

            elif "BYTE" in line[0].upper():
                codeLines.append(DataLine())
                current = codeLines[-1]
                current.address = currentAddress
                currentAddress += 1
                current.seq = currentSEQNumber
                currentSEQNumber += 1
                current.raw = deepcopy(line)

                try:
                    num = line[1].replace("#", "")
                    if "%" in num:
                        num = int("0b"+num.replace("%", ""), 2)
                    elif "$" in num:
                        num = int("0x"+num.replace("$", ""), 16)
                    else:
                        num = int(num, 10)
                    current.bytes.append(bytes([num]))
                except Exception as e:

                    second = checkIfSectionName(line[1], sections)
                    second = starToAddress(currentAddress, second)
                    second = secondByteToNumeric(second, variables, registers, sections)
                    second = doTheMath(second)
                    second = lowHighNibble(second)
                    current.bytes.append(bytes([int(second.replace("#$", "0x"), 16)]))

            else:
                codeLines.append(DataLine())
                current = codeLines[-1]
                current.raw = deepcopy(line)
                current.address = currentAddress

                if len(line)==1:
                    currentAddress += 1
                elif line[0].upper() in branchers:
                    currentAddress += 2
                    current.byteNum = 2
                else:
                    line[1] = line[1].replace("*", str(currentAddress))
                    currentAddress += 2
                    current.byteNum = 2
                    if ("#" not in line[1]) and (line[1] in list(sections.keys()) or
                        len(re.findall(r'[a-fA-F0-9]{4}', line[1])) > 0 or
                        line[1] in threeByters):
                        currentAddress += 1
                        current.byteNum = 3

                """
                try:
                    print(line[1], current.byteNum)
                except:
                    pass
                """
                current.seq = currentSEQNumber
                currentSEQNumber += 1


    for line in codeLines:
        counter = 0
        second = ""
        shit = False

        for c in opcodes.keys():
            counter += 1


            if line.bytes != []:
                continue
            elif (line.byteNum == opcodes[c]["bytes"] and (opcodes[c]["opcode"] == line.raw[0].upper())):
                shit = True

                if (line.byteNum == 1):
                    c = bytes([int(c.replace("$", "0x"), 16)])
                    line.bytes.append(c)
                    break

                elif line.raw[0].upper() in branchers:
                    c = bytes([int(c.replace("$", "0x"), 16)])
                    line.bytes.append(c)


                    second = checkIfSectionName(line.raw[1], sections)
                    second = starToAddress(line.address, second)
                    second = secondByteToNumeric(second, variables, registers, sections)
                    second = doTheMath(second)
                    second = int(second.replace("$", "0x"), 16)

                    number = (second-line.address)-2
                    if (number<0):
                        number = 256 + number
                    line.bytes.append(bytes([number]))

                else:
                    second = checkIfSectionName(line.raw[1], sections)
                    second = starToAddress(line.address, second)
                    second = secondByteToNumeric(second, variables, registers, sections)
                    second = doTheMath(second)
                    second = lowHighNibble(second)

                    if len(re.findall(r"\$[a-fA-F0-9]{4}", second))>0:
                        num = int("0x"+second[1], 16)
                        if num > 0 and num<9:
                            second = ("$"+hex(((num-1)*2)+1)+second[2:]).replace("0x", "")

                    if second.startswith("#") and opcodes[c]["format"] == "#aa":
                        createBytes(line, c, second)
                        break
                    else:

                        template = re.sub(r'[0-9a-fA-F]', "a", second.lower().replace("$", ""))


                        if template.count("a")==1 or template.count("a")==3:
                            template = "a" + template

                        #print(second, template, template.upper(), opcodes[c]["format"].upper(), c)


                        if (line.raw[0].upper() == opcodes[c]["opcode"].upper() and template.upper() == opcodes[c]["format"].upper()):
                            createBytes(line, c, second)
                            break



    return(freebytes, codeLines, sections)

def starToAddress(address, second):
    return(second.replace("*", hex(address).replace("0x", "$")))

def checkIfSectionName(name, sections):
    word = name.replace("#","").replace("<","").replace(">","").replace(" ", "")
    if word in sections:
        return(name.replace(word, sections[word]))
    else:
        return(name)


def createBytes(line, c, second):
    c = bytes([int(c.replace("$", "0x"), 16)])
    line.bytes.append(c)

    if "," in second:
        second = second.split(",")[0]



    second = second.replace("#", "").replace("(", "").replace(")","")
    if second.startswith("%"):
        appendBytes(line, second.replace("%", "0b"))
    elif second.startswith("$"):
        second = second.replace("$", "")
        if len(second)==2:
            appendBytes(line, "0x"+second)
        else:
            appendBytes(line, "0x"+second[2:])
            appendBytes(line, "0x"+second[:2])

    else:
        appendBytes(line, second)

def appendBytes(line, second):
    if second.startswith("0b"):
        line.bytes.append(bytes([int(second, 2)]))
    elif second.startswith("0x"):
        line.bytes.append(bytes([int(second, 16)]))
    else:
        line.bytes.append(bytes([int(second, 10)]))

def doTheMath(raw):
    import re

    if ("+" not in raw) and ("-" not in raw):
        return(raw)

    base = re.findall(r'\$[a-fA-f0-9]+', raw)[0]
    num = re.findall(r'[+|-]\d+', raw)[0]


    baseNumber = int(base.replace("$", "0x"), 16)

    newNum = hex(baseNumber+int(num)).replace("0x", "$")
    raw = raw.replace(base, newNum).replace(num, "")

    return (raw)


def lowHighNibble(raw):
    import re

    if ("<" not in raw) and (">" not in raw):
        return(raw)
    numbers = re.findall(r'[<|>]\$[a-fA-F0-9]{4}', raw.replace("(",""))[0]
    if numbers[0]=="<":
        numbers=numbers[-2:]
    else:
        """
        highNibbleChanger = {
            "1": "1",
            "2": "3",
            "3": "5",
            "4": "7",
            "5": "9",
            "6": "b",
            "7": "d",
            "8": "f"
        }
        """
        numbers=numbers[-4:-2]
        numbers = hex(((int("0x"+numbers[0], 16)-1)*2)+1)[2:] + numbers[1]
        #numbers = highNibbleChanger[numbers[0]] + numbers[1]
    return ("#$"+numbers)

def secondByteToNumeric(raw, variables, registers, sections):
    import re

    tempraw = re.findall(r'[a-zA-Z_0-9\-]+[a-zA-Z_0-9]', raw)
    if tempraw==[]:
        return (raw)
    else:
        tempraw = tempraw[0]

    if ("-" in tempraw):
        test = tempraw.split("-")[-1]
        try:
            test = int(test)
            tempraw = "-".join(tempraw.split("-")[:-1])
        except:
            pass

    for item in sections:
        if (item == tempraw):
            return(raw.replace(item, sections[item]))
    for item in variables:
        if (item == tempraw):
            return(raw.replace(item, variables[item]))
    for item in registers:
        if (registers[item] == tempraw):
            return(raw.replace(registers[item], item))
    return(raw)


def writeOutBytes(bytes):

    pass

def compile(path):
    import re

    registers =  loadRegisters("data/6507Registers.txt")
    opcodes =  loadOpCodes("data/opcodes.txt")
    file = open(path, "r")
    source = file.read()
    file.close()

    source = normalize(source)
    variables = collectVariables(source)

    source = sleepToCode(source)

    freeBytes, code, sections = createSquence(source, opcodes, variables, registers)

    file = open("teszt.txt", "w")
    fileBin = open("done.bin", "wb")

    toWrite = []
    lenOfNum = len(str(code[-1].address))

    for codeline in code:
        bytes_ = []
        for byte in codeline.bytes:
            bytes_.append(byte.hex())
            fileBin.write(byte)

        num = str(codeline.seq)
        while(len(num)<lenOfNum):
            num = "0" + num

        fos = str(num).ljust(lenOfNum+2) + str(codeline.getAddressInHex()).ljust(5)+" ".join(bytes_).ljust(40) + str(codeline.byteNum).ljust(2) + str(codeline.raw).ljust(35)


        for section in sections:
            if sections[section][1:] == codeline.getAddressInHex():
                toWrite.append(str(num).ljust(lenOfNum+2) + str(codeline.getAddressInHex()).ljust(5)+ ">>" + section)
                break

        toWrite.append(fos)
    import os


    file.write(os.linesep.join(toWrite))
    file.close()
    fileBin.close()

if __name__ == "__main__":

    compile("kernel.asm")




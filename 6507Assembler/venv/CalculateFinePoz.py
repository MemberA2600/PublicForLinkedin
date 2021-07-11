table = {}
for x in range (0, 145):
    remainder = x%15
    remainder = remainder ^ 7
    remainder = remainder << 4
    table[x] = remainder

    print(x, ": ", hex(remainder).replace("0x", "$"))
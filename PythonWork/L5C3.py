import random

def funcOne(inOne,inTwo):
    randNum = random.randint(1, (len(inOne) + len(inTwo)))
    print (inOne, inTwo, sep='---')
    return randNum

def funcTwo():
    for i in range(6):
        print ('Zz')
        for z in range(10000000):
            continue

def funcThree(argOne,argTwo,argThree):
    for cNum in range (1,11):
        if cNum == argOne or cNum == argTwo or cNum == argThree:
            continue
        else:
            print (cNum)
            funcTwo()

print(funcOne('hi','two'))
print(funcThree(1,5,9))

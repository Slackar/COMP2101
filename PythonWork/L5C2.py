import random

def funcOne():
    inOne = input ('Give me a word: ')
    inTwo = input ('Give me another word: ')
    randNum = random.randint(1, (len(inOne) + len(inTwo)))
    print (randNum)
    print (inOne, inTwo, sep='---')

def funcTwo():
    for i in range(6):
        print ('Zz')
        for z in range(10000000):
            continue

funcOne()
funcTwo()

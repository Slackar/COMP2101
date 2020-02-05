import random

def funcOne(inOne,inTwo):
    randNum = random.randint(1, (len(inOne) + len(inTwo)))
    print (inOne, inTwo, sep='---')
    return randNum

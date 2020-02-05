#import library
import random

#generate Rand number
randNumb = random.randint (10, 50)
print (randNumb)

#ask user for input
userNumb = int(input ('Guess a number from 10 to 50: '))
counterNumb = 0

while userNumb != randNumb:

    #create checks
    if  userNumb < 10 or userNumb > 50:
        userNumb = int(input ('Please choose a number in the given range of 10 - 50: '))
        continue
    elif counterNumb == 2:
        break
    elif userNumb > randNumb:
        print ('Too high, sorry')
        userNumb = int(input ('Try again. Guess a number from 10 to 50: '))
        counterNumb = counterNumb + 1
    elif userNumb < randNumb:
        print ('Too low, sorry')
        userNumb = int(input ('Try again. Guess a number from 10 to 50: '))
        counterNumb = counterNumb + 1
# Correct Number script
if userNumb == randNumb:
    for i in range (7):
        print ('You win')
        for countNumb in range (10000000):
            continue
    for cNumb in range (10,50):
        if cNumb == userNumb:
            continue
        else:
            print (cNumb)
            for countNumb in range (1000000):
                continue

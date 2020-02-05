#import library
import random

#generate Rand number
randNumb = random.randint (10, 50)

for i in range (3):

    #ask user for input
    userNumb = input ('Guess a number from 10 to 50. You have 3 guesses to start. You Have ' + str(3-i) + ' guesses left : ')

    #create checks
    if int(userNumb) == randNumb:
        print ('You win')
        break
    elif int(userNumb) > randNumb:
        print ('Too high, sorry')
    elif int(userNumb) < randNumb:
        print ('Too low, sorry')

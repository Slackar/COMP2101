#import library
import random

#generate Rand number
randNumb = random.randint (10, 50)

#ask user for input
userNumb = input ('Guess a number from 10 to 50: ')

#create checks
if int(userNumb) == randNumb:
    print ('You win')
elif int(userNumb) > randNumb:
    print ('Too high, sorry')
else:
    print ('Too low, sorry')

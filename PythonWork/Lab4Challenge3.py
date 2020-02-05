#import library
import random

#generate Rand number
randNumb = random.randint (10, 50)
#countNumb = 0

#ask user for input 
#userNumb = int(input ('Guess a number from 10 to 50: '))

while True:
    #ask user for input 
    userNumb = int(input ('Guess a number from 10 to 50: '))
   
    #create checks
    if  userNumb < 10 or userNumb > 50:
        userNumb = int(input ('Please choose a number in the given range of 10 - 50: '))
        continue
    elif userNumb == 32:
        for i in range (7):
            print ('You win')
        for cNumb in range (10,50):
            if cNumb == userNumb:
                continue
            else:
                print (cNumb)
        break
    elif userNumb > randNumb:
        print ('Too high, sorry')
    elif userNumb < randNumb:
        print ('Too low, sorry')

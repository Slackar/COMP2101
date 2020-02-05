#import random for script functionality
import random

#Function takes 2 string args at end returns the number generated
def funcOne(inOne,inTwo):
    randNum = random.randint(1, (len(inOne) + len(inTwo)))
    #print (inOne, inTwo, sep='---') #edited out as not needed for script
    return randNum

#Function used to generate a sleep timer with printed out put
def funcTwo():
    for i in range(6):
        print ('Zz')
        for z in range(10000000):
            continue

#Start of 3rd Funct used to take 3 int args and uses funcTwo for sleep timer
def funcThree(argOne,argTwo,argThree):
    for cNum in range (1,11):
        if cNum == argOne or cNum == argTwo or cNum == argThree:
            continue
        else:
            print (cNum)
            funcTwo()

#start of step 2 part 1 made it a function to test each input
def testNum():
    while True:
        try:
            test=int(input(': '))
        except ValueError:
            print ('One or more of your values is not an Interger.', end='')
        else:
            if  1 <= test < 10 :
                return test
                break
            else:
                print ('Please try again.', end='')

#start of step 3 part 1 made it a function to test valid
def chNum():
    while True:
        try:
            test=float(input(': '))
        except ValueError:
            print ('One or more of your values is not an Number', end='')
        else:
            if  type(test) is float :
                return test
                break
            else:
                print ('Please try again.', end='')


#start of script step 1
userOne = str(input ('Please enter a word: '))
userTwo = str(input ('Please enter a word: '))
print(funcOne(userOne,userTwo)) #this invokes the variables and uses them in funcOne

#step 2 part 2

print ('Tell me a number between 1 - 10', end='')
uInOne = testNum()
print ('Tell me a second number between 1 - 10', end='')
uInTwo = testNum()
while True:
    if uInOne == uInTwo:
        print ('Your numbers are the same please choose a new second number', end='')
        uInTwo = testNum()
        continue
    else:
        print ('Tell me a third number between 1 - 10', end='')
        uInThree = testNum()
        while True:
            if uInThree == uInOne or uInThree == uInTwo:
                print ('Your numbers are the same please choose a new third number', end='')
                uInThree = testNum()
                continue
            else:
                break
        break

funcThree(uInOne,uInTwo,uInThree)

#step 3 part 2 uses function to check that input is a number
print ('How long did it take you to get to school today? (Time in Hours)', end='')
timeNum = chNum()
print ('How far did you travel to get to school today? (Distance in KM)', end='')
disNum = chNum()
try:
    spNum = (disNum / timeNum)
except ZeroDivisionError:
    print ('You provide an invalid time value.')
else:
    print ('You were going ' + str(spNum) + 'km/h on your way to school today.')

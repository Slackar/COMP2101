def chNum():
    while True:
        try:
            test=float(input('Prompt: '))
        except ValueError:
            print ('One or more of your values is not an Interger.')
        else:
            if type(test) is float :
                return test
                break
            else:
                print ('Please try again.')

print ('How long did it take you to get to school today? (Time in Hours)', end='')
timeNum = chNum()
print ('How far did you travel to get to school today? (Distance in KM)')
disNum = chNum()
try:
    spNum = (disNum / timeNum)
except ZeroDivisionError:
    print ('You provide an invalid time value.')
else:
    print ('You were going ' + str(spNum) + 'km/h on your way to school today.')

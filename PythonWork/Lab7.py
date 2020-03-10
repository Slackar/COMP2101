from datetime import datetime
import os

def testID():
    while True:
        try:
            test=int(input(': '))
        except ValueError:
            print ('Your ID should only be numbers', end='')
        else:
            if type(test) is int:
                return test
                break
            else:
                print ('Please enter ID number again.', end='')

def testDate():
    while True:
        inputDate = input('Enter the date in mm/dd/yyyy format: ')
        try:
            datetime.strptime(inputDate, '%m/%d/%Y')
            print('The date {} is valid.'.format(inputDate))
            return inputDate
            break
        except ValueError:
            print('The date {} is invalid'.format(inputDate))


fName = input('Enter your first name: ')
lName = input('Enter your last name: ')
print ('Please enter your employee id number', end='')
empID = str(testID())
empDOB = str(testDate())

print('\nWRITING INFORMATION TO FILE')
writeFile = open('C:\\Users\\Anthony\\github\\COMP2101\\PythonWork\\assignment7.txt','w')
writeFile.write(fName+'\n')
writeFile.write(lName+'\n')
writeFile.write(empID+'\n')
writeFile.write(empDOB+'\n')
writeFile.close()
print('FILE WRITE COMPLETE')

print('\nCHECKING FILE\n')
writeFile = open('C:\\Users\\Anthony\\github\\COMP2101\\PythonWork\\assignment7.txt')
readFile = writeFile.read()
print(readFile)

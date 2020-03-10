from datetime import datetime

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


dOb = testDate()

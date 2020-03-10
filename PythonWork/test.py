from datetime import datetime

def testDate():
    while True:
        user_input = input('Enter the date in mm/dd/yyyy format: ')
        try:
            datetime.strptime(user_input, '%m/%d/%Y')
            print('The date {} is valid.'.format(user_input))
            return user_input
            break
        except ValueError:
            print('The date {} is invalid'.format(user_input))


dOb = testDate()

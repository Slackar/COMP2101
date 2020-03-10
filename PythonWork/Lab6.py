def reverseFunc(x):
    newString = ''
    for i in range(len(x)):
        newString += x[(len(x))-1-i]
    return newString

wordArray = input('Please tell atleast 5 words: ')
print (" \nThe number of characters in your sentence is: " + str(len(wordArray)))
print (" \nThe 5th character from the string is: " + wordArray[4])
print (" \nThe 3rd to 7th character from the string is: " + wordArray[2:6])
if 'Hello' in wordArray:
    print (' \nTrue')
wordArrayUp = wordArray.upper()
print (wordArrayUp)
if wordArray.lower().startswith('hello'):
    print ('TRUE')
print (wordArray.rjust(50))
print(reverseFunc(wordArray))

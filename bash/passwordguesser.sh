#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data
# TASK 2: Improve it by rewriting it to use the if command
# TASK 3: Improve it by giving them 3 tries to get it right before failing (test 3 times but only if necessary)
#           *** Do not use the exit command

# myString="TestString"
referenceString="password"

#[ $myString = $referenceString ] && echo "You guessed the password!" || echo "The password eludes you..."
num1=0
myInput=""

if [ $num1 -eq 0 ] && [ "$myInput" != "$referenceString" ] ; then
  read -p 'Try to guess the word of the day!  Attempt 1: ' myInput
  num1=$(( $num1 + 1 ))
  if [ $num1 -eq 1  ] && [ "$myInput" != "$referenceString" ] ; then
    read -p 'You need to try again  Attempt 2: ' myInput
    num1=$(( $num1 + 1 ))
    if [ $num1 -eq 2  ] && [ "$myInput" != "$referenceString" ] ; then
    read -p 'You need to try again  Attempt 3: ' myInput
    num1=$(( $num1 + 1 ))
      if [ $num1 -eq 3 ] && [ "$myInput" != "$referenceString" ] ; then
      echo "You FAILED"
      elif [ "$myInput" = "$referenceString" ] ; then
      echo "Good Job you guessed it!"
      fi
    elif [ "$myInput" = "$referenceString" ] ; then
    echo "Good Job you guessed it!"
    fi
  elif [ "$myInput" = "$referenceString" ] ; then
  echo "Good Job you guessed it!"
  fi
fi

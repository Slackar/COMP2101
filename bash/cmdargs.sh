#!/bin/bash
# This script demonstrates how the shift command works
declare -a stored
debug="no"
verb="no"
# loop through the command line arguments
while [ $# -gt 0 ]; do
  # tell the user how many things are left on the command line
  echo "There are $# things left to process on the command line."
  # display whatever is in $1
  echo "\$1 has '$1' in it."

# TASK 1: replace the echo command that just says processing with a case statement that
#             recognizes the following command line options and tells the user if
#             they were found on the command line
#          Options to recognize: -h for help, -v for verbose mode
# TASK 2: add recognition of a debug option -d that expects a number that specifies the debug level (e.g. -d 3)
#             save the debug level in a variable to be available to use later in the script
#             display an error if the user gave the -d option without a number after it
# TASK 3: put anything that wasn't recognized on the command line into a variable for use later in
# the script
  case "$1" in
    -h | --help )
    pointZero=$(basename $0)
    echo "$pointZero [-h | --help] [-v verbose] [-d[1-4] Debug mode level] ]"
    exit
    ;;
    -v )
    verb="yes"
    echo "Verbose mode turned to ON"
    ;;
    -d[1-4] )
    sub=$1
    level="${sub:2:1}"
    debug="yes"
    echo "Debug mode set to $level"
    ;;
    -d* )
    echo "You have entered an invalid Debug mode option" >&2
    exit 2
    ;;
    * )
    stored+=("$1")
    ;;
  esac

  # each time through the loop, shift the arguments left
  # this decrements the argument count for us
  shift
  # tell the user we shifted things
  echo "Shifted command line, leaving $# things left to process."
  echo "--------------------------"
  # go back to the top of the loop to see if anything is left to work on
done
echo "Done"
echo "Stored Data: " ${stored[@]}
echo "You have ${#stored[@]} pieces of data for later processing"

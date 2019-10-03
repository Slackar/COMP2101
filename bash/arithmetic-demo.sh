#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number


# ask for 2 numbers from the user between 1 and 10
echo "Please enter a number between 1 and 9"
read -n 1 firstnum
echo""
echo "Please enter a second number between 1 and 9"
read -n 1 secondnum
echo ""
sumpos=$((firstnum + secondnum))
dividend=$((firstnum / secondnum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")
# adding variables and math for the new equations
sumneg=$((firstnum - secondnum))
product=$((firstnum * secondnum))
modulus=$((firstnum % secondnum))
power=$(bc <<< "$firstnum^$secondnum")


cat <<EOF
$firstnum plus $secondnum is $sumpos
$firstnum minus $secondnum is $sumneg
$firstnum multiplied by $secondnum is $product
$firstnum divided by $secondnum is $dividend with a remainder of $modulus
  - More precisely, it is $fpdividend
$firstnum raised to the power of $secondnum is $power
EOF

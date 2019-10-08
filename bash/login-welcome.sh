#!/bin/bash
#
# This script produces the dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Improve this script by using the value in the automatic variable $USER for the name
# Improve this script by adding some time and day of the week information to the welcome message
#   Use a format like this:
#   It is HH:MM AM on weekday.

###############
# Variables   #
###############
title="Overlord"
# myname="dennis" - commented out as it is no longer needed
hostname=$(hostname)

###############
# Main        #
###############
# Changed the myname variable to USER and then added the modifiers to uppercase the first letter
# the date line added with two usages +%T shows the time using the 24h clock and +%A which shows full
# name of the day.  Now this is saved to a variable called hello
hello=$(cat <<EOF

Welcome to planet ${hostname^}, "$title ${USER^}!"
It is $(date +%T) on a $(date "+%H:%M %P") my Lord

EOF
)

# Cowsay the welcome now.... well MOOSE in this case
cowsay -f moose $hello

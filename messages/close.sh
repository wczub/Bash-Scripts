#!/bin/bash

# font color : green
color='\e[0;32m'

# font color : white
NC='\e[0m'

# Gets the size of the terminal window
size=$(tput cols)

# Divides terminal width in half, and subtracts half the good bye message (this includes the spaces)
starSize=$((size / 2 - 18 ))

# Creates the dashed line for the top and bottom
dash=$(printf '%*s\n' "${COLUMNS:-$size}" '' | tr ' ' -)

# Creates string of stars to center welcome message
star=""
for i in $(seq 1 $starSize); do star+="*"; done
# Checks to see if the width is even or odd so stars fit terminal width with no gap
# Also adds the good bye message text
if (( $size % 2 == 1))
then
    star="$star            Good Bye Will!           $star"
else
    star="$star           Good Bye Will!           $star"
fi

# Clears the terminal and prints the good bye message
clear
echo -e "${color}${dash// /*}"
echo "$star"
echo ""
echo -e "${color}${dash// /*}${NC}"

# Message stays for two seconds before closing
sleep 2
#end

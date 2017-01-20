#!/bin/bash
#welcome message

# font color : green
color='\e[0;32m'
quote='\e[0;34m'

# font color : white
NC='\e[0m'

# To extract ones digit of second from system clock
a=`date|cut -c 19`

# Array of quotes about programming

var=("Measuring programming progress by lines of code is like measuring aircraft building progress by weight." 
"If debugging is the process of removing software bugs, then programming must be the process of putting them in."
"Nine people can’t make a baby in a month." 
"Debugging is twice as hard as writing the code in the first place. Therefore, ifyou write the code as cleverly as possible, you are, by definition, not smartenough to debug it." 
"Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live." 
"When debugging, novices insert corrective code; experts remove defective code." 
"Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program" 
"Any fool can write code that a computer can understand. Good programmers write  code that humans can understand"
"One of my most productive days was throwing away 1000 lines of code." 
"Programming is like sex. One mistake and you have to support it for the rest of your life." )

#Authors are seperate for printing purposes, and they are 1:1 with quotes
auth=("-Bill Gates" "-Edsger Dijkstra" "-Fred Brooks" "-Brian W. Kernighan" "-Martin Golding" "-Martin Golding" "-Linus Trovalds" "-Martin Fowler" "-Ken Thompson" "-Michael Sinz" )

 
# Gets width of terminal
size=$(tput cols)

# Divides terminal width in half, and subtracts half the welcome message (this includes the spaces)
starSize=$((size / 2 - 20 ))

# Creates the dashed line for the top and bottom
dash=$(printf '%*s\n' "${COLUMNS:-$size}" '' | tr ' ' -)


# Creates string of stars to center welcome message
star=""
for i in $(seq 1 $starSize); do star+="*"; done
# Checks to see if the width is even or odd so stars fit terminal width with no gap
# Also adds the welcome message
if (( $size % 2 == 1))
then
	star="$star            Welcome back Will!           $star"
else
	star="$star           Welcome back Will!           $star"
fi

# This stores the smaller value between quote length and termianl width
# and stores it in pad, to align te authors name to either the terminal width
# or the end of the quote if the terminal is very large.
if (( ${#var[$a]} < $size ))
then
	pad=${#var[$a]}
else
	pad=$size
fi

# Where everything is printed
clear
echo -e "${color}${dash// /*}"
echo -e "$star"

# Prints the quote and wraps it if it's bigger than the terminal window and breaks the text
# on a space, so no words get broken up.
echo -e "${quote}\n${var[$a]}" | fold -w $size -s
printf "%$pad.${pad}s\n" "${auth[$a]}"
echo -e "${color}${dash// /*}${NC}"

#end

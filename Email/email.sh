#!/bin/bash
# Change email to your email
email="name@email.com"
# Subject and body correspond to the subject and body of the email
# you will receive. So, change to what you want the email to say.
# otherSub and otherBody refer to sending emails to other people
subject="Hey Beautiful"
body="You are lookin fine today!"
otherSub="The_Fab_File"
otherBody="Here is your lovely file that you requested!"

# to check the format of the email address
regex="^[a-z0-9_\+-]+(\.[a-z0-9_\+-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.([a-z]{2,4})$"

# '$#' is the number of fields supplied
# 1 means that they want to use the provided email in the script
# 2 means that they provided an email and want to use that instead.
if [ $# == 1 ] 
then 
	echo $body | mutt -s "$subject" $email -a $1 
	echo "Emailed $1 to $email";
elif [ $# == 2 ]
then
	# This lets you invert the placement of the email and file when
	# calling the script as well as checking the email address format
	# with regex
	if [[ $1 =~ $regex ]]
	then
		echo $otherBody | mutt -s $otherSub $1 -a $2 
		echo "Emailed $2 to $1"
	elif [[ $2 =~ $regex ]]
	then
		echo $otherBody | mutt -s $otherSub $2 -a $1
		echo "Emailed $1 to $2"
	else
		echo "Email address incorrect"
	fi
else
	echo "usage: email <file> | email <email address> <file>"
fi
#end

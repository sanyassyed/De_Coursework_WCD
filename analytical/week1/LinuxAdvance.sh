#!/bin/bash  # Correct shebang line for a bash script

####################
# if Statement example 
# Prompt the user to provide a value below ten with a trailing space instead of a newline
# \c is a backslash escape sequence that suppresses the trailing newline character. 
# This means that the cursor will remain on the same line right after the displayed text, allowing the user to enter their input on the same line.
# -e enables interpretation of backslash escapes, \c suppresses trailing newline
echo -e "Please provide a value below ten: \c"  

# Read the input value from the user and prevent backslashes from being interpreted as escape characters
# -r prevents backslashes from being interpreted as escape characters
read -r value  

# Check if the provided value is less than or equal to 10
# -le is the "less than or equal to" comparison for integers
if [ $value -le 10 ]  
then 
    # Print the provided value
    echo "You provided value is $value" 
    # Create files named /tmp/test1.txt through /tmp/test100.txt
    # Corrected range syntax from l..100 to 1..100
    touch /tmp/test{1..100}.txt  
    # Indicate that the script completed successfully
    echo "Script completed successfully"
fi

####################
# if-else statement example
# Prompt the user to enter a value folled by a trailing space instead of a newline
# -e enables interpretation of backslash escapes, \c suppresses trailing newline
echo -e "Enter any value> \c"  
read -r a  
echo -e "Enter any value> \c"  
read -r b  
# Check if the first value is greater than the second value
# -gt is the "greater than" comparison for integers
if [ $a -gt $b ]; then  
    # Print that the first value is greater than the second value
    echo "$a is greater than $b"
else 
    # Print that the second value is greater than or equal to the first value
    echo "$b is greater than $a"
fi

####################
# case example
echo -e "Enter a number: \c"  
read -r a  
echo -e "Enter another number: \c"  
read -r b  
# Print the menu options
echo "1. Sum of values" 
echo "2. Subtraction"  
echo "3. Multiplication"  
echo -e "Enter Your Choice from the above menu: \c"  
read -r ch  
# Perform an action based on the user's choice
case $ch in
    # Calculate and print the sum of the two numbers
    # $(...) is a more modern command substitution
    1) echo "Sum of $a + $b = $(expr $a + $b)";;  
    2) echo "Subtraction = $(expr $a - $b)";;  
    # Calculate and print the product of the two numbers
    # \* is the escape character for *
    3) echo "Multiplication = $(expr $a \* $b)";;  
    # Print an error message for invalid options
    # Corrected spelling from Oprion to Option
    *) echo "Invalid Option provided";;  
esac

####################
# for loop example
# Loop through each line in the file 'hostfile'
# $(...) is a more modern command substitution
for i in $(cat hostfile)  
do 
    # Ping the host once and save the output to /tmp/pingresults
    # -c 1 sends only one packet
    ping -c 1 $i > /tmp/pingresults  
    # Capture the exit status of the last command (0 if successful, non-zero otherwise)
    # $? captures the exit status of the last command
    valid=$?  
    # Check if the ping command failed (exit status greater than 1)
    # -gt is the "greater than" comparison for integers
    if [ $valid -gt 1 ]; then  
        # Print that the host is not reachable
        echo "$i Host is not reachable"
    else
        # Print that the host is reachable
        echo "$i Host is Up"
    fi 
done 

####################
# while loop example
echo -e "Please provide one value: \c"  
read -r c  
# Initialize the counter variable
i=1
# Loop while the counter is less than or equal to 10
# -le is the "less than or equal to" comparison for integers
while [ $i -le 10 ]  
do 
    # Calculate the product of the provided value and the counter
    # $(...) is a more modern command substitution, \* is the escape character for *
    b=$(expr $c \* $i)  
    # Print the product
    echo "$c * $i = $b"
    # Increment the counter
    # $(...) is a more modern command substitution
    i=$(expr $i + 1)  
done 

####################
# until loop example
# Prompt the user to enter an IP address to ping with a trailing space instead of a newline
echo -e "Please Enter the IP Address to Ping: \c"  
# Read the IP address and prevent backslashes from being interpreted as escape characters
read -r ip  
# Loop until the ping command successfully pings the host three times
# -c 3 sends three packets
until ping -c 3 $ip  
do 
    # Print that the host is still down
    echo "Host $ip is still down" 
    # Sleep for 1 second before the next attempt
    sleep 1  
done 
# Print that the host is now up
echo "Host $ip is up now"
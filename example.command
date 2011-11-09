#!/bin/sh

# example.sh
# system-type
#
# Created by Zack Smith on 11/8/11.
# Copyright 2011 318. All rights reserved.


declare -x command="./build/Release/system-type"

# cd into the run directory of our command
# Just here for the .command double click
cd "${0%/*}"


# Example command check as its not a standard binary
# you should install it where you need it.
if [ ! -x "$command" ] ; then
	echo "command missing ($command)"
	echo "did you cd into the directory?"
	exit 192
fi

# Example of how to parse the output
declare -i SYSTEM_TYPE="$($command)"
if [ $SYSTEM_TYPE == 1 ] ; then
	echo "This system is a desktop"
	# do stuff
elif [ $SYSTEM_TYPE == 2 ] ; then
	echo "This system is a laptop"
	# do stuff
fi

# Alternative implementation using the exit code
declare -x THIS_MACHINE_IS_DESKTOP="$command"

# Suppressing the output as all we want is the exit
if "$THIS_MACHINE_IS_A_DESKTOP" &>/dev/null ; then
	echo "The exit code was 0 for ($command)"
	# do stuff
else
	echo "The exit code was greater then 0 for ($command)"
	# do stuff
fi


exit $EXIT_CODE
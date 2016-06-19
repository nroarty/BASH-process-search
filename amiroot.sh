#!/bin/bash

# script to check if I am the root user

ERR_NOTROOT=88 	# Error if user is not root

echo $UID

if [ $UID -ne "0" ]; then
	echo "Not root"
	exit $ERR_NOTROOT
fi

exit 0

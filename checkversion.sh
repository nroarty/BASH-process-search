#!/bin/bash

# script to check for version number of operating system against test

VerifiedOS="Linux"			# OS verified with script
VerifiedRelease="4.4.0-24-generic"	# OS version verified with script

# Checking versions using specific commands to extract version/os information

if [ "$(uname -s)" = "$VerifiedOS" ] && [ "$(uname -r)" = "$VerifiedRelease" ] ; then
	echo "Operating system and version are verified"
else
	echo "WARNING - This script has not been tested against this release"
fi


# Using Awk to extract fields from generic output for compafison

if [ "$(uname -a | awk '{print $1}')" = "$VerifiedOS" ] \
   && \
   [ "$(uname -a | awk '{print $3}')" = "$VerifiedRelease" ] ; then
	echo "Operating system and version are verified, using awk to extract"
else
	echo "WARNING - This script has not been tested against this release, using awk to extract"
fi

exit 0

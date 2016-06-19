#!/bin/bash

# script to check for version number of operating system against test

VerifiedOS="Linux"			# OS verified with script
VerifiedRelease="4.4.0-21-generic"	# OS version verified with script

CurrentOS=$(uname -s)

if [ $(uname -s) = $VerifiedOS ] && [ $(uname -r) = $VerifiedRelease ] ; then
	echo "Operating system and verision are verified"
else
	echo "WARNING - This script has not been tested against this release"
fi

uname -a | awk '{print $1}'
uname -a | awk '{print $3}'

if [ $(uname -a | awk '{print $1}') = $VerifiedOS ] \
   && \
   [ $(uname -a | awk '{print $3}') = $VerifiedRelease ] ; then
	echo "Operating system and version are verified using awk"
else
	echo "WARNING - This script has not been tested against this release awk"
fi
exit 0

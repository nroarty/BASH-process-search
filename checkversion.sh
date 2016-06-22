#!/bin/bash

# script to check for version number of operating system against test

VERIFIED_OS="Linux"			# OS verified with script
VERIFIED_RELEASE="4.4.0-24-generic"	# OS version verified with script

# Checking versions using specific commands to extract version/os information

if [ "$(uname -s)" = "$VERIFIED_OS" ] && [ "$(uname -r)" = "$VERIFIED_RELEASE" ] ; then
	echo "Operating system and version are verified"
else
	echo "WARNING - This script has not been tested against this release"
fi


# Using Awk to extract fields from generic output for compafison

if [ "$(uname -a | awk '{print $1}')" = "$VERIFIED_OS" ] \
   && \
   [ "$(uname -a | awk '{print $3}')" = "$VERIFIED_RELEASE" ] ; then
	echo "Operating system and version are verified, using awk to extract"
else
	echo "WARNING - This script has not been tested against this release, using awk to extract"
fi

exit 0

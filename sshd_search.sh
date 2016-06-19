#!/bin/bash

# sshd_search.sh
# version 0.3
# script to search for whether sshdd is installed and version numbers

# search home directories for rogue executables

LOGFILE=./sshd_search.log	# default location for script output
ERR_NotRoot=60				# error code for not root user

#if [ $UID -ne 0 ] ; then
#	echo Not root user
#	exit $ERR_NotRoot
#fi

#if [ -n $1 ] ; then
#   LOGFILE=$1
#fi

# Check location of executable and whether they are running

touch $LOGFILE
echo Script executed\:  $(date) >> $LOGFILE

if [ $(which sshd)!="" ] ; then
	echo $(which sshd) is installed >> $LOGFILE
#	echo Version: $(sshd --version | head -n1) >> $LOGFILE  
#	ps -ef | sed -n '/sshd/p'| sed '/sed/d' >> $LOGFILE
#+ the following line works better than the one above, more elegant
	ps -ef | sed -n -e '/sshd/ {/sed/!p}' >> $LOGFILE
fi

echo >> $LOGFILE

exit 0

#!/bin/bash

# bash_search.sh
# version 0.2
# script to search for whether bash is installed and version numbers

# search home directories for rogue executables

LOGFILE=./bash_search.log	# default location for script output
ERR_NotRoot=60				# error code for not root user

#if [ $UID -ne 0 ] ; then
#	echo Not root user
#	exit $ERR_NotRoot
#fi

#if [ -n $1 ] ; then
#LOGFILE=$1
#fi

# Check location of executable and whether they are running

touch $LOGFILE
echo Script executed\:  $(date) >> $LOGFILE

if [ $(which bash)!="" ] ; then
	echo $(which bash) is installed >> $LOGFILE
	echo Verion: $(bash --version | head -n1) >> $LOGFILE
	ps -ef | sed -n '/bash/p'| sed '/sed/d' >> $LOGFILE
fi

echo >> $LOGFILE

exit 0

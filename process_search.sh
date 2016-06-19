#!/bin/bash

# process_search.sh
# version 0.4
# script to search for whether an executable is installed and running on 
#+ a system

LOGFILE=./process_search.log	# default location for script output
ERR_args=60						# incorrect arguments provided at command line

if [ $# -ne 1 ] ; then
    echo Incorrect arguments.
	echo Correct usage\:  process_search.sh \<process name\>
	exit $ERR_args
else
	PROCESS=$1
fi

# Check location of executable and whether they are running

echo Script executed\:  $(date) >> $LOGFILE

if [ $(which $PROCESS)!="" ] ; then
	echo $(which $PROCESS) is installed >> $LOGFILE 
	ps -ef | sed -n -e "/$PROCESS/ {/sed\|process_search.sh/!p}" >> $LOGFILE
else
	echo $PROCESS is not registered on system
fi

echo >> $LOGFILE

exit 0

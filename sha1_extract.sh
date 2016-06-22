#!/bin/bash

# sha1_extract.sh
# Version 0.3

JDK_VERSION=1.8.0_25					# version of JDK tested with this script
KEYSTORE_PATH=~/.local/share/Xamarin/Mono\ for\ Android/debug.keystore  # location of keystore
KEYTOOL_PATH=/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/keytool # location of keytool

# script exit error codes
ERR_KEYTOOL=60						# keytool not found on system
ERR_KEYSTORELOC=61					# keystore not found in default location


# Check to see if installed java version is the same the script was tested against

JDKinstall=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' ) # determine the version of java installed

if [ "$JDKinstall" != "$JDK_VERSION" ] ; then
	echo Script tested against JDK version - $JDK_VERSION
	echo Currently installed version of JDK - $JDKinstall
	echo Script has not been tested with installed version.
fi

# Verify that the keytool installed on the system - first check if in PATH then in default locatio

keytool_location=$(which keytool)
if [ -z $keytool_location ] ; then
	echo keytool is not registered in default path
	if [ -a "$KEYTOOL_PATH" ] ; then
			keytool_location=$KEYTOOL_PATH
			echo keytool has been found in current java version path
	else
		echo keytool utility is not installed, unable to extract encryption key
		ext $ERR_KEYTOOL
	fi	
fi


# Verify that keystore is installed in default location, if present pull out the SHA1 key

if [ -a "$KEYSTORE_PATH" ] ; then
	keystore=$($keytool_location -list -v -keystore "$KEYSTORE_PATH" -storepass android -keypass android | sed -n "/SHA1:/p")
	echo $keystore
else
	echo Keystore not present in default location, unable to extact encryption key
	exit $ERR_KEYSTORELOC
fi

exit 0


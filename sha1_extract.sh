#!/bin/bash

# sha1_extract.sh
# Version 0.1

JDKversion=1.8.0_25					# version of JDK tested with this script
keystore_loc=~/.local/share/Xamarin/Mono\ for\ Android/debug.keystore  # location of keystore

# script exit error codes
err_keytool=60						# keytool not found on system
err_keystoreloc=61					# keystore not found in default location


# Check to see if installed java version is the same the script was tested against

JDKinstall=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' ) # determine the version of java installed

if [ "$JDKinstall" != "$JDKversion" ] ; then
	echo Script tested against JDK version - $JDKversion
	echo Currently installed version of JDK - $JDKinstall
	echo Script has not been tested with installed version.
fi

# Verify that the keytool installed on the system - first check if in PATH then in default location
if [ -z $(which keytool) ] ; then
	echo keytool is not registered in default path
	if [ -a "/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/keytool" ] ; then
			keytool_loc="/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/keytool"
			echo keytool has been found in current java version path
	else
		echo keytool utility is not installed, unable to extract encryption key
		ext 60
	fi	
else
	keytool_loc=$(which keytool)
fi

# Verify that keystore is installed in default location, if present pull out the SHA1 key
if [ -a "$keystore_loc" ] ; then
	keystore=$($keytool_loc -list -v -keystore "$keystore_loc" -storepass android -keypass android | sed -n "/SHA1:/p")
	echo $keystore
else
	echo Keystore not present in default location, unable to extact encryption key
	exit $err_keystoreloc
fi

exit 0


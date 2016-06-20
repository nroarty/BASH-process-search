# bash-scripts
Simple BASH scripts for Linux and Mac scripts.

## Script snippets
I've called these snippets, they're little pieces of script that can be copy/pasted into other scripts to make them more bullet proof:
- **amiroot.sh** - this script is used to check whether or not the user running the script has root priviliges, sometimes a script will require a user to have root privilige to run some of the commands.  This snippet will verify whether the script is being run with those priviliges
- **checkversion.sh** - this script checks whether the operating systems type (e.g. Linux, Darwin (MacOS)) and the operating system kernel version matches a pre-defined version which the script was written under.  If a script is POSIX compliant there's a pretty good chance that it will be portable.  Sometimes there are o/s commands that are deprecated in later releases which may cause compatibility problems.

## Script
Some scripts that I've written that carry out a function:
- **sha1_extract.sh** - this script was written for a buddy who wanted a simple script to extract an SHA1 key from a keystore, this is a common requirement for publishing Android apps.  The command line to extract the key is cumbersome so this script automates the process
- **bash_search.sh** - this script will search whether or not bash is running on a system, the reason for this script was to play around with the use of sed to tidy up the output.  This script is a precursor to the sshd_search.sh script.
- **process_search.sh** - this script will take a string from the user and check if it corresponds with an installed and running process.
- **sshd_search.sh** - this script is still a work in process, I wanted to write a script to query sshd versions running on a system.  I need to spend some more time figuring out the best way to extract the SSHD version number from a system.

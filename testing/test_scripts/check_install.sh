###############################################################################

# This script tests the if a perticular tool is installed or not

#Usage:
# $ sh check_install.sh <tool_name>

################################################################################

#!/bin/bash

if [ `which $1 2>&1 >/dev/null | grep -c no` -eq 1 ]
then 
	echo "$1 is not installed"
	armor_utility $1
	exit 1 
fi

exit 0

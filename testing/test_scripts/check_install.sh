###############################################################################

# This script tests the if a perticular tool is installed or not

#Usage:
# $ sh check_install.sh <tool_name>

################################################################################

#!/bin/bash

if [ -z "$(which $1 2>/dev/null)" ]
then 
	echo "$1 is not installed"
	armor_utility $1
	exit 1 
fi

exit 0

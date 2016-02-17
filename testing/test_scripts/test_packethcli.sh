###############################################################################

# This script does basic tests for the packETHcli tools

#Usage:
# $ sh test_packETHcli.sh

################################################################################
#!/bin/bash

if [ "$1" = '' ]; then
    echo "Invalid parameter passed. Usage sh test_packETHcli.sh <Eth device>" 
    exit
fi
 
# Testing packETHcli
packETHcli -i $1 -m 2 -d 1000 -n 300 -f packETHcli_test_file.pcap
exit



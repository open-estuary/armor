###############################################################################

# This script tests the supported Armor tools on Estuary Platform

#Example:
# $ sh auto_test_armor_tools_int01.sh <tool's name>

################################################################################
#!/bin/bash
    
echo "Auto Testing ARMOR_INT0x Tools ..."

sh run_armor_tools_int01.sh -h>log

filename="log"
counter=0

while read line
do
    counter=$((counter+1))
    if [ "$counter" -gt 2 ]; 
    then
        name=$line
        if [ "$name" != 'gdb' ]
        then
            sh run_armor_tools_int01.sh $name
            sleep 3
        fi
     fi 
done < "$filename"
#run gdb at the end   
sh run_armor_tools_int01.sh gdb

rm log
echo "Auto Testing ARMOR_INT01 Tools Done"


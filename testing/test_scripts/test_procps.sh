###############################################################################

# This script tests the procps tools on Estuary Platform

#Usage:
# $ sh test_procps.sh

################################################################################
#!/bin/bash
    
#procps
ps --version
#top --version
#w --version
#vmstat --version
#free --version 
#slabtop --version 
#skill --version
status=$?
if test $status -eq 0
then
   echo "Command ps --version passed"
else
   echo "Command ps --version failed"
   exit
fi

echo "ps -ef"
ps -ef
status=$?
if test $status -eq 0
then
   echo "Command ps -ef passed"
else
   echo "Command ps -ef failed"
   exit
fi

echo "w"
w
status=$?
if test $status -eq 0
then
   echo "Command w passed"
else
   echo "Command w failed"
   exit
fi

echo "free"
free
status=$?
if test $status -eq 0
then
   echo "Command free passed"
else
   echo "Command free failed"
   exit
fi

echo "slabtop -o"
slabtop -o
status=$?
if test $status -eq 0
then
   echo "Command slabtop -o passed"
else
   echo "Command slabtop -o failed"
   exit
fi


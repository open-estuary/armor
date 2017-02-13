###############################################################################

# This script tests the procps tools on Estuary Platform

#Usage:
# $ sh test_procps.sh

################################################################################
#!/bin/bash

bash check_install.sh ps
status=$?
if test $status -eq 1
then
        exit
fi
  
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
   echo "Command ps --version [PASS]"
else
   echo "Command ps --version [FAIL]"
   exit
fi

echo "ps -ef"
ps -ef
status=$?
if test $status -eq 0
then
   echo "Command ps -ef [PASS]"
else
   echo "Command ps -ef [FAIL]"
   exit
fi

echo "w"
w
status=$?
if test $status -eq 0
then
   echo "Command w [PASS]"
else
   echo "Command w [FAIL]"
   exit
fi

echo "free"
free
status=$?
if test $status -eq 0
then
   echo "Command free [PASS]"
else
   echo "Command free [FAIL]"
   exit
fi

echo "slabtop -o"
slabtop -o
status=$?
if test $status -eq 0
then
   echo "Command slabtop -o [PASS]"
else
   echo "Command slabtop -o [FAIL]"
   exit
fi


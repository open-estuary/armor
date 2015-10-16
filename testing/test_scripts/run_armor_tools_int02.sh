###############################################################################

# This script tests the supported Armor tools on Estuary Platform

#Example:
# $ sh run_armor_tools_int02.sh <tool's name>

################################################################################
#!/bin/bash
    
 #ARMOR_INT02 Tools

if [ "$1" = '' ]; then
    echo "Usage: sh run_armor_tools_int02.sh <tool's name>"
    exit
fi

if [ "$1" = '-h' ]; then
    echo "Usage: sh run_armor_tools_int02.sh <tool's name>"
    echo "Supported Tools List:"
    echo "tiptop"
    echo "iotop"
    echo "blktrace"
    echo "dstat"
    echo "procps"
    echo "nicstat"
    echo "lldptool"
    echo "oprofile"
    echo "latencytop"
    echo "systemtap"
    echo "crash"
    exit
fi

echo "Testing the Debug Tool $1..."

#tiptop
if [ "$1" = 'tiptop' ]; then
   tiptop --version
   status=$?
   if test $status -eq 0
   then
       echo "Command tiptop  --version passed"
   else
       echo "Command tiptop --version failed"
       exit
   fi

   echo "tiptop"
   tiptop
   status=$?
   if test $status -eq 0 
   then 
       echo "Command tiptop passed"
   else   
       echo "Command tiptop failed"
       exit
   fi
   exit
fi

#iotop
if [ "$1" = 'iotop' ]; then
   iotop -v
   status=$?
   if test $status -eq 0
   then
       echo "Command iotop  -v passed"
   else
       echo "Command iotop -v failed"
       exit
   fi

   echo "iotop -b -n 3"
   iotop
   status=$?
   if test $status -eq 0
   then
       echo "Command iotop -b -n 3 passed"
   else
       echo "Command iotop -b -n 3 failed"
       exit
   fi
   exit
fi

#blktrace
if [ "$1" = 'blktrace' ]; then
   blktrace -v
   status=$?
   if test $status -eq 0
   then
       echo "Command blktrace  -v passed"
   else
       echo "Command blktrace -v failed"
       exit
   fi

   echo "blktrace -d /dev/sda -w 3"
   blktrace -d /dev/sda -w 3
   status=$?
   if test $status -eq 0
   then
       echo "Command blktrace -d /dev/sda -w 3 passed"
   else
       echo "Command blktrace -d /dev/sda -w 3 failed"
       exit
   fi
   exit
fi

#dstat
if [ "$1" = 'dstat' ]; then
   dstat -v
   status=$?
   if test $status -eq 0
   then
       echo "Command dstat  -v passed"
   else
       echo "Command dstat -v failed"
       exit
   fi

   echo "dstat -all 1 4"
   dstat -all 1 4
   status=$?
   if test $status -eq 0
   then
       echo "Command dstat -all 1 4 passed"
   else
       echo "Command dstat -all 1 4 failed"
       exit
   fi
   exit
fi

#procps
if [ "$1" = 'procps' ]; then
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
fi

#nicstat
if [ "$1" = 'nicstat' ]; then
   nicstat -v   
   status=$?
   if test $status -eq 0
   then
       echo "Command nicstat -v passed"
   else
       echo "Command nicstat -v failed"
       exit
   fi

   echo "nicstat 1 5"
   nicstat 1 5
   status=$?
   if test $status -eq 0
   then
       echo "Command nicstat 1 5 passed"
   else
       echo "Command nicstat 1 5 failed"
       exit
   fi
fi

lldptool
if [ "$1" = 'lldptool' ]; then
   lldptool -v
   status=$?
   if test $status -eq 0
   then
       echo "Command lldptool -v passed"
   else
       echo "Command lldptool -v failed"
       exit
   fi

   echo "Configure LLDP adminStatus to Receive and Transmit for interface eth3"
   lldptool set-lldp -i eth3 adminStatus=rxtx   
   status=$?
   if test $status -eq 0
   then
       echo "Command  lldptool set-lldp -i eth3 adminStatus=rxtx  passed"
   else
       echo "Command lldptool set-lldp -i eth3 adminStatus=rxtx failed"
       exit
   fi

   echo "Query the local TLVs which are being transmitted for a given interface"
   lldptool -t -i eth3
   status=$?
   if test $status -eq 0
   then
       echo "Command lldptool -t -i eth3 passed"
   else
       echo "Command lldptool -t -i eth3 failed"
       exit
   fi

fi

#oprofile
if [ "$1" = 'oprofile' ]; then
   operf -v
   status=$?
   if test $status -eq 0
   then
       echo "Command operf -v passed"
   else
       echo "Command operf -v failed"
       exit
   fi

   echo "operf"
   operf   
   status=$?
   if test $status -eq 0
   then
       echo "Command  operf passed"
   else
       echo "Command operf failed"
       exit
   fi

   echo "opreport"
   opreport
   status=$?
   if test $status -eq 0
   then
       echo "Command opreport passed"
   else
       echo "Command opreport failed"
       exit
   fi

fi

#latencytop
if [ "$1" = 'latencytop' ]; then
   echo "latencytop"
   echo "To exit latencytop, please press ctrl-C"
   latencytop                    
   status=$?
   if test $status -eq 0
   then
       echo "Command latencytop passed"
   else
       echo "Command latencytop failed"
       exit
   fi
fi

#systemtap
if [ "$1" = 'systemtap' ]; then
   stap  --version
   status=$?
   if test $status -eq 0
   then
       echo "Command stap --version passed"
   else
       echo "Command stap --version failed"
       exit
   fi
   echo "No further stap tests are supported"
fi

#crash
if [ "$1" = 'crash' ]; then
   crash  -v
   status=$?
   if test $status -eq 0
   then
       echo "Command crash -v passed"
   else
       echo "Command crash -v failed"
       exit
   fi
fi

echo "Testing Debug Tool $1 is not supported."



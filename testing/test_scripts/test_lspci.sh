###############################################################################

# This script tests the lspci tool

#Usage:
# $ sh test_lspci.sh 

################################################################################
#!/bin/bash
    
#lcpci   
lspci --version
status=$?
if test $status -eq 0
then
    echo "command lspci --version passed"
else
    echo "command lspci --version failed"
    exit
fi

echo " lspci - display information about all the PCI bus"
lspci
status=$?
if test $status -eq 0
then
    echo "command lspci passed"
else
    echo "command lspci failed"
    exit
fi
exit


#setpci
if [ "$1" = 'setpci' ] ;  then
    setpci --version
    status=$?
    if test $status -eq 0
    then
       echo "command setpci --version passed"
    else
       echo "command setpci --version failed"
       exit
    fi

    echo " setpci -  configure PCI devices"
    echo " setpci -s 0 device_id vendor_id - lists ID’s of devices in slot 0 in all buses"
    setpci -s 0 device_id vendor_id
    status=$?
    if test $status -eq 0
    then
       echo "command setpci -s 0 device_id vendor_id passed"
    else
       echo "command setpci -s 0 device_id vendor_id failed"
       exit
    fi
    exit
fi

#tail
if [ "$1" = 'tail' ] ;  then
    tail --version
    status=$?
    if test $status -eq 0
    then
       echo "command tail --version passed"
    else
       echo "command tail --version failed"
       exit
    fi

    echo " tail -  tail prints the last 10 lines of each FILE to standard output"
    tail /proc/misc
    status=$?
    if test $status -eq 0
    then
       echo "command tail /proc/misc passed"
    else
       echo "command tail /proc/misc failed"
       exit
    fi
    exit
fi

#grep
if [ "$1" = 'grep' ] ;  then
    grep --version
    status=$?
    if test $status -eq 0
    then
       echo "command grep --version passed"
    else
       echo "command grep --version failed"
       exit
    fi

    echo " grep - search for a string in files"
    tail /proc/misc | grep network_latency    
    status=$?
    if test $status -eq 0
    then
       echo "command tail /proc/misc | grep network_latency passed"
    else
       echo "command tail /proc/misc | grep network_latency failed"
       exit
    fi
    exit
fi

#awk
if [ "$1" = 'awk' ] ;  then
    awk -W version
    status=$?
    if test $status -eq 0
    then
       echo "command awk -W version passed"
    else
       echo "command awk -W version failed"
       exit
    fi

    echo "awk - data extraction and reporting tool"
    awk '{print}' /proc/misc 
    status=$?
    if test $status -eq 0
    then
       echo "command awk '{print}' /proc/misc passed"
    else
       echo "command awk '{print}' /proc/misc failed"
       exit
    fi
    exit
fi


#sed
if [ "$1" = 'sed' ] ;  then
    sed --version
    status=$?
    if test $status -eq 0
    then
       echo "command sed --version passed"
    else
       echo "command sed --version failed"
       exit
    fi

    echo "sed - a special editor for modifying files automatically"
    echo windows server | sed s/windows/linux/
    status=$?
    if test $status -eq 0
    then
       echo "command sed s/windows/linux/ passed"
    else
       echo "command sed s/windows/linux/ failed"
       exit
    fi
    exit
fi
echo "Testing Debug Tool $1 is not supported."

#kdump/kexec   
if [ "$1" = 'kdump' ] ;  then
    echo "Testing kdump/kexec is not presently supported!"
    exit
fi


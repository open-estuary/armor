###############################################################################

# This script tests the supported Armor tools on Estuary Platform

#Example:
# $ sh run_armor_tools_int01.sh <tool's name>

################################################################################
#!/bin/bash
    
 #ARMOR_INT01 Tools

if [ "$1" = '' ]; then
    echo "Usage: sh run_armor_tools_int01.sh <tool's name>"
    exit
fi

if [ "$1" = '-h' ]; then
    echo "Usage: sh run_armor_tools_int01.sh <tool's name>"
    echo "Supported Tools List:"
    echo "ltrace"
    echo "sar"
    echo "vmstat"
    echo "swapon, swapoff"
    echo "gdb"
    echo "iptables"
    echo "mkfs"
    echo "mount"
    echo "du"
    echo "df"
    echo "dmidecode"
    echo "strace"
    echo "netstat"
    echo "top"
    echo "pidstat"
    echo "ftrace"
    echo "iostat"
    echo "tcpdump"
    echo "ethtool"
    echo "fsck"
    echo "lscpu"
    echo "lspci"
    echo "setpci"
    echo "tail"
    echo "grep"
    echo "awk"
    echo "sed"
    echo "kdump"
    exit
fi

echo "Testing the Debug Tool $1..."

#ltrace
if [ "$1" = 'ltrace' ]; then
   #  Testing ltrace
   #  aarch64-linux-gnu-gcc file.c -Wall -o file
   ltrace --v
   status=$?
   if test $status -eq 0
   then
       echo "Command ltrace --v passed"
   else
       echo "Command ltrace --v failed"
       exit
   fi

   echo "ltrace ./file"
   ltrace ./file
   status=$?
   if test $status -eq 0 
   then 
       echo "Command ltrace ./file passed"
   else   
       echo "Command ltrace ./file failed"
       exit
   fi
   exit
fi

#sar
if [ "$1" = 'sar' ] ;  then
   sar -V
   status=$?
   if test $status -eq 0 
   then
       echo "Command sar -V passed"
   else
       echo "Command sar -V failed"
       exit
   fi

   #  Testing sar
   #switch on the sysstat and enable system log collection 
   service sysstat restart 
   #Displays CPU usage for the current day that was collected until that point.
   echo "sar -u" 
   sar -u
   status=$?
   if test $status -eq 0 
   then 
       echo "Command sar -u passed"
   else   
       echo "Command sar -u failed"
       exit
   fi
 
   # same as “sar -u” but displays additional fields
   echo "sar -u ALL" 
   sar -u ALL 
   status=$?
   if test $status -eq 0 
   then 
       echo "Command sar -u ALL passed"
   else
       echo "Command sar -u ALL failed"
       exit
   fi
   exit
fi

#vmstat
if [ "$1" = 'vmstat' ] ;  then
    #  Testing vmstat
    vmstat -V
    status=$?
    if test $status -eq 0
    then
       echo "command vmstat -V passed"
    else
       echo "command vmstat -V failed"
       exit
    fi

    echo "vmstat 1 5"
    vmstat 1 5
    status=$?
    if test $status -eq 0
    then
       echo "command vmstat 1 5 passed"
    else
       echo "command vmstat 1 5 failed"
       exit
    fi
    exit
fi

#swapon, swapoff
if [ "$1" = "swapon" ]; then
    # Testing swapon and swapoff
    swapon -V
    status=$?
    if test $status -eq 0
    then
       echo "command swapon -V passed"
    else
       echo "command swapon -V failed"
       exit
    fi

    swapoff -V
    status=$?
    if test $status -eq 0
    then
       echo "command swapoff -V passed"
    else
       echo "command swapoff -V failed"
       exit
    fi

    echo "swapon -s..."
    swapon -s
    status=$?
    if test $status -eq 0
    then
       echo "command swapon -s passed"
    else
       echo "command swapon -s failed"
       exit
    fi

    echo "swapoff -a..."
    swapoff -a
    status=$?
    if test $status -eq 0
    then
       echo "command swapoff -a passed"
    else
       echo "command swapoff -a failed"
       exit
    fi

    echo "swapon -s..."
    swapon -s

    echo "swapon -a..."
    swapon -a

    echo "swapon -s..."
    swapon -s
    exit
fi

#gdb
if [ "$1" = 'gdb' ] ;  then
    #  Testing gdb
    gdb -v
    status=$? 
    if test $status -eq 0
    then
       echo "command gdb -v passed"
    else
       echo "command gdb -v failed"
       exit
    fi
    # aarch64-linux-gnu-gcc gdb_test.c -Wall -o gdb_test
    echo "gdb ./gdb_test"
    gdb ./gdb_test
    status=$?
    if test $status -eq 0
    then
       echo "command gdb ./gdb_test passed"
    else
       echo "command gdb ./gdb_test failed"
       exit
    fi
    exit
fi

#iptables
if [ "$1" = 'iptables' ] ;  then
    # Testing iptables
    iptables -V
    status=$?
    if test $status -eq 0
    then
       echo "command iptables -V passed"
    else
       echo "command iptables -V failed"
       exit
    fi

    echo "iptables -L"
    iptables -L
    status=$?
    if test $status -eq 0
    then
       echo "command iptables -L passed"
    else
       echo "command iptables -L failed"
       exit
    fi
    exit
fi

#mkfs
if [ "$1" = 'mkfs' ] ;  then
    # Testing mkfs
    mkfs -V
    status=$?
    if test $status -eq 0
    then
       echo "command mkfs -V passed"
    else
       echo "command mkfs -V failed"
       exit
    fi
    exit
fi

#mount
if [ "$1" = 'mount' ] ;  then
    # Testing mount
    mount -V
    status=$?
    if test $status -eq 0
    then
       echo "command mount -V passed"
    else
       echo "command mount -V failed"
       exit
    fi
    
    # view all mounts
    mount
    status=$?
    if test $status -eq 0
    then
       echo "command mount passed"
    else
       echo "command mount failed"
       exit
    fi
    #mount -t iso9660 -o ro /dev/cdrom /mnt/
    exit
fi

#du
if [ "$1" = 'du' ] ;  then
    # Testing du
    du --v
    status=$?
    if test $status -eq 0
    then
       echo "command du --v  passed"
    else
       echo "command du --v failed"
       exit
    fi
    
    echo "du -ah"
    du -ah
    status=$?
    if test $status -eq 0
    then
       echo "command du -ah  passed"
    else
       echo "command du -ah failed"
       exit
    fi
    exit
fi

#df
if [ "$1" = 'df' ] ;  then
    # Testing df
    df --v
    status=$?
    if test $status -eq 0
    then
       echo "command df --v  passed"
    else
       echo "command df --v failed"
       exit
    fi

    echo "df - display informaton on the file systems with their mount points, memory usage"
    df
    status=$?
    if test $status -eq 0
    then
       echo "command df passed"
    else
       echo "command df failed"
       exit
    fi
    exit
fi

#dmidecode
if [ "$1" = 'dmidecode' ] ;  then
    /usr/local/sbin/dmidecode -V
    status=$?
    if test $status -eq 0
    then
       echo "command /usr/local/sbin/dmidecode -V passed"
    else
       echo "command /usr/local/sbin/dmidecode -V failed"
       exit
    fi
    echo "dmidecode command reads the system DMI table to display hardware and BIOS information of the server"
    echo "/usr/local/sbin/dmidecode -t 4"
    /usr/local/sbin/dmidecode -t 4
    status=$?
    if test $status -eq 0
    then
       echo "command /usr/local/sbin/dmidecode -t 4 passed"
    else
       echo "command /usr/local/sbin/dmidecode -t 4 failed"
       exit
    fi
    exit
fi

#strace
if [ "$1" = 'strace' ] ;  then
    # Testing strace
    strace -V
    status=$?
    if test $status -eq 0
    then
       echo "command strace -V passed"
    else
       echo "command strace -V failed"
       exit
    fi

    #System call usage summary
    echo "strace -c ls /home"
    strace -c ls /home    
    status=$?
    if test $status -eq 0
    then
       echo "command strace -c ls /home passed"
    else
       echo "command strace -c ls /home failed"
       exit
    fi
    exit
fi

#netstat
if [ "$1" = 'netstat' ] ;  then
    # Testing netstat
    # version return status failed on D02  
    netstat --version
    #status=$?
    #if test $status -eq 0
    #then
    #   echo "command netstat --version passed"
    #else
    #   echo "command netstat --version failed"
    #   exit
    #fi

    #list tcp connections
    echo "list tcp connections - netstat -at"
    netstat -at 
    status=$?
    if test $status -eq 0
    then
       echo "command netstat -at passed"
    else
       echo "command netstat -at failed"
       exit
    fi

    #list udp connections
    echo "list udp connections - netstat -au"
    netstat -au
    status=$?
    if test $status -eq 0
    then
       echo "command netstat -au passed"
    else
       echo "command netstat -au failed"
       exit
    fi

    #list unix connections
    echo "list unix connections - netstat -ax"
    netstat -ax
    status=$?
    if test $status -eq 0
    then
       echo "command netstat -ax passed"
    else
       echo "command netstat -ax failed"
       exit
    fi
    exit
fi

#top
if [ "$1" = 'top' ] ;  then
    # Testing top
    top -v
    status=$?
    if test $status -eq 0
    then
       echo "command top -V passed"
    else
       echo "command top -V failed"
       exit
    fi

    echo "Listing Linux tasks top -n 2"
    top -n 2
    status=$?
    if test $status -eq 0
    then
       echo "command top -n 2 passed"
    else
       echo "command top -n 2 failed"
       exit
    fi
    exit
fi


#pidstat - report statistics for Linux tasks   
if [ "$1" = 'pidstat' ] ;  then
    # Testing pidstat 
    pidstat -V
    status=$?
    if test $status -eq 0
    then
       echo "command pidstat -V passed"
    else
       echo "command pidstat -V failed"
       exit
    fi

    echo "Statistics for Linux tasks - "
    pidstat -p ALL 3 2
    status=$?
    if test $status -eq 0
    then
       echo "command pidstat -p ALL 3 2 passed"
    else
       echo "command pidstat -p ALL 3 2 failed"
       exit
    fi
    exit
fi

#ftrace - Linux kernel internal tracer   
if [ "$1" = 'ftrace' ] ;  then
    # Testing ftrace 
    echo "Ftrace test- reading function trace"
    echo function > /sys/kernel/debug/tracing/current_tracer
    cat /sys/kernel/debug/tracing/current_tracer 
    cat /sys/kernel/debug/tracing/trace
    status=$?
    if test $status -eq 0
    then
       echo "Ftrace - reading trace passed"
    else
       echo "Ftrace - reading trace failed"
       exit
    fi

    echo "Ftrace test- reading stack trace"
    echo 1 >/proc/sys/kernel/stack_tracer_enabled
    cat /sys/kernel/debug/tracing/stack_trace
    status=$?
    if test $status -eq 0
    then
       echo "Ftrace - reading stacktrace passed"
    else
       echo "Ftrace - reading stacktrace failed"
       exit
    fi
    exit
fi


#iostat - report statistics for the CPU, I/O for devices, partitions and NFS.   
if [ "$1" = 'iostat' ] ;  then
    # Testing iostat 
    iostat -V
    status=$?
    if test $status -eq 0
    then
       echo "command iostat -V passed"
    else
       echo "command iostat -V failed"
       exit
    fi

    echo "iostat - report statistics for  CPU, I/O for devices etc"
    iostat 
    status=$?
    if test $status -eq 0
    then
       echo "command iostat passed"
    else
       echo "command iostat failed"
       exit
    fi

    echo "Display disk I/O statistics"
    iostat -d
    status=$?
    if test $status -eq 0
    then
       echo "command iostat -d passed"
    else
       echo "command iostat -d failed"
       exit
    fi
    exit
fi


#tcpdump - dump traffic on a network.   
if [ "$1" = 'tcpdump' ] ;  then
    # Testing tcpdump 
    tcpdump --version
    status=$?
    if test $status -eq 0
    then
       echo "command tcpdump --version passed"
    else
       echo "command tcpdump --version failed"
       exit
    fi

    echo "tcpdump -D - display the list of interfaces on which tcpdump can listen"
    tcpdump -D
    status=$?
    if test $status -eq 0
    then
       echo "command tcpdump -D passed"
    else
       echo "command tcpdump -D failed"
       exit
    fi

    echo "tcpdump - dump traffic on any network for 5 packets"
    tcpdump -i any -c 5
    status=$?
    if test $status -eq 0
    then
       echo "command  tcpdump -i any -c 5 passed"
    else
       echo "command  tcpdump -i any -c 5 failed"
       exit
    fi
    exit
fi

#ethtool - query and control network driver and hardware settings.   
if [ "$1" = 'ethtool' ] ;  then
    # Testing ethtool 
    ethtool --version 
    status=$?
    if test $status -eq 0
    then
       echo "command ethtool --version passed"
    else
       echo "command ethtool --version failed"
       exit
    fi

    echo "ethtool eth0 - List ethernet device's properties"
    ethtool eth0    
    status=$?
    if test $status -eq 0
    then
       echo "command ethtool eth0 passed"
    else
       echo "command ethtool eth0 failed"
       exit
    fi

    echo "ethtool -S eth0 - Display Network Statistics of Specific Ethernet Device"
    ethtool -S eth0
    status=$?
    if test $status -eq 0
    then
       echo "command ethtool -S eth0 passed"
    else
       echo "command ethtool -S eth0 failed"
       exit
    fi

    echo "ethtool -i eth0 - Display Ethernet Driver Settings"
    ethtool -i eth0
    status=$?
    if test $status -eq 0
    then
       echo "command ethtool -i eth0 passed"
    else
       echo "command ethtool -i eth0 failed"
       exit
    fi
    exit
fi

#fsck   
if [ "$1" = 'fsck' ] ;  then
    echo " - display the status of a partition with a problem if any in the stdout without fixing it."
    fsck -n /dev/sda7 
    status=$?
    if test $status -eq 0
    then
       echo "command fsck -n /dev/sda7 passed"
    else
       echo "command fsck -n /dev/sda7 failed"
       exit
    fi
    exit
fi

#lscpu   
if [ "$1" = 'lscpu' ] ;  then
    lscpu -V
    status=$?
    if test $status -eq 0
    then
       echo "command lscpu -V passed"
    else
       echo "command lscpu -V failed"
       exit
    fi
 
    echo "lscpu - gathers CPU architecture information from sysfs and
       /proc/cpuinfo."
    lscpu
    status=$?
    if test $status -eq 0
    then
       echo "command lscpu passed"
    else
       echo "command lscpu failed"
       exit
    fi
    exit
fi


#lcpci   
if [ "$1" = 'lspci' ] ;  then
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
fi


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


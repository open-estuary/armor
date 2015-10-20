###############################################################################

# This script run all the test scripts for Armor tools.

#Usage:
# $ sh auto_test_armor_tools.sh 

################################################################################
#!/bin/bash
    
if [ "$1" = '-h' ]; then
    echo "This test script supports testing following Armor Tools"
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

echo "Testing suported Armor Tools..."

sh test_ltrace.sh
status=$?
if test $status -ne 0
then
   echo "running test_ltrace.sh failed"
fi

sh test_sar.sh
status=$?
if test $status -ne 0
then
   echo "running test_sar.sh failed"
fi

sh test_vmstat.sh
status=$?
if test $status -ne 0
then
   echo "running test_vmstat.sh failed"
fi

sh test_swapon.shi
status=$?
if test $status -ne 0
then
   echo "running test_swapon.sh failed"
fi

sh test_gdb.shi
status=$?
if test $status -ne 0
then
   echo "running test_gdb.sh failed"
fi

sh test_iptables.sh
status=$?
if test $status -ne 0
then
   echo "running test_iptables.sh failed"
fi

sh test_mkfs.sh
status=$?
if test $status -ne 0
then
   echo "running test_mkfs.sh failed"
fi

sh test_mount.sh
status=$?
if test $status -ne 0
then
   echo "running test_mount.sh failed"
fi

sh test_du.sh
status=$?
if test $status -ne 0
then
   echo "running test_du.sh failed"
fi

sh test_df.sh
status=$?
if test $status -ne 0
then
   echo "running test_df.sh failed"
fi

sh test_dmidecode.sh
status=$?
if test $status -ne 0
then
   echo "running test_dmidecode.sh failed"
fi

sh test_strace.sh
status=$?
if test $status -ne 0
then
   echo "running test_strace.sh failed"
fi

sh test_netstat.sh
status=$?
if test $status -ne 0
then
   echo "running test_netstat.sh failed"
fi

sh test_top.sh
status=$?
if test $status -ne 0
then
   echo "running test_top.sh failed"
fi

sh test_pidstat.sh
status=$?
if test $status -ne 0
then
   echo "running test_pidstat.sh failed"
fi

sh test_ftrace.sh
status=$?
if test $status -ne 0
then
   echo "running test_ftrace.sh failed"
fi

sh test_iostat.sh
status=$?
if test $status -ne 0
then
   echo "running test_iostat.sh failed"
fi

sh test_tcpdump.sh
status=$?
if test $status -ne 0
then
   echo "running test_tcpdump.sh failed"
fi

sh test_ethtool.sh
status=$?
if test $status -ne 0
then
   echo "running test_ethtool.sh failed"
fi

sh test_fsck.sh
status=$?
if test $status -ne 0
then
   echo "running test_fsck.sh failed"
fi

sh test_lscpu.sh
status=$?
if test $status -ne 0
then
   echo "running test_lscpu.sh failed"
fi

sh test_lspci.sh
status=$?
if test $status -ne 0
then
   echo "running test_lspci.sh failed"
fi

sh test_setpci.sh
status=$?
if test $status -ne 0
then
   echo "running test_setpci.sh failed"
fi

sh test_tail.sh
status=$?
if test $status -ne 0
then
   echo "running test_tail.sh failed"
fi

sh test_grep.sh
status=$?
if test $status -ne 0
then
   echo "running test_grep.sh failed"
fi

sh test_awk.sh
status=$?
if test $status -ne 0
then
   echo "running test_awk.sh failed"
fi

sh test_sed.sh
status=$?
if test $status -ne 0
then
   echo "running test_sed.sh failed"
fi

sh test_kdump.sh
status=$?
if test $status -ne 0
then
   echo "running test_kdump.sh failed"
fi

sh test_tiptop.sh
status=$?
if test $status -ne 0
then
   echo "running test_tiptop.sh failed"
fi

sh test_iotop.sh
status=$?
if test $status -ne 0
then
   echo "running test_iotop.sh failed"
fi

sh test_blktrace.sh
status=$?
if test $status -ne 0
then
   echo "running test_blktrace.sh failed"
fi

sh test_dstat.sh
status=$?
if test $status -ne 0
then
   echo "running test_dstat.sh failed"
fi

sh test_procps.sh
status=$?
if test $status -ne 0
then
   echo "running test_procps.sh failed"
fi

sh test_nicstat.sh
status=$?
if test $status -ne 0
then
   echo "running test_nicstat.sh failed"
fi

sh test_lldptool.sh
status=$?
if test $status -ne 0
then
   echo "running test_lldptool.sh failed"
fi

sh test_oprofile.sh
status=$?
if test $status -ne 0
then
   echo "running test_oprofile.sh failed"
fi

sh test_latencytop.sh
status=$?
if test $status -ne 0
then
   echo "running test_latencytop.sh failed"
fi

sh test_systemtap.sh
status=$?
if test $status -ne 0
then
   echo "running test_systemtap.sh failed"
fi

sh test_crash.sh
status=$?
if test $status -ne 0
then
   echo "running test_crash.sh failed"
fi

echo "Auto Testing of Armor Tools Done"


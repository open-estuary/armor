###############################################################################

# This script tests the perf tool

#Usage:
# $ sh test_perf.sh 

################################################################################
#!/bin/bash
    
#perf
Distribution=`sed -n 1p /etc/issue| cut -d' ' -f 1`
# Fix for OpenSuse distribution as the format of /etc/issue in OpenSuse is different.
Distribution1=`sed -n 1p /etc/issue| cut -d' ' -f 3`
if [ "$Distribution1" = 'openSUSE' ]; then
    Distribution=`sed -n 1p /etc/issue| cut -d' ' -f 3`
fi

case "$Distribution" in
    Ubuntu)
        PERF_BIN=/usr/lib/linux-tools-3.19.0-23/perf
    ;;
    Debian)
        PERF_BIN=/usr/lib/linux-tools-3.19.0-23/perf
    ;;
    Fedora)
        PERF_BIN=/usr/bin/perf
    ;;
    openSUSE)
        PERF_BIN=/usr/bin/perf
    ;;
    esac

${PERF_BIN} list | grep -i "hardware cache event"
status=$?
if test $status -eq 0
then
    echo "command perf list [PASS]"
else
    echo "command perf list [FAIL]"
    exit -1
fi

${PERF_BIN} stat -e r300 ls -l >/dev/null
status=$?
if test $status -eq 0
then
    echo "command perf stat for LLC event [PASS]"
else
    echo "command perf stat for LLC event [FAIL]"
    exit -1
fi

exit 0

###############################################################################

# This script tests the perf tool

#Usage:
# $ sh test_perf.sh 

################################################################################
#!/bin/bash
    
#perf
PERF_BIN=/usr/lib/linux-tools-3.19.0-23/perf

${PERF_BIN} list | grep -i "hardware cache event"
status=$?
if test $status -eq 0
then
    echo "command perf list passed"
else
    echo "command perf list failed"
    exit -1
fi

${PERF_BIN} stat -e r300 ls -l >/dev/null
status=$?
if test $status -eq 0
then
    echo "command perf stat for LLC event passed"
else
    echo "command perf stat for LLC event failed"
    exit -1
fi

exit 0

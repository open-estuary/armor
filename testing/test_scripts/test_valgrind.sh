###############################################################################

# This script tests the valgrind tool

#Example:
# $ sh test_valgrind.sh 

################################################################################
#!/bin/bash

bash check_install.sh valgrind
status=$?
if test $status -eq 1
then
        exit
fi
    
#valgrind
valgrind --version
status=$?
if test $status -eq 0
then
    echo "command valgrind --version [PASS]"
else
    echo "command valgrind --version [FAIL]"
    exit
fi

echo "valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./valgrind_test"
valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./valgrind_test
status=$?
if test $status -eq 0
then
    echo "command valgrind --tool=memcheck ... [PASS]"
else
    echo "command valgrind --tool=memcheck... [FAIL]"
exit
fi


###############################################################################

# This script tests the valgrind tool

#Example:
# $ sh test_valgrind.sh 

################################################################################
#!/bin/bash
    
#valgrind
valgrind --version
status=$?
if test $status -eq 0
then
    echo "command valgrind --version passed"
else
    echo "command valgrind --version failed"
    exit
fi

echo "valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./valgrind_test"
valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./valgrind_test
status=$?
if test $status -eq 0
then
    echo "command valgrind --tool=memcheck ... passed"
else
    echo "command valgrind --tool=memcheck... failed"
exit
fi


obj-m += valgrind_test.o
valgrind_test-objs := test_valgrind.o 

all:    clean valgrind_test

valgrind_test: clean
	$(CROSS_COMPILE)gcc -Wall -g test_valgrind.c -o valgrind_test

clean : 
	rm -f *.o 
	rm -f valgrind_test

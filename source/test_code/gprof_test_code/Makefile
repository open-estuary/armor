VERSION=

obj-m += gprof_test.o
gprof_test-objs := test_gprof.o test_gprof_new.o

all:    clean gprof_test

gprof_test: clean
	aarch64-linux-gnu-gcc -Wall -pg test_gprof.c test_gprof_new.c -o gprof_test

clean : 
	rm -f *.o \.*.o.cmd \.*.o.d *.out *.txt
	rm -f gprof_test

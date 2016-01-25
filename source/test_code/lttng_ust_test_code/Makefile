
all :
	gcc -c -I. ./lttng_test_tp.c
	gcc -c ./lttng_test.c
	gcc -o ./lttng_ust_test ./lttng_test.o ./lttng_test_tp.o -llttng-ust -ldl

clean :
	$(RM) *.o lttng_ust_test 



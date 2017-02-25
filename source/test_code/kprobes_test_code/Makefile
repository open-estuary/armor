VERSION=

obj-m += kprobe_test.o
kprobe_test-objs := kprobe_sample.o

all:    clean kprobe_test

kprobe_test: clean
	make -C $(KPROBES_KERN_DIR) SUBDIRS=`pwd` modules
	$(CROSS_COMPILE)gcc kprobe_test.c -o kprobe_test

install:
	insmod kprobe_test.ko

deinstall:
	rmmod kprobe_test.ko

clean : 
	rm -f *.o *.ko *.mod.c Module.symvers Module.markers modules.order \.*.o.cmd \.*.ko.cmd \.*.o.d
	rm -rf \.tmp_versions 
	rm -f kprobe_test

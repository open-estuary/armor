
if [ "$1" = '' ] || [ "$2" = '' ]; then
    echo "Invalid parameter passed. Usage sh lttng_modules_install.sh <kernel directory> <distribution directory> "
    exit
fi

kernel_version=$(sudo cat $1/include/config/kernel.release)
#echo "kernel_version=$kernel_version"

sudo mkdir $2/lib/modules/$kernel_version/armor
sudo cp $(pwd)/lib/*.ko $2/lib/modules/$kernel_version/armor
sudo cp $(pwd)/*.ko $2/lib/modules/$kernel_version/armor
sudo cp $(pwd)/probes/*.ko $2/lib/modules/$kernel_version/armor

# updating the /lib/modules/<kernel version>/modules.dep file with the list of lttng modules to be installed on bootup
modules_dep_file=$(echo "$2/lib/modules/$kernel_version/modules.dep")

#echo "modules_dep_file=$modules_dep_file" 

sudo sh -c "echo armor/lttng-probe-kvm.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-sock.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko  >> $modules_dep_file"

sudo sh -c "echo armor/lttng-ring-buffer-metadata-client.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko  >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-printk.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-napi.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-v4l2.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko  >> $modules_dep_file"

sudo sh -c "echo armor/lttng-statedump.ko: >> $modules_dep_file" 

sudo sh -c "echo armor/lttng-probe-btrfs.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko  >> $modules_dep_file"

sudo sh -c "echo armor/lttng-ring-buffer-client-mmap-discard.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko  >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-kmem.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-compaction.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko  >> $modules_dep_file"

sudo sh -c "echo armor/lttng-ring-buffer-client-overwrite.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko  >> $modules_dep_file"

sudo sh -c "echo armor/lttng-ring-buffer-client-mmap-overwrite.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-sunrpc.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-ftrace.ko: >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-signal.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-module.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-ring-buffer-client-discard.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko  >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-timer.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-net.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-writeback.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-gpio.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-udp.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko  >> $modules_dep_file"

sudo sh -c "echo armor/lttng-ring-buffer-metadata-mmap-client.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-lib-ring-buffer.ko: >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-jbd2.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-statedump.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-ext4.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-rcu.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-tracer.ko: armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-power.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko  >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-sched.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"
 
sudo sh -c "echo armor/lttng-probe-block.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-vmscan.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-scsi.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-regmap.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-skb.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-regulator.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-random.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-workqueue.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"

sudo sh -c "echo armor/lttng-probe-irq.ko: armor/lttng-tracer.ko armor/lttng-statedump.ko armor/lttng-ftrace.ko armor/lttng-lib-ring-buffer.ko >> $modules_dep_file"






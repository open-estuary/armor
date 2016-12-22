###############################################################################

# This script build lttng user space code and babeltrace on D02 OpenSuse. 
#Example:
# $ sh build_lttng_tools_opensuse.sh 

################################################################################
#!/bin/bash

echo "Warning!!! This script work only for native building on D02 OpenSuse"
echo "Building the lttng's user space components on OpenSuse..."
cd ../source/

#install dependency tools
echo "install dependency tools..."
zypper install -y automake
zypper install -y autoconf
zypper install -y bison
zypper install -y flex
zypper install -y libtool
zypper install -y popt-devel
zypper install -y libxml2-devel
zypper install -y libuuid-devel
zypper install -y liburcu-devel
zypper install -y asciidoc
zypper install -y xmlto

zypper install -y glib2-devel #(for babeltrace)
autoreconf -iv #(for babeltrace)

echo "Download and Building lttng-ust source code... "
git clone git://git.lttng.org/lttng-ust.git
cd lttng-ust
./bootstrap 
./configure
make
sudo make install
sudo ldconfig
cd -

echo "Download and Building lttng-tool source code... "
git clone git://git.lttng.org/lttng-tools.git
cd lttng-tools
./bootstrap 
./configure
make
sudo make install
sudo ldconfig
cd -

echo "Download and Building babeltrace source code... "
git clone http://git.linuxfoundation.org/diamon/babeltrace.git
cd babeltrace
./bootstrap 
./configure
make
sudo make install
sudo ldconfig
cd -

cd -

echo "install prebuilt kernel lttng-modules..."
depmod -a
modprobe lttng-probe-kvm
modprobe lttng-probe-sock
modprobe lttng-ring-buffer-metadata-client
modprobe lttng-probe-printk
modprobe lttng-probe-napi
modprobe lttng-probe-v4l2
modprobe lttng-statedump
modprobe lttng-probe-btrfs
modprobe lttng-ring-buffer-client-mmap-discard
modprobe lttng-probe-kmem
modprobe lttng-probe-compaction
modprobe lttng-ring-buffer-client-overwrite
modprobe lttng-ring-buffer-client-mmap-overwrite
modprobe lttng-probe-sunrpc
modprobe lttng-ftrace
modprobe lttng-probe-signal
modprobe lttng-probe-module
modprobe lttng-ring-buffer-client-discard
modprobe lttng-probe-timer
modprobe lttng-probe-net
modprobe lttng-probe-writeback
modprobe lttng-probe-gpio
modprobe lttng-probe-udp
modprobe lttng-kretprobes
modprobe lttng-ring-buffer-metadata-mmap-client
modprobe lttng-lib-ring-buffer
modprobe lttng-probe-jbd2
modprobe lttng-probe-statedump
modprobe lttng-probe-ext4
modprobe lttng-probe-rcu
modprobe lttng-tracer
modprobe lttng-probe-power
modprobe lttng-probe-sched
modprobe lttng-probe-block
modprobe lttng-probe-jbd
modprobe lttng-probe-vmscan
modprobe lttng-kprobes
modprobe lttng-probe-scsi
modprobe lttng-probe-regmap
modprobe lttng-probe-skb
modprobe lttng-probe-ext3
modprobe lttng-probe-regulator
modprobe lttng-probe-random
modprobe lttng-probe-workqueue
modprobe lttng-probe-irq

echo "Finished Building and installtion of lttng components"


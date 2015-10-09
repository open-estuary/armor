###############################################################################

# This script download and build tools from the source code. 
#Example:
# $ sh build_armor_tool_int02.sh <tool's name>

################################################################################
#!/bin/bash

if [ "$1" = '' ]; then
    echo "Usage: sh build_armor_tool_int02.sh <tool's name>"
    exit
fi

if [ "$1" = '-h' ]; then
    echo "Usage: sh build_armor_tool_int02.sh <tool's name>"
    echo "Supported Tools List:"
    echo "tiptop"
    echo "blktrace"
    echo "nicstat"
    echo "lldptool"
    echo "memwatch"
    echo "crash"
    exit
fi

echo "Building the Debug Tool $1..."

if [ "$1" = 'tiptop' ]; then

    echo "Warning! building tiptop worked only on ARM64 RFS"
    echo "installing dependency components"

    apt-get install flex
    apt-get install libfl-dev
    apt-get install bison
    apt-get install bison++
    
    apt-get install help2man
    apt-get install byacc
    
    echo "building dependency component textinfo"
    wget http://ftp.gnu.org/gnu/texinfo/texinfo-6.0.tar.gz
    tar -xvzf texinfo-6.0.tar.gz
    cd texinfo-6.0/
    ./configure  CC=aarch64-linux-gnu-gcc -prefix=/usr/local
    make 
    make install

    echo "building tiptop..."
    wget http://tiptop.gforge.inria.fr/releases/tiptop-2.3.tar.gz
    tar -xvzf tiptop-2.3.tar.gz
    cd tiptop-2.3/
    ./configure  CC=aarch64-linux-gnu-gcc -prefix=/usr/local
    make
    make install
    exit
fi

if [ "$1" = 'blktrace' ]; then
    echo "building blktrace..."
    git clone git://git.kernel.dk/blktrace.git
    git checkout 43fc870ce04e963def45dfc0d1ed4ea21ef10d4b
    cd blktrace
    ./configure  CC=aarch64-linux-gnu-gcc -prefix=/usr/local
    make
    make install
    exit
fi

if [ "$1" = 'nicstat' ]; then
    echo "Warning! building nicstat worked only on ARM64 RFS"
    echo "building nicstat..."
    git clone https://github.com/sysperf/nicstat.git
    cd nicstat
    ./configure  CC=aarch64-linux-gnu-gcc -prefix=/usr/local
    make
    make install
    exit
fi

if [ "$1" = 'memwatch' ]; then
    echo "building memwatch..."
    wget http://memwatch.sourceforge.net/memwatch-2.69.tar.gz
    tar -xvzf memwatch-2.69.tar.gz 
    cd memwatch-2.69
    make 
#    ./a.out
#    vi memwatch.log
    exit
fi

if [ "$1" = 'lldptool' ]; then
    echo "building lldpad work only on Ubuntu arm64 RFS only"
    echo "building lldpad..."
    apt-get install libtool
    apt-get install libconfig-dev
    apt-get install libnl-3-dev
    apt-get install readline-devel
    
    git clone git://open-lldp.org/open-lldp.git
    #Working build solution on Ubuntu ARM64 RFS
    cd open-lldp
    ./bootstrap.sh
    ./configure --build=aarch64-unknown-linux-gnu
    make
    exit
fi

if [ "$1" = 'crash' ]; then
    echo "building crash work only on arm64 RFS only"
    echo "building crash..."

    git clone  https://github.com/crash-utility/crash
    #Working build solution on ARM64 RFS
    cd crash 
    make
    exit
fi


echo "Building Debug Tool $1 is not supported."

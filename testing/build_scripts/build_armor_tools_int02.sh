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
    exit
fi

echo "Building the Debug Tool $1..."

if [ "$1" = 'tiptop' ]; then

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

echo "Building Debug Tool $1 is not supported."

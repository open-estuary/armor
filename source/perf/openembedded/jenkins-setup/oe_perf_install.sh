###############################################################################

#This script copy and extract perf and assosiated dependent component's tar binaries 
# to the local perf_binaries folder. 

################################################################################
#!/bin/bash
rm -rf perf_binaries
mkdir perf_binaries
cd perf_binaries

#perf
cp ../build/tmp-glibc/deploy/ipk/genericarmv8/perf_*_genericarmv8.ipk .
ar x perf_*_genericarmv8.ipk
mv data.tar.gz  perf_aarch64.tar.gz
rm control.tar.gz
rm debian-binary 
rm perf_*_genericarmv8.ipk 

#binutils
cp ../build/tmp-glibc/deploy/ipk/aarch64/binutils_linaro-*_aarch64.ipk .
ar x binutils_linaro*_aarch64.ipk
mv data.tar.gz  binutils_linaro_aarch64.tar.gz
rm control.tar.gz
rm debian-binary 
rm binutils_linaro-*_aarch64.ipk

#libbz2
cp ../build/tmp-glibc/deploy/ipk/aarch64/libbz2*_aarch64.ipk .
ar x libbz2*_aarch64.ipk
mv data.tar.gz  libbz2_aarch64.tar.gz
rm control.tar.gz
rm debian-binary
rm libbz2*_aarch64.ipk 

#libdw1
cp ../build/tmp-glibc/deploy/ipk/aarch64/libdw1*_aarch64.ipk .
ar x libdw1*_aarch64.ipk
mv data.tar.gz  libdw1_aarch64.tar.gz
rm control.tar.gz
rm debian-binary
rm libdw1*_aarch64.ipk 

#libperl5
cp ../build/tmp-glibc/deploy/ipk/aarch64/libperl5*_aarch64.ipk .
ar x libperl5*_aarch64.ipk
mv data.tar.gz  libperl5_aarch64.tar.gz
rm control.tar.gz
rm debian-binary
rm libperl5*_aarch64.ipk

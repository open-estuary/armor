#!/bin/bash

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation version 2.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>

unset sync

show_setup()
{
    echo ""
    echo "GCC version: $gcc"
    echo "Target architecture: $arch"
    echo "Manifest branch: $manifest_branch"
    echo "Manifest URL: $manifest_repository"
    echo "Manifest groups: $manifest_groups"
    echo "Init env: $init_env"
    echo "Verbose: $bitbake_verbose"
    echo "Local download directory: $LOCALDLDIR"
    echo "Enable ptest: $ptest_enabled"

    if [ $external_url ]; then
        echo "External toolchain URL: $external_url"
    fi
    echo ""
}

git_clone_update()
{

   if [ -n "${WORKSPACE}" ]; then
        # always run repo init again, even if the workspace already exists, in
        # case a parameter has changed
        echo "jenkins repo init"
        repo init  -u $manifest_repository -b $manifest_branch -m default.xml $manifest_groups --repo-url=git://android.git.linaro.org/tools/repo

        echo "jenkins repo sync"
        repo sync -j4
    # FIXME: check if the following code is really needed
    elif [[ -d .repo ]]; then
        echo "rebase"
        for project in $(cat .repo/project.list); do
            if [[ ! -d $project ]]; then
                sync=1
            fi
        done
        if [[ $sync = 1 ]]; then
            repo sync
        fi
       repo rebase
    else
        repo init --quiet -u $manifest_repository -b $manifest_branch -m default.xml  $manifest_groups --repo-url=git://android.git.linaro.org/tools/repo
        time repo sync --quiet -j3
    fi
}

conf_bblayers()
{
# add required layers

cat > conf/bblayers.conf <<EOF
# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION = "5"

BBPATH = "\${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /build/linaro/build/openembedded-core/meta \
  "

BBLAYERS_NON_REMOVABLE ?= " \
  /build/linaro/build/openembedded-core/meta \
  "

BBLAYERS  = '`realpath $PWD/../meta-openembedded/meta-oe`'
BBLAYERS += '`realpath $PWD/../meta-openembedded/meta-filesystems`'
BBLAYERS += '`realpath $PWD/../meta-openembedded/meta-initramfs`'
BBLAYERS += '`realpath $PWD/../meta-openembedded/meta-webserver`'
BBLAYERS += '`realpath $PWD/../meta-openembedded/meta-python`'
BBLAYERS += '`realpath $PWD/../meta-openembedded/meta-networking`'
BBLAYERS += '`realpath $PWD/../meta-openembedded/meta-gnome`'
BBLAYERS += '`realpath $PWD/../meta-linaro/meta-aarch64`'
BBLAYERS += '`realpath $PWD/../meta-linaro/meta-ilp32`'
BBLAYERS += '`realpath $PWD/../meta-linaro/meta-bigendian`'
BBLAYERS += '`realpath $PWD/../meta-linaro/meta-linaro`'
BBLAYERS += '`realpath $PWD/../meta-linaro/meta-linaro-toolchain`'
BBLAYERS += '`realpath $PWD/../meta-linaro/meta-linaro-integration`'
BBLAYERS += '`realpath $PWD/../meta-virtualization`'
BBLAYERS += '`realpath $PWD/../meta-browser`'
EOF

if [[ -d ../poky ]]; then
    echo "BBLAYERS += '`realpath $PWD/../poky/meta`'">>conf/bblayers.conf
    echo "BBLAYERS += '`realpath $PWD/../poky/meta-yocto`'">>conf/bblayers.conf
else
    echo "BBLAYERS += '`realpath $PWD/../openembedded-core/meta`'">>conf/bblayers.conf
fi
}

conf_siteconf()
{
# Add some Linaro related options

if [ "${arch}" = "x86" ] || [ "${arch}" = "x86-64" ]; then
    machinearch="qemu${arch}"
else
    machinearch="generic${arch}"
fi

cat > conf/site.conf <<EOF
SCONF_VERSION = "1"
# specify the alignment of the root file system
# this is required when building for qemuarmv7a
IMAGE_ROOTFS_ALIGNMENT = "2048"

# to save space we remove source after build
INHERIT += "rm_work"

# Enable buildhistory to make tracking package changes easier
# NOTE: BUILDHISTORY_COMMIT is disabled, so the overhead is kept minimal
INHERIT += "buildhistory"

MACHINE ?= "${machinearch}"

# Prefer hardfloat, the OE default is softfp for cortex-A class devices
DEFAULTTUNE_genericarmv7a ?= "armv7athf"
DEFAULTTUNE_genericarmv7ab ?= "armv7athfb"

# those numbers can be tweaked if build takes too much power
# BB_NUMBER_THREADS = "${numproc}"
# PARALLEL_MAKE = "-j${numproc}"

# add 'ext2' if you want images for fast models
IMAGE_FSTYPES = "tar.gz"
IMAGE_LINGUAS = "en-gb"

GCCVERSION       ?= "linaro-${gcc}"
SDKGCCVERSION    ?= "linaro-${gcc}"
BINUVERSION      ?= "linaro-2.%"
#GLIBCVERSION     = "linaro-2.20"
LINUXLIBCVERSION = "3.18"

PREFERRED_VERSION_gcc-source ?= "${GCCVERSION}"

# some options needed for Linaro images
PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"

# Don't build kernels on the CI
# NOTE: this breaks recipes that build external kernel modules
#PREFERRED_PROVIDER_virtual/kernel = "${linux_kernel:-linux-dummy}"
PREFERRED_PROVIDER_virtual/kernel = "linux-linaro-aarch64"
PREFERRED_PROVIDER_virtual/kernel_qemux86 = "linux-yocto"
PREFERRED_PROVIDER_virtual/kernel_qemux86-64 = "linux-yocto"
#PREFERRED_VERSION_lng-x86-64 = "${linux_kernel_version:-3.14}"
#PREFERRED_VERSION_lng-rt-x86-64 = "${linux_kernel_version:-3.14}"
PREFERRED_VERSION_lng-x86-64 = "${linux_kernel_version:-4.4}"
PREFERRED_VERSION_lng-rt-x86-64 = "${linux_kernel_version:-4.4}"

# some options needed for HipHopVM
PREFERRED_PROVIDER_libevent = "libevent-fb"
PREFERRED_VERSION_libmemcached = "1.0.7"

TCLIBC = "glibc"

# Need this for the netperf package.
LICENSE_FLAGS_WHITELIST = "non-commercial"

# fix openvswitch to avoid problems with latest recipe
PREFERRED_VERSION_openvswitch = "2.1.3"

# Work around old u-boots needing 'arm' instead of 'arm64'
UBOOT_ARCH_aarch64 = "arm"

EOF

if [[ -d ../poky ]]; then
    cat >> conf/site.conf <<EOF
# ipk a debian style embedded package manager.
PACKAGE_CLASSES = "package_ipk"
EOF
fi

# enable a distro feature that is compatible with the minimal goal we have
echo 'DISTRO_FEATURES = "pam x11 alsa argp ext2 largefile usbgadget usbhost xattr nfs zeroconf opengl ${DISTRO_FEATURES_LIBC} systemd"' >>conf/site.conf

# allow the user to specify a local, pre-existing download directory
if [ -n "$LOCALDLDIR" ]; then
    cat >> conf/site.conf <<EOF

# use a pre-existing download directory
DL_DIR = "$LOCALDLDIR"
EOF
fi
}

conf_toolchain()
{
    if [ $external_url ];then
        set -xe

        echo 'TCMODE = "external-linaro"' >>conf/site.conf
        echo 'PNBLACKLIST[glibc] = "Using external toolchain"' >>conf/site.conf
        echo 'PNBLACKLIST[libgcc] = "Using external toolchain"' >>conf/site.conf
        echo 'PNBLACKLIST[gcc-cross] = "Using external toolchain"' >>conf/site.conf

        tarball_name=`basename $external_url`

        if [ -z $tarball_name ] ; then
            tarball_name=`basename $external_url`
        fi

        if [ -z $tarball_name ] ; then
            tarball_name=`basename $external_url`
        fi

        mkdir -p toolchain

        if [ -n "${WORKSPACE}" ]; then
            mkdir -p ${WORKBASE}/downloads/
            local_tarball_name=${WORKBASE}/downloads/$tarball_name
        else
            local_tarball_name=toolchain/$tarball_name
        fi

        if [ ! -e $local_tarball_name ];then
            wget -cv $external_url -O $local_tarball_name
        fi
        md5sum $local_tarball_name
        tar xf $local_tarball_name -C toolchain

        echo "EXTERNAL_TOOLCHAIN = \"`pwd`/toolchain/`echo $tarball_name|sed -e 's/\(.*\)\.tar..*/\1/g'`\"" >> conf/site.conf

        case $arch in
            armv7a)
                echo 'ELT_TARGET_SYS = "arm-linux-gnueabihf"' >>conf/site.conf
                ;;
            armv8)
                echo 'ELT_TARGET_SYS = "aarch64-linux-gnu"' >>conf/site.conf
                ;;
        esac
        set +xe

    fi
}

conf_jenkins()
{
    if [ -n "${WORKSPACE}" ]; then
        # As noted during jdk8 integration, toolchain has subtle ties to the build location. Thus in
        # jenkins use same tmpdir for all builds. 
        # XXX: make this tmpfs, 10G of ram should be enough
        echo "TMPDIR = \"${base_dir}/workspace/tmp\"" >>conf/site.conf
        echo 'TCLIBCAPPEND = ""' >>conf/site.conf
    fi
}

conf_localconf()
{
    # get rid of MACHINE setting from local.conf
    # also disable SDL support in qemu-native

    sed -i -e "s/^MACHINE.*//g" \
           -e "/PACKAGECONFIG_pn-qemu-native/d" \
           conf/local.conf

    if [ "$ptest_enabled" = "1" ]; then
        echo 'DISTRO_FEATURES += "ptest"' >> conf/local.conf
    fi
}

cleanup_soft()
{
    sstate_dir=`bitbake -e | grep "^SSTATE_DIR="| cut -d'=' -f2 | tr -d '"'`

    if [ -e "$sstate_dir" ]; then
        echo "soft cleanup at $sstate_dir"
        df -h ${WORKBASE}
        extra_layers=`bitbake-layers show-layers | awk 'NR>2 {print $2}' | tr "\\n" ","`
        echo $extra_layers
        ../openembedded-core/scripts/sstate-cache-management.sh --yes --remove-duplicated \
                -d -v \
                --extra-layer=$extra_layers \
                --cache-dir=$sstate_dir
        df -h ${WORKBASE}
        ../openembedded-core/scripts/cleanup-workdir
        df -h ${WORKBASE}
    else
        echo "no sstate-cache to clean up"
    fi
}

cleanup_hard()
{
    if [ -n "${WORKBASE}" ]; then
        echo "hard cleanup at ${WORKBASE}"
        df -h ${WORKBASE}
        sstate_dir=`bitbake -e | grep "^SSTATE_DIR="| cut -d'=' -f2 | tr -d '"'`
        if [ -n "$sstate_dir" ]; then
            rm -rf $sstate_dir
        fi
        #rm -rf ${WORKBASE}/downloads
        df -h ${WORKBASE}
    fi
}

cleanup_auto()
{
    diskspace=`df -h ${WORKBASE}|tail -n1`
    echo $diskpace
    used=`echo $diskspace | awk '{ print $5}' | cut -d'%' -f1  `
    if [ $used -ge 90 ]; then
        echo "more then 90% of disk used, hard cleanup"
        cleanup_hard
    elif [ $used -ge 50 ]; then
        echo "more then 50% of disk used, soft cleanup"
        cleanup_soft
    else
        echo "plenty of space, no cleanup"
    fi
}

init_env()
{
    if [[ -d openembedded-core ]]; then
        cd openembedded-core
    else
        cd poky
    fi
    # set up OE enviroment variables
    . ./oe-init-build-env ../build

    conf_bblayers
    conf_siteconf
    conf_localconf
    conf_toolchain
    conf_jenkins
}

# Enable some Linaro CI site specific options 
init_env_linaro_ci()
{
    SSTATE_DIR="${base_dir}/workspace/sstate-cache"

    if [ -n "$sstatedir" ]; then
        SSTATE_DIR="${SSTATE_DIR}/$sstatedir"
    fi

    cat >> conf/site.conf <<EOF
SCONF_VERSION = "1"

# share downloads and sstate-cache between all builds
DL_DIR = "${base_dir}/workspace/downloads"
SSTATE_DIR = "${SSTATE_DIR}"
BB_GENERATE_MIRROR_TARBALLS = "True"

IMAGE_NAME = "\${IMAGE_BASENAME}-\${MACHINE}-\${DATE}-${BUILD_NUMBER}"

# enable source mirror
SOURCE_MIRROR_URL = "http://snapshots.linaro.org/openembedded/sources/"
INHERIT += "own-mirrors"

EOF
}

usage()
{
    cat << EOF
usage: $0 options

This script initialize and run OpenEmbedded builds with Linaro settings.

OPTIONS:
   -h      Show this message
   -a      Target architecture (armv7a or armv8)
   -b      Manifest branch
   -m      Manifest groups
   -r      Manifest repository
   -g      GCC version (e.g. x.y)
   -u      External Linaro toolchain URL
   -i      Custom workspace init function
   -v      Add -v[erbose] to bitbake invocation
EOF
}

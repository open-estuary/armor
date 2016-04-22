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

# set some defaults
release=13.06
arch=armv8
gcc=5.2
numproc=`getconf _NPROCESSORS_ONLN`
external_url=
manifest_branch=${manifest_branch:-master}
manifest_repository=${manifest_repository:-git://git.linaro.org/openembedded/manifest.git}
manifest_groups=
bitbake_verbose=
sstatedir=
binarytoolchain="aarch64-linux-gnu"
base_dir="/mnt/ci_build"
ptest_enabled=0

export PATH=$PATH:$HOME/bin

source $(dirname $0)/functions.sh

while getopts “ha:b:m:r:g:u:i:s:vp” OPTION
do
	case $OPTION in
		h)
			usage
			exit
			;;
		a)
			arch=$OPTARG
			;;
		b)
			manifest_branch=$OPTARG
			;;
		m)
			manifest_groups="-g $OPTARG"
			;;
		r)
			manifest_repository=$OPTARG
			;;
		g)
			gcc=$OPTARG
			;;
		u)
			external_url=$OPTARG
			;;
		i)
			init_env="$OPTARG"
			;;
		s)
			sstatedir="$OPTARG"
			;;
		v)
			bitbake_verbose="-v"
			;;
		p)
			ptest_enabled=1
			;;
	esac
done

shift $(( OPTIND-1 ))

if [ -n "${WORKSPACE}" ]; then
    WORKBASE=${base_dir}/workspace
fi

show_setup

git_clone_update

# the purpose of the 'init' function is to prepare the <build> folder
# the default init function suitable for Linaro Platform builds, but
# the user can specify a custom function if needed. In any case, the
# init function must ensure :
#  - oe-init-build-env is called
#  - path is changed to <build> folder
#  - user configuration files (local.conf, bblayers.conf, ..) are
#    created.
# Once the build init is done, we are adding some Linaro CI specific
# build options, when running on Jenkins.
if [ -z "$init_env" ]; then
    init_env
else
    eval $init_env
fi

# when running on Linaro CI, only.
if [ -n "${WORKSPACE}" ]; then
    init_env_linaro_ci
    cleanup_auto
fi

#bitbake gcc-cross || true
bitbake $bitbake_verbose $@
# propagate bad return codes to caller
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi

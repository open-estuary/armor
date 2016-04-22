#!/bin/bash -e

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

# periodic maintainence for OE builders

job=soft
base_dir="/mnt/ci_build"

source functions.sh
WORKBASE=${base_dir}/workspace

while getopts “w:x:” OPTION
do
	case $OPTION in
		x)
			job=$OPTARG
			;;
        w)
            WORKBASE=$OPTARG
	esac
done

shift $(( OPTIND-1 ))

cd openembedded-core
. oe-init-build-env ../build

case $job in
    auto)
        cleanup_auto
        ;;
    soft)
        cleanup_soft
        ;;
    hard)
        cleanup_hard
        ;;
esac

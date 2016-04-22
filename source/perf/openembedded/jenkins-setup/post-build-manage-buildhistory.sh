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

set -e

# only run on Jenkins
if [ -z "${WORKSPACE}" ]; then
    exit 1
fi

usage()
{
    cat << EOF
usage: $0 options

This script should be run at the end of a Linaro OpenEmbedded build,
to archive a copy of the buildhistory artifacts

OPTIONS:
   -h      Show this message
   -r      Repository where artifacts will be pushed
   -b      Git Branch to use
   -v      Verbose output
EOF
}

base_dir="/mnt/ci_build"

while getopts “hb:r:v” OPTION
do
	case $OPTION in
		h)
			usage
			exit
			;;
		r)
			tree=$OPTARG
			;;
		b)
			branch=$OPTARG
			;;
		v)
			set -x
			;;
	esac
done

if [ -z "$tree" ] ; then
    tree="ssh://git@git.linaro.org/openembedded/buildhistory.git"
    echo "No tree specified, defaulting to $tree"
fi

if  [ -z "$branch" ] ; then
    usage
    exit 1
fi

buildhistory_dir=`find build -maxdepth 2 -type d -name buildhistory`
if [ ! -d $buildhistory_dir ]; then
	buildhistory_dir=`find ${base_dir}/workspace/tmp -type d -name buildhistory`
fi

if [ ! -z "$buildhistory_dir" ] && [ -d $buildhistory_dir ]; then
    rm -rf _buildhistory
    git clone $tree _buildhistory
    ( cd _buildhistory ; git checkout origin/$branch -b $branch || git checkout -b $branch ; cd .. )
    cp -a $buildhistory_dir/[A-z]* _buildhistory/
    cd _buildhistory
    git add -A
    git commit --allow-empty -m "Build : ${BUILD_NUMBER}"
    git push origin HEAD:$branch

    # Output the most important changes to stdout
    ${WORKSPACE}/openembedded-core/scripts/buildhistory-diff --buildhistory-dir=$PWD HEAD~1 HEAD || true
else
    echo "Build history not found"
fi


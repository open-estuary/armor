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

usage()
{
    cat << EOF
usage: $0 options

This script should be run at the end of a Linaro OpenEmbedded build,
to prepare the 'output' folder

OPTIONS:
   -h      Show this message
   -p      String with packages, type -p all_packages to copy all
   -v      Verbose output
EOF
}


while getopts “hp:v” OPTION
do
	case $OPTION in
		h)
			usage
			exit
			;;
		p)
			package_list=${OPTARG}
			;;
		v)
			set -x
			;;
	esac
done

if [ -n "${WORKSPACE}" ]; then
	test -d ${WORKSPACE}/out || mkdir -p ${WORKSPACE}/out
	rm -rf ${WORKSPACE}/out/*
	oe_init_build_env=`find . -maxdepth 2 -type f -name oe-init-build-env`
	source ${oe_init_build_env} build
	deploy_dir=`bitbake -e | grep "^DEPLOY_DIR="| cut -d'=' -f2 | tr -d '"'`
	deploy_dir_image=`bitbake -e | grep "^DEPLOY_DIR_IMAGE="| cut -d'=' -f2 | tr -d '"'`
	license_directory=`bitbake -e | grep "^LICENSE_DIRECTORY="| cut -d'=' -f2 | tr -d '"'`
	license_manifests=`find ${license_directory} -type f -name 'license.manifest'`
	for manifest in ${license_manifests}
	do
		image_name=`dirname ${manifest}`
		image_name=`basename ${image_name}`
		cp -a ${manifest} ${WORKSPACE}/out/${image_name}.manifest
		mv ${deploy_dir_image}/${image_name}.* ${WORKSPACE}/out
	done

	# export modules archives and kernel image, if any
	for f in `find ${deploy_dir_image} -name modules-\* -o -name uImage-\* -o -name zImage-\* -o -name bzImage-\*`
	do
		if ! [ -h $f ] ; then
			cp -a $f ${WORKSPACE}/out
		fi
	done

	# copy packages that have been build
	if [ "${package_list}" != "" ]; then
		packaging="deb ipk rpm tar"
		for pkg in $(echo ${packaging})
		do
			if [ -d ${deploy_dir}/${pkg} ]; then
				if [ "${package_list}" = "all_packages" ]; then
					cp -r ${deploy_dir}/${pkg} ${WORKSPACE}/out
				else
					mkdir -p ${WORKSPACE}/out/${pkg}
					for package in ${package_list}
					do
						tmp_dir=$(basename $(dirname $(ls $(find ${deploy_dir}/${pkg} -type f -name "*${package}*")|head -1)))
						mkdir -p ${WORKSPACE}/out/${pkg}/${tmp_dir}
						find ${deploy_dir}/${pkg} -type f -name "*${package}*" -exec cp {} ${WORKSPACE}/out/${pkg}/${tmp_dir} \;
					done
				fi
			fi
		done
	fi

	# Add md5sums for all build artefacts
	for f in $(find ${WORKSPACE}/out) ; do
		if [ -f "$f" ] ; then
			md5sum $f > ${f}.md5
		fi
	done
fi

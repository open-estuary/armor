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

base_dir="${base_dir:-/mnt/ci_build}"

rm -rf ${WORKSPACE}/downloads
mkdir -p ${WORKSPACE}/downloads

pushd ${WORKSPACE}/downloads
cp ${base_dir}/workspace/downloads/* .
rm *.done

# remove all sources which were already pushed
wget http://snapshots.linaro.org/openembedded/sources

for src in ` grep 'a href="/openem' sources |sed -e 's+.*sources\/\(.*\)"+\1+g' `
do
	rm -f $src
done

popd

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

base_dir="/mnt/ci_build"

if [ -n "${WORKSPACE}" ]; then
    # clean builds from all jobs to get disk space back
    find ${WORKSPACE} -type d -name build | xargs rm -rf

    # clean shared tmpdir
    rm -rf ${base_dir}/workspace/tmp || true

    # those should not exist but they may
    find ${WORKSPACE} -type d -name downloads | xargs rm -rf

    # || true as some of those dirs may not exist
    du -hs ${WORKSPACE} \
       ${base_dir}/workspace/downloads \
       ${base_dir}/workspace/sstate-cache || true
    df -h
fi

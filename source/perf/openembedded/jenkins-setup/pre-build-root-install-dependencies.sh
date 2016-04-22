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

DISTRIBUTION=`grep '^ID=' /etc/os-release | sed 's/ID=//'`
if [ "$DISTRIBUTION" = "ubuntu" ]; then
  apt-get update
  # Package list based on Yocto Project Reference Manual
  # http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html
  # Essentials
  apt-get install -y --force-yes gawk wget git-core diffstat unzip texinfo \
    build-essential chrpath
  # Graphical Extras
  #apt-get install -y --force-yes libsdl1.2-dev xterm
  # Documentation
  #apt-get install -y --force-yes make xsltproc docbook-utils fop
  # ADT Installer Extras
  #apt-get install -y --force-yes autoconf automake libtool libglib2.0-dev
  # Linaro Extras
  apt-get install -y --force-yes automake bzip2 bzr cvs desktop-file-utils \
    libtool patch python realpath subversion texi2html openjdk-7-jdk
elif [ "$DISTRIBUTION" = "fedora" ]; then
  # Essentials
  yum install gawk make wget tar bzip2 gzip python unzip perl patch \
    diffutils diffstat git cpp gcc gcc-c++ eglibc-devel texinfo chrpath \
    ccache java-1.7.0-openjdk
  # Graphical Extras
  #yum install SDL-devel xterm
  # Documentation
  #yum install make docbook-style-dsssl docbook-style-xsl \
  #  docbook-dtds docbook-utils fop libxslt
  # ADT Installer Extras
  #yum install autoconf automake libtool glib2-devel
fi

# Get latest repo script and install it in PATH
test -d $HOME/bin || mkdir -p $HOME/bin
wget -q --no-check-certificate "http://android.git.linaro.org/gitweb?p=tools/repo.git;a=blob_plain;f=repo;hb=refs/heads/stable" -O $HOME/bin/repo
chmod a+x $HOME/bin/repo

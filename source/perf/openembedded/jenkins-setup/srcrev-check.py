#!/usr/bin/env python

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation.
#
# Copyright (C) 2014 Linaro
#
# - list available pkgs which have SRCREV and if the SCM has a newer version
#
# chunks copypasted from scripts/contrib/list-packageconfig-flags.py:
#  Copyright (C) 2013 Wind River Systems, Inc.

import sys
import getopt
import os
import re
import tempfile
import fnmatch

def search_bitbakepath():
    bitbakepath = ""

    # Search path to bitbake lib dir in order to load bb modules
    if os.path.exists(os.path.join(os.path.dirname(sys.argv[0]), '../../bitbake/lib/bb')):
        bitbakepath = os.path.join(os.path.dirname(sys.argv[0]), '../../bitbake/lib')
        bitbakepath = os.path.abspath(bitbakepath)
    else:
        # Look for bitbake/bin dir in PATH
        for pth in os.environ['PATH'].split(':'):
            if os.path.exists(os.path.join(pth, '../lib/bb')):
                bitbakepath = os.path.abspath(os.path.join(pth, '../lib'))
                break
        if not bitbakepath:
            sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
            sys.exit(1)
    return bitbakepath

# For importing the following modules
sys.path.insert(0, search_bitbakepath())
import bb
import bb.parse

giturl = re.compile(".*(git://[^\s^\"]*)")
badline = re.compile(".*(FORMAT|\${AUTOREV})")
srcrev = re.compile("SRCREV.*\"([^\"]*)\"")

def parserecipe(root, name):
    result = { }
    result["name"] = name
    recipefile=os.path.join(root, name)
    result["path"] = recipefile
    with open(recipefile) as f:
        for line in f.readlines():
            res = giturl.match(line)
            if res != None:
                result["giturl"] = res.group(1)
            res = badline.match(line)
            if res != None:
                 continue
            res = srcrev.match(line)
            if res != None:
                result["srcrev"] = res.group(1)

    return result


def find_recipes(paths):
    recipes = []
    extensions = ["*.bb" ,"*.bbappend", "*.inc" ]
    for path in paths:
        for root, dir, files in os.walk(path):
            for ext in extensions:
                for name in fnmatch.filter(files, ext):
                    result = parserecipe( root, name)
                    if "giturl" in result and "srcrev" in result:
                        recipes.append(result)

    return recipes

def update_recipe(path, old_version, new_version ):
    # I guess there is a python way too, but no time to find out
    os.system(str.format( "sed -i -e 's/{0}/{1}/g' {2}",
        old_version, new_version, path ))

def find_newer(data, recipe, update):
    url = recipe["giturl"]
    old_version=recipe["srcrev"]
    fetcher = bb.fetch.Fetch([url], data)
    # since we only gave one url, the loop will go only once
    for u in fetcher.ud:
        ud=fetcher.ud[u]
        gitobj=ud.method
        gitobj.urldata_init(ud,data)
        new_version=ud.revisions[ud.names[0]]
        print recipe["name"]
        print "  "+url
        if new_version != old_version:
            print str.format( "  old version: {0} new version {1}",
                    old_version, new_version)
            if update:
                update_recipe( recipe["path"], old_version, new_version )
        else:
            print "  up to date"

def usage():
    print ''
    print 'Update outdated SRCREVS in recipes'
    print ''
    print 'Usage: %s -d PATH [-d PATH]* -u' % os.path.basename(sys.argv[0])
    print '  -d directory        directories to search'
    print '  -h, --help          display this help and exit'
    print '  -u                  update recipe files'

def main():
    paths = []
    update=False

    # Collect and validate input
    try:
        opts, args = getopt.getopt(sys.argv[1:], "d:hu", ["help"])
    except getopt.GetoptError, err:
        print '%s' % str(err)
        usage()
        sys.exit(2)

    for o, a in opts:
        if o in ('-h', '--help'):
            usage()
            sys.exit(0)
        elif o == '-d':
            if os.path.isdir(a):
                paths.append(a)
        elif o in ('-u'):
            update = True
        else:
            assert False, "unhandled option"

    if not paths:
        print "no search directory given"
        usage()
        sys.exit(2)


    d=bb.data.init()
    recipes=find_recipes(paths)
    # cargo cult setup... these seem to be  needed for the fetcher module
    # even if we fetch nothing
    tempdir = tempfile.mkdtemp()
    dldir = os.path.join(tempdir, "download")
    os.mkdir(dldir)
    d.setVar("DL_DIR", dldir )
    unpackdir = os.path.join(tempdir, "unpacked")
    os.mkdir(unpackdir)
    persistdir = os.path.join(tempdir, "persistdata")
    d.setVar("PERSISTENT_DIR", persistdir)

    d.setVar("SRCREV","AUTOINC")
    for recipe in recipes:
        find_newer(d, recipe, update)


    bb.utils.prunedir(tempdir)


if __name__ == "__main__":
    main()


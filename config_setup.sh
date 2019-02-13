#!/bin/bash
# Guarantees configurations are stored in the repo-kept config directory
#
# Replaces a config file with a symlink to a repo controlled config
#  1: The file or dir to replace
#  2: The file or dir to link from the current folder

readonly SOURCE_DIR=$(dirname ${BASH[0]})

function replace_with_symlink()
{
    #does the target actually exist?
    if [ -z "$(readlink -e $2)" ] ; then
        return 0
    fi

    # does the directory of what we want to replace exist?
    if [ ! -e $1 ] ; then
        mkdir -p $(dirname $1)
    fi
    # Does the link already match what we want it to?
    if [ "$(readlink -m $2)" != "$(readlink -m $1)" ] ; then
        #make sure we're not replacing a file with a symlink to a dir, or visa versa
        if [ ! -e $1 ] || [ "$(file $1 | awk -F: '{print $2}')" == "$(file $2 | awk -F: '{print $2}')" ] ; then
            rm -rf $1
            ln -sr $(readlink -m $2) $(readlink -m $1)
        fi
    fi
}

replace_with_symlink ~/.Xresources Xresources
replace_with_symlink ~/.i3status.conf i3status.conf
replace_with_symlink ~/.i3 i3

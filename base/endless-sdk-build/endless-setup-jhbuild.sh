#!/bin/sh

mkdir -p /home/jhbuildci/.config

cat <<HERE > /home/jhbuildci/.config/jhbuildrc
use_local_modulesets = True

modulesets_dir = '/usr/share/jhbuild/modulesets'
moduleset = 'eos-knowledge-lib'

checkoutroot = '/home/jhbuildci/source'
buildroot = '/home/jhbuildci/build'
tarballdir = '/home/jhbuildci/download'
prefix = '/home/jhbuildci/install'

autogenargs = '--disable-gtk-doc'

os.environ['SHELL'] = '/bin/sh'

addpath('XDG_DATA_DIRS', '/usr/share')
addpath('XDG_CONFIG_DIRS', '/etc/xdg')
HERE

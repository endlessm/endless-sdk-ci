#!/bin/sh

cat <<HERE > /etc/jhbuildrc
use_local_modulesets = True

modulesets_dir = '/usr/share/jhbuild/modulesets'
moduleset = 'eos-knowledge-lib'

checkoutroot = '/root/source'
buildroot = '/root/build'
tarballdir = '/root/download'
prefix = '/opt/install'

autogenargs = '--disable-gtk-doc'

os.environ['SHELL'] = '/bin/sh'

addpath('XDG_DATA_DIRS', '/usr/share')
addpath('XDG_CONFIG_DIRS', '/etc/xdg')
HERE

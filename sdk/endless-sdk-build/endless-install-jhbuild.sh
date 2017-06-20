#!/bin/sh

git clone https://git.gnome.org/browse/jhbuild /tmp/jhbuild

cd /tmp/jhbuild
patch -p1 < /tmp/patches/jhbuild-no-root.patch
./autogen.sh --prefix /usr
make install
cd ..

mkdir -p /usr/share/jhbuild/modulesets && cp -f /tmp/eos-knowledge-lib.modules /usr/share/jhbuild/modulesets
mkdir -p /usr/share/jhbuild/modulesets/patches && cp -f /tmp/patches/* /usr/share/jhbuild/modulesets/patches

mkdir -p /usr/bin && cp -f /tmp/endless-build-module.sh /usr/bin/endless-build-module
chmod +x /usr/bin/endless-build-module

rm -rf /tmp/jhbuild

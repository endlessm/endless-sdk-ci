#!/bin/bash

set -e

SHELL=/bin/bash

MODULES=
JHBUILD_ARGS=
JHBUILD_OPTS="--no-interact --exit-on-error"

while (($# > 0)); do
  case "$1" in
  --check)
    RUN_CHECK=1
    ;;
  --no-network)
    JHBUILD_ARGS="$JHBUILD_ARGS --no-network"
    ;;
  --with-xvfb)
    START_XVFB=1
    ;;
  *)
    MODULES="$MODULES $1"
    ;;
  esac
  shift
done

if [ -n "$START_XVFB" ]; then
        XVFB_WHD=${XVFB_WHD:-1280x720x16}
        Xvfb :99 -ac -screen 0 $XVFB_WHD -nolisten tcp &
        xvfb_pid=$!

        export DISPLAY=:99
fi

jhbuild -f /etc/jhbuildrc $JHBUILD_OPTS build $JHBUILD_ARGS $MODULES

# We cannot build only the target module with checks enabled; running jhbuild
# with the --check argument will run the test suite of every dependency, and
# that's definitely not what we want
#
# Instead, we force a rebuild of the module with --check and --no-network
if [ -n "$RUN_CHECK" ]; then
        jhbuild -f /etc/jhbuildrc $JHBUILD_OPTS buildone \
                --force --no-network --check \
                $MODULES
fi

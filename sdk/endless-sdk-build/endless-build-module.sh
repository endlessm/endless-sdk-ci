#!/bin/bash

set -e

SHELL=/bin/bash

MODULES=
JHBUILD_ARGS=
JHBUILD_OPTS="--no-interact --exit-on-error"

while (($# > 0)); do
  case "$1" in
  --check)
    JHBUILD_ARGS="$JHBUILD_ARGS --check"
    ;;
  --no-network)
    JHBUILD_ARGS="$JHBUILD_ARGS --no-network"
    ;;
  *)
    MODULES="$MODULES $1"
    ;;
  esac
  shift
done

jhbuild $JHBUILD_OPTS build $JHBUILD_ARGS $MODULES

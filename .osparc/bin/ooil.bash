#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/

set -o errexit
set -o nounset
set -o pipefail
IFS=$'\n\t'

IMAGE_NAME="itisfoundation/service-integration:${OOIL_IMAGE_TAG:-master-github-latest}"
WORKDIR="$(pwd)"

#
# NOTE: with --interactive --tty the command below will
#    produce colors in the outputs. The problem is that
# .   ooil.bash >VERSION will insert special color codes
# .   in the VERSION file which make it unusable as a variable
# .   when cat VERSION !!
#

run() {
  docker run \
    --rm \
    --pull=always\
    -u $(shell id -u):$(shell id -g) \
    --volume "$WORKDIR":/src \
    --workdir=/src \
    "$IMAGE_NAME" \
    "$@"
}

# ----------------------------------------------------------------------
# MAIN
#
# USAGE
#    ./scripts/ooil.bash --help

run "$@"
# ----------------------------------------------------------------------

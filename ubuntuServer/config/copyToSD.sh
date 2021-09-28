#!/bin/bash
set -euo pipefail

SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
pushd "$SCRIP_DIR"

source ../env

./mountSD.sh
cp -r "$StagingPath"/* "$MountPath"
./umountSD.sh

set +euo pipefail

popd
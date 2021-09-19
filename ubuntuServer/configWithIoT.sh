#!/bin/bash
set -euo pipefail


SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
pushd "$SCRIP_DIR"

"$SCRIP_DIR"/config/configPi.sh
"$SCRIP_DIR"/iotEdge/addIotEdge.sh

sudo "$SCRIP_DIR"/config/copyToSD.sh
sudo "$SCRIP_DIR"/config/umountSD.sh

popd
set +euox pipefail


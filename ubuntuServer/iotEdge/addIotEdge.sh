#!/bin/bash
set -euxo pipefail


SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
pushd "$SCRIP_DIR"

source ../env
source ../util.sh

cp config.yaml $StagingPath/config.yaml

appendYaml iot-data.yaml user-data

popd
set +euox pipefail

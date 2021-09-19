#!/bin/bash
set -euxo pipefail


SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
pushd "$SCRIP_DIR"

source ../env
source ../util.sh

if [ ! -f "$StagingPath"/user-data ]
then
    echo "Run ./config/configPi.sh first to create user-data"
    exit
fi

#For now only symmetric key options
source ./_configDpsSymmetric.sh

eval "cat <<EOF
$(cat "$CONFIG_TEMPLATE")
EOF" > "$StagingPath"/config.toml


appendYaml "$StagingPath"/user-data ./iotedge-user-data.yaml

popd
set +euox pipefail

#!/bin/bash
set -euo pipefail


SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
pushd "$SCRIP_DIR"

source ../env
source ../util.sh

getValue HOST_NAME 'Device Host Name: '
getValue WIFI_SSID 'WiFi SSID: '
getSecretValue WIFI_PASSWORD 'WiFi Password: '

ensureDirectory "$StagingPath"
rm -f "$StagingPath"/user-data

eval "cat <<EOF
$(cat user-data-template.yaml)
EOF" > "$StagingPath"/user-data

rm -f "$StagingPath"/waitForNetwork.sh
cp ./waitForNetwork.sh "$StagingPath"/.

popd
set +euox pipefail


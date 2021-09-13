#!/bin/bash
set -euo pipefail


SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
pushd "$SCRIP_DIR"

source ../env
source ../util.sh

getValue WIFI_SSID 'WiFi SSID: '
getSecretValue WIFI_PASSWORD 'WiFi Password: '

ensureDirectory "$StagingPath"

eval "cat <<EOF
$(cat user-data.yaml)
EOF" > "$StagingPath"/user-data


popd
set +euox pipefail


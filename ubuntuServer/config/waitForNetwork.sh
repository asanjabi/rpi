#!/bin/bash
set -euxo pipefail


SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
pushd "$SCRIP_DIR"

while ! nc -zw1 google.com 443; do
    echo "waiting for network"
    sleep 1
done

popd
set +euox pipefail

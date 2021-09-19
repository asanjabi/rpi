#!/bin/bash
set -euxo pipefail

SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
pushd "$SCRIP_DIR"

source ../util.sh

CONFIG_TEMPLATE=$SCRIP_DIR/"config.toml.edge.template.dps.symmetric"
export CONFIG_TEMPLATE


IOT_EDGE_SCOPE_ID_TMP=$IOT_EDGE_SCOPE_ID
IOT_EDGE_REGISTRATION_ID_TMP=$IOT_EDGE_REGISTRATION_ID
IOT_EDGE_DPS_SYMMETRIC_KEY_TMP=$IOT_EDGE_DPS_SYMMETRIC_KEY

while : ; do

    getValue IOT_EDGE_SCOPE_ID 'Scope ID: '
    getValue IOT_EDGE_REGISTRATION_ID 'Registraion ID: '
    getValue IOT_EDGE_DPS_SYMMETRIC_KEY 'DPS Symmetric Key: '

    echo ""
    echo ""
    echo "Scope ID is:        $IOT_EDGE_SCOPE_ID"
    echo "Registration ID is: $IOT_EDGE_REGISTRATION_ID"
    echo "Symetric key is:    $IOT_EDGE_DPS_SYMMETRIC_KEY"
    echo ""

    correct=n
    read -rp 'Is this correct? (y,n) ' correct

    if [ "$correct" = "y" ]
    then
        export IOT_EDGE_SCOPE_ID
        export IOT_EDGE_REGISTRATION_ID
        export IOT_EDGE_SYMMETRIC_KEY

        keybytes=$(echo "$IOT_EDGE_DPS_SYMMETRIC_KEY" | base64 --decode | xxd -p -u -c 1000)
        IOT_EDGE_DEVICE_SYMMETRIC_KEY=$(echo -n "$IOT_EDGE_REGISTRATION_ID" | openssl sha256 -mac HMAC -macopt hexkey:$keybytes -binary | base64)
        export IOT_EDGE_DEVICE_SYMMETRIC_KEY
        break
    else
        IOT_EDGE_SCOPE_ID=$IOT_EDGE_SCOPE_ID_TMP
        IOT_EDGE_REGISTRATION_ID=$IOT_EDGE_REGISTRATION_ID_TMP
        IOT_EDGE_SYMMETRIC_KEY=$IOT_EDGE_DPS_SYMMETRIC_KEY_TMP
    fi

done

popd
set +euox pipefail

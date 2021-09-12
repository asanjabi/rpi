#!/bin/bash
set -euo pipefail

SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIP_DIR"/../env

#Setup wifi
read -rp 'SSID: ' SSID
read -rsp 'Password: ' Password

cat << EOF > $MountPath/wpa_supplicant.conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=$WiFiCountryCode

network={
        scan_ssid=1
        ssid="$SSID"
        psk="$Password"
        proto=RSN
        key_mgmt=WPA-PSK
        pairwise=CCMP
        auth_alg=OPEN
}
EOF

#Setup ssh
touch $MountPath/ssh
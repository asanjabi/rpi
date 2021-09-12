#!/bin/bash
set -euo pipefail

SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIP_DIR"/../env

if [ ! -d $MountPath ]
then
    echo "$MountPath doesn't exist creating directory"
    mkdir $MountPath
else
    echo "$MountPath already there"
fi

echo Mounting $MountDrive into $MountPath
mount -t drvfs $MountDrive $MountPath
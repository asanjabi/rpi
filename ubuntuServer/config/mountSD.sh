#!/bin/bash
set -euo pipefail

SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
pushd "$SCRIP_DIR"

source ../env

if [ ! -d $MountPath ]
then
    echo "$MountPath doesn't exist creating directory"
    mkdir $MountPath
else
    echo "$MountPath already there"
fi

echo Mounting $MountDrive into $MountPath
mount -t drvfs $MountDrive $MountPath

popd
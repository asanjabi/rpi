#!/bin/bash
set -euo pipefail

SCRIP_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIP_DIR"/../env

umount $MountPath

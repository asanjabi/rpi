#!/bin/bash
set -euo pipefail

sourceIfExists() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

getValue(){
    eval temp_var=\${"$1":-}
    if [ -z "$temp_var" ]; 
    then
        eval read -rp \'"$2"\' "$1"
    else
        echo "$1" was defined as "$temp_var"
    fi
}

getSecretValue(){
    eval temp_var=\${"$1":-}
    if [ -z "$temp_var" ]; 
    then
        eval read -rsp \'"$2"\' "$1"
    else
        echo "$1" was defined
    fi
}

ensureDirectory(){
    if [ ! -d "$1" ]; 
    then
        mkdir -p "$1"
    fi

}

#appendYaml targetFile fileToAppend
appendYaml(){
    echo merging $2 into $1
    yq eval-all -i 'select(fileIndex == 0) *+ select(filename == '\""$2"\"')' "$1" "$2"
}


set +xeuo pipefail
#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "usage: $0 <dir> <n>" 1>&2
    exit 1
fi

dir="$1"
n="$2"

if [ ! -d "$dir" ]; then
    echo "error: $dir is not a directory" 1>&2
    exit 1
fi

if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "error: <n> must be a non-negative integer" 1>&2
    exit 1
fi

find "$dir" -type f -size +"${n}"c -exec rm {} \;
exit 0

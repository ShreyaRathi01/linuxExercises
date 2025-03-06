#!/bin/bash
dir="$1"
n="$2"

if [ ! -d "$dir" ]; then
    echo "Error: '$dir' is not a valid directory." 1>&2
    exit 1
fi

if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "Error: <n> must be a non-negative integer." 1>&2
    exit 1
fi

find "$dir" -type f -size +${n}c -exec rm {} \;


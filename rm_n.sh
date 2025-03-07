#!/bin/bash

# Check that exactly two arguments are provided.
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <dir> <n>" 1>&2
    exit 1
fi

dir="$1"
n="$2"

# Verify that the first argument is a valid directory.
if [ ! -d "$dir" ]; then
    echo "Error: '$dir' is not a valid directory." 1>&2
    exit 1
fi

# Verify that the second argument is a non-negative integer.
if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "Error: <n> must be a non-negative integer." 1>&2
    exit 1
fi

# Remove files larger than <n> bytes.
find "$dir" -type f -size +"${n}"c -exec rm {} \;

#!/bin/bash

# Check if the column argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: ./mean.sh <column> [file.csv]" >&2
    exit 1
fi

column=$1

# Assign file or use stdin
file=${2:-/dev/stdin}

# Extract the specified column, skip the header, compute the mean
cut -d, -f$column "$file" | tail -n +2 | {
    sum=0
    count=0
    while read value; do
        sum=$(echo "$sum + $value" | bc)
        count=$((count + 1))
    done
    
    if [ $count -eq 0 ]; then
        echo "Error: No valid data in column $column" >&2
        exit 1
    fi
    
    mean=$(echo "scale=6; $sum / $count" | bc)
    echo "$mean"
}

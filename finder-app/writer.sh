#!/bin/bash

# First parameter must be provided
if [ -z $1 ]; then
    echo "First parameter missing"
    exit 1
fi

# Second parameter must be provided
if [ -z $2 ]; then
    echo "Second parameter missing"
    exit 1
fi

DIRNAME=$(dirname $1)
BASENAME=$(basename $1)

if ! mkdir -p "$DIRNAME"; then
    echo "Could not make directory at $DIRNAME"
    exit 1;
fi

echo "$2" > "$1"

echo "Wrote $2 to $1"
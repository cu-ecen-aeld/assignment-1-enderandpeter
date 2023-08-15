#!/bin/bash

# First parameter must be provided
if [ -z $1 ]; then
    echo "First parameter missing"
    exit 1
fi

# First parameter must be a directory
if ! [ -d "$1" ]; then
    printf "\"%s\" is not an accessible directory\n" $1
    exit 1
fi

# Second parameter must be provided
if [ -z $2 ]; then
    echo "Second parameter missing"
    exit 1
fi

FILESDIR=$1
SEARCHSTR=$2

RESULTS=$(grep -R "$2" "$1" | cut -f 1 -d :)
UNIQUERESULTS=$(echo "$RESULTS" | uniq)

NUMOFMATCHES=$(echo "$RESULTS" | wc -l)
NUMOFFILES=$(echo "$UNIQUERESULTS" | wc -l)

echo "The number of files are $NUMOFFILES and the number of matching lines are $NUMOFMATCHES"

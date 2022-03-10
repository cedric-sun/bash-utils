#!/bin/bash


# find all java class that has the same class name
# fullpath[filename] holds the full path of the last occurrence of `filename`

find -name '*.java' -print0 | \
    awk -F/ 'BEGIN { RS="\0" } { filename=$NF } count[filename] == 1 {printf "%-40s%s\n", filename, fullpath[filename]} count[filename] { printf "%-40s%s\n", filename, $0 } { fullpath[filename]=$0; count[filename]++ }' | sort > ans.txt


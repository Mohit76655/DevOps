#!/bin/bash

<< readMe
this script takes backup of given directory
usage:
./backup.sh <source_directory> <target_directory>
readMe

source_dir=$1
target_dir=$2

timestamp=$(date '+%Y-%m-%d-%H-%M-%S')

backup_dir="${target_dir}/backup_${timestamp}"

zip -r "${backup_dir}.zip" "${source_dir}" > /dev/null

if [ $? -eq 0 ]; then
    echo "Backup created Successfully"
else
    echo "Backup was not performed for $timestamp"
fi


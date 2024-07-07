#!/bin/bash

<< readMe
this script takes backup of given directory
usage:
./backup.sh <source_directory> <target_directory>
readMe

source_dir=$1
target_dir=$2

function create_backup {
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')

backup_dir="${target_dir}/backup_${timestamp}"

zip -r "${backup_dir}.zip" "${source_dir}" > /dev/null

if [ $? -eq 0 ]; then
    echo "Backup created Successfully"
else
    echo "Backup was not performed for $timestamp"
fi
}

function perform_rotation {
    local backups=($(ls -t "${target_dir}/backup_"*.zip))
	
    if [ "${#backups[@]}" -gt 3 ]; then
        local backups_to_remove=("${backups[@]:3}")
        for backup in "${backups_to_remove[@]}"; do
            rm -f "$backup"
        done
    fi
}

create_backup
perform_rotation


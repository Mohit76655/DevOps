#!/bin/bash

<< readMe
this script takes backup of given directory
usage:
./backup.sh <source_directory> <target_directory>
readMe

source_dir=$1
target_dir=$2

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <target_directory>"
    exit 1
fi

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory $source_dir does not exist."
    exit 1
fi

# Check if the target directory exists
if [ ! -d "$target_dir" ]; then
    echo "Error: Target directory $target_dir does not exist."
    exit 1
fi

# Function to create a backup

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

# Function to perform backup rotation

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


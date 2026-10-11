#!/bin/bash

TARGET_DIR="${1:-$HOME/linux-admin-toolkit}"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "ERROR: Directory does not exist"
    exit 1
fi

echo "===== PERMISSION AUDIT ====="
echo "Directory: $TARGET_DIR"

echo
echo "Directory Permissions:"
ls -ld "$TARGET_DIR"

echo
echo "Files and Directories:"
find "$TARGET_DIR" -maxdepth 2 \
    -printf '%M %u:%g %p\n'

echo
echo "World-Writable Files:"
find "$TARGET_DIR" -xdev -perm -0002 \
    -printf '%M %u:%g %p\n' 2>/dev/null

echo
echo "Permission audit completed"

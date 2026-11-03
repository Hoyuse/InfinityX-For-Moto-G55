#!/bin/bash
#
# Copyright (C) 2026 The LineageOS / Project Infinity-X
#
# Helper script to extract proprietary blobs from a dump or device.
#

set -e

DEVICE=taipei
VENDOR=motorola

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "extract_utils not found in ROM tree (${HELPER})."
    echo "Using direct file copy mode if dump path is provided."
fi

SRC="$1"

if [ -z "$SRC" ]; then
    SRC="${ANDROID_ROOT}/extracted"
fi

if [ ! -d "$SRC" ]; then
    echo "Extraction source directory not found: $SRC"
    echo "Usage: $0 [path_to_extracted_firmware_root]"
    exit 1
fi

DEST="${ANDROID_ROOT}/vendor/${VENDOR}/${DEVICE}/proprietary"
mkdir -p "$DEST"

echo "Reading proprietary-files.txt and copying blobs to $DEST..."
while IFS= read -r file || [ -n "$file" ]; do
    # Skip comments and empty lines
    [[ "$file" =~ ^#.*$ ]] && continue
    [ -z "$file" ] && continue

    # Strip prefixes like - or /
    clean_file="${file#-}"
    clean_file="${clean_file#/}"

    src_file="${SRC}/${clean_file}"
    dest_file="${DEST}/${clean_file}"

    if [ -f "$src_file" ] || [ -L "$src_file" ]; then
        mkdir -p "$(dirname "$dest_file")"
        cp -a "$src_file" "$dest_file"
    else
        echo "Warning: Missing blob: $src_file"
    fi
done < "${MY_DIR}/proprietary-files.txt"

echo "Extraction complete."

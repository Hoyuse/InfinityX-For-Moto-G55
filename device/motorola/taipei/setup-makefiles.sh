#!/bin/bash
#
# Copyright (C) 2026 The LineageOS / Project Infinity-X
#
# Generates Android.mk and BoardConfigVendor.mk for proprietary blobs.
#

set -e

DEVICE=taipei
VENDOR=motorola

MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."
OUT_DIR="${ANDROID_ROOT}/vendor/${VENDOR}/${DEVICE}"

mkdir -p "$OUT_DIR"

# Generate BoardConfigVendor.mk
cat << 'EOF' > "${OUT_DIR}/BoardConfigVendor.mk"
# Generated BoardConfigVendor for Motorola Moto G55 5G (taipei)
# Do not edit manually.
EOF

# Generate taipei-vendor.mk
cat << 'EOF' > "${OUT_DIR}/taipei-vendor.mk"
# Generated taipei-vendor.mk for Motorola Moto G55 5G (taipei)
# Do not edit manually.

PRODUCT_SOONG_NAMESPACES += \
    vendor/motorola/taipei

EOF

echo "Generated makefiles in ${OUT_DIR}"

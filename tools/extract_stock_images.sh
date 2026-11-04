#!/bin/bash
#
# extract_stock_images.sh
#
# Extracts the stock vendor-side logical partitions (vendor, vendor_dlkm,
# system_dlkm) from the Motorola CFC firmware package and places them where
# BoardConfig.mk expects them: <rom>/device/motorola/taipei-images/.
#
# Also extracts the stock product partition image, used as the source for the
# EuiccGoogle LPA and the eSIM permission files.
#
# Read-only with respect to the phone: this script only touches files on the PC.
#
# Usage:
#   tools/extract_stock_images.sh [firmware.zip] [rom_dir]
#
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FW_ZIP="${1:-$(ls "${PROJECT_ROOT}"/RETBR_XT2435-1_TAIPEI_*.zip | head -1)}"
ROM_DIR="${2:-${PROJECT_ROOT}/infinity-16}"
HOST_BIN="${ROM_DIR}/out/host/linux-x86/bin"
WORK="${PROJECT_ROOT}/work/stock-super"
OUT="${ROM_DIR}/device/motorola/taipei-images"
SLOT="_a"

for t in simg2img lpunpack lpdump; do
    [ -x "${HOST_BIN}/${t}" ] || { echo "Missing ${HOST_BIN}/${t} (run: m ${t})"; exit 1; }
done
[ -f "${FW_ZIP}" ] || { echo "Firmware zip not found: ${FW_ZIP}"; exit 1; }

mkdir -p "${WORK}" "${OUT}"

echo "==> Unpacking super sparse chunks from $(basename "${FW_ZIP}")"
unzip -o -q "${FW_ZIP}" 'super.img_sparsechunk.*' -d "${WORK}"

echo "==> Merging sparse chunks into raw super.img"
mapfile -t CHUNKS < <(ls "${WORK}"/super.img_sparsechunk.* | sort -t. -k3 -n)
"${HOST_BIN}/simg2img" "${CHUNKS[@]}" "${WORK}/super.raw"
rm -f "${CHUNKS[@]}"

"${HOST_BIN}/lpdump" "${WORK}/super.raw" > "${WORK}/lpdump.txt"

echo "==> Extracting logical partitions"
for p in vendor vendor_dlkm system_dlkm product; do
    "${HOST_BIN}/lpunpack" --partition="${p}${SLOT}" "${WORK}/super.raw" "${WORK}"
done
rm -f "${WORK}/super.raw"

for p in vendor vendor_dlkm system_dlkm; do
    mv -f "${WORK}/${p}${SLOT}.img" "${OUT}/${p}.img"
done
mv -f "${WORK}/product${SLOT}.img" "${WORK}/product.img"

echo "==> SHA-256"
( cd "${OUT}" && sha256sum vendor.img vendor_dlkm.img system_dlkm.img | tee SHA256SUMS )

echo "==> Extracting EuiccGoogle LPA from stock product"
export LD_LIBRARY_PATH="${PROJECT_ROOT}/tools/local/usr/lib/x86_64-linux-gnu${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
DUMP_EROFS="${PROJECT_ROOT}/tools/local/usr/bin/dump.erofs"
EUICC_DIR="${PROJECT_ROOT}/device/motorola/taipei/euicc"
"${DUMP_EROFS}" --cat --path=/priv-app/EuiccGoogle/EuiccGoogle.apk "${WORK}/product.img" \
    > "${EUICC_DIR}/EuiccGoogle.apk"
unzip -tq "${EUICC_DIR}/EuiccGoogle.apk"

echo "Done. Images in ${OUT}; stock product image in ${WORK}/product.img"

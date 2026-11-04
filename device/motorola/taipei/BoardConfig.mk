#
# Copyright (C) 2026 The LineageOS / Project Infinity-X
#
# Device BoardConfig for Motorola Moto G55 5G (taipei)
# Based on stock Android 16 firmware: W1UTS36.51-39-4 (XT2435-1)
#

DEVICE_PATH := device/motorola/taipei

# Architecture (SoC MT6855 - Dimensity 7025)
# 2x Arm Cortex-A78 @ 2.5 GHz + 6x Arm Cortex-A55 @ 2.0 GHz
TARGET_ARCH := arm64
# Soong has no cortex-a78 tuning; cortex-a76 is the closest supported target.
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

# Kernel & Bootchain (Prebuilt GKI Bringup Solution)
# Stock kernel version string: 6.12.58-android16-6-gb0a9599c6c01-ab14987696-4k
# GKI baseline: AOSP android16-6.12-2025-12
# Como Motorola no ha liberado aun las fuentes completas del kernel MT6855 en GitHub,
# se utiliza el kernel stock GKI y DTB/DTBO oficiales en modo prebuilt para el bringup.
KERNEL_PREBUILT_DIR := $(DEVICE_PATH)/prebuilt

BOARD_BOOT_HEADER_VERSION := 4
TARGET_PREBUILT_KERNEL := $(KERNEL_PREBUILT_DIR)/kernel

# DTB: stock vendor_boot DTB, kept byte-identical including its Android
# DT-table header (magic 0xd7b7ab1e). The build concatenates every *.dtb in
# this directory, so it must contain only mt6855.dtb.
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PREBUILT_DIR)/dtb
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PREBUILT_DIR)/dtbo.img

# Load addresses, verified against the stock vendor_boot v4 header:
#   kernel 0x40000000, ramdisk 0x66f00000, tags/dtb 0x47c80000, page 0x1000
BOARD_KERNEL_BASE        := 0x3fff8000
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x26f08000
BOARD_KERNEL_TAGS_OFFSET := 0x07c88000
BOARD_DTB_OFFSET         := 0x07c88000
BOARD_KERNEL_PAGESIZE    := 4096

BOARD_MKBOOTIMG_ARGS += \
    --header_version $(BOARD_BOOT_HEADER_VERSION) \
    --base $(BOARD_KERNEL_BASE) \
    --pagesize $(BOARD_KERNEL_PAGESIZE) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
    --dtb_offset $(BOARD_DTB_OFFSET)

# Stock vendor_boot ramdisks are LZ4 (legacy) compressed
BOARD_RAMDISK_USE_LZ4 := true

# Kernel cmdline / bootconfig (stock vendor_boot values).
# bootopt selects the MTK CPU boot mode and must be present for LK.
# androidboot.selinux=permissive is for bringup only (userdebug/eng).
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 loglevel=4 initcall_debug=0
BOARD_BOOTCONFIG := \
    androidboot.selinux=permissive \
    kernel.rcu_nocbs=all \
    kernel.rcutree.enable_rcu_lazy=1 \
    kernel.rcupdate.rcu_cpu_stall_cputime=1

# First-stage kernel modules (vendor_boot ramdisk), copied 1:1 from the
# stock vendor_boot. Includes UFS/MMC, clocks, pinctrl, PMIC and panels.
# Load order is sequential and must follow the stock modules.load.
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(KERNEL_PREBUILT_DIR)/vendor_ramdisk/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PREBUILT_DIR)/vendor_ramdisk/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PREBUILT_DIR)/vendor_ramdisk/modules.load.recovery))

# Boot / Vendor Boot / DTBO partition sizes (verified from stock CFC)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Dynamic Partitions (Super)
# [EVIDENCIA]: Reconstruido de 27 sparsechunks, LP metadata v10.2
# Super total capacity: 10,334,765,056 bytes
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm

BOARD_SUPER_PARTITION_SIZE := 10334765056
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 10330570752
BOARD_MAIN_PARTITION_LIST := \
    product \
    system \
    system_ext \
    system_dlkm \
    vendor \
    vendor_dlkm

# Filesystem types
# [EVIDENCIA]: Firmware stock usa EROFS con LZ4_0PADDING para particiones logicas
TARGET_USERIMAGES_USE_EXT4 := false
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_EROFS_COMPRESSOR := lz4

# Prebuilt stock vendor-side images (initial bringup strategy).
# Extracted with simg2img + lpunpack from the stock super of W1UTS36.51-39-4
# (see tools/extract_stock_images.sh). These images are NOT tracked in git.
# They provide the complete MTK/Motorola vendor: HAL libraries, VINTF
# manifests, vendor sepolicy, init scripts, build.prop and the matching
# signed kernel modules (vendor_dlkm + GKI system_dlkm) with their loader.
BOARD_PREBUILT_VENDORIMAGE      := $(DEVICE_PATH)-images/vendor.img
BOARD_PREBUILT_VENDOR_DLKMIMAGE := $(DEVICE_PATH)-images/vendor_dlkm.img
BOARD_PREBUILT_SYSTEM_DLKMIMAGE := $(DEVICE_PATH)-images/system_dlkm.img

# Recovery / Virtual A/B
# Recovery ramdisk lives as a fragment inside vendor_boot (like stock),
# which provides fastbootd for flashing logical partitions.
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    system_dlkm \
    vendor \
    vendor_boot \
    vendor_dlkm \
    vbmeta \
    vbmeta_system

BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6855
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# AVB 2.0
# Stock layout: vbmeta chains vbmeta_system (rollback location 2), which
# covers system + system_ext. Verification is disabled (flags 3) for bringup
# on an unlocked bootloader. NEVER relock the bootloader with these images.
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Display & Graphics
# GPU: Imagination Technologies PowerVR B-Series BXM-8-256
# Density: 400 dpi (ro.sf.lcd_density=400, provided by stock vendor)
TARGET_SCREEN_DENSITY := 400

# Security Patch & Platform Level
# [EVIDENCIA]: ro.vendor.build.security_patch=2026-09-01, ro.board.first_api_level=31
VENDOR_SECURITY_PATCH := 2026-09-01
BOARD_FIRST_API_LEVEL := 31
BOARD_SHUTDOWN_WLAN_WAIT := 1000

# SELinux / VINTF
# With the prebuilt stock vendor image, vendor sepolicy and the vendor VINTF
# manifest come from the image itself. The extracted contexts/types under
# sepolicy/vendor and the fragments under vintf/ are kept in the tree for the
# later move to a blob-built vendor, but are intentionally NOT referenced here.

# Include proprietary blobs BoardConfig
-include vendor/motorola/taipei/BoardConfigVendor.mk

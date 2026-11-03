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
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Kernel & Bootchain (Prebuilt GKI Bringup Solution)
# Stock kernel version string: 6.12.58-android16-6-gb0a9599c6c01-ab14987696-4k
# GKI baseline: AOSP android16-6.12-2025-12
# Como Motorola no ha liberado aun las fuentes completas del kernel MT6855 en GitHub,
# se utiliza el kernel stock GKI y DTB/DTBO oficiales en modo prebuilt para el bringup.
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt

# Page size: 4K (4096 bytes) standard, max 16KB compatible
BOARD_PAGE_SIZE := 4096
BOARD_KERNEL_PAGESIZE := 4096

# Boot / Vendor Boot / DTBO partition sizes (verified from stock CFC & G54 OTA)
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

# Recovery / Virtual A/B
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
TARGET_NO_RECOVERY := true

# Display & Graphics
# GPU: Imagination Technologies PowerVR B-Series BXM-8-256
# Density: 400 dpi (ro.sf.lcd_density=400)
TARGET_SCREEN_DENSITY := 400

# Security Patch & Platform Level
# [EVIDENCIA]: ro.vendor.build.security_patch=2026-09-01, ro.board.first_api_level=31
VENDOR_SECURITY_PATCH := 2026-09-01
BOARD_FIRST_API_LEVEL := 31
BOARD_SHUTDOWN_WLAN_WAIT := 1000

# SELinux Policy
# En la fase de bringup inicial se utiliza permissive para auditoria de AVC denials
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# VINTF Manifests
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest_IMoto_AIDL_Fingerprint.xml \
    $(DEVICE_PATH)/vintf/manifest_cameraprovider.xml \
    $(DEVICE_PATH)/vintf/manifest_isphal.xml \
    $(DEVICE_PATH)/vintf/manifest_hwcomposer.xml \
    $(DEVICE_PATH)/vintf/manifest_gralloc.xml \
    $(DEVICE_PATH)/vintf/manifest_touch.xml

# Include proprietary blobs BoardConfig
-include vendor/motorola/taipei/BoardConfigVendor.mk

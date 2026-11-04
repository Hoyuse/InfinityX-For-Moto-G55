#
# Copyright (C) 2026 The LineageOS / Project Infinity-X
#
# Device makefile for Motorola Moto G55 5G (taipei)
#

DEVICE_PATH := device/motorola/taipei

# Setup makefile variables
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Shipping API level (stock ro.product.first_api_level, launched with Android 14)
PRODUCT_SHIPPING_API_LEVEL := 34

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Virtual A/B with compression, first-stage tools in vendor_ramdisk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# fastbootd (runs from the recovery fragment of vendor_boot)
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot-service.example_recovery

# First-stage fstab
# Boot header v4 GKI: first-stage ramdisk lives in vendor_boot.
# NOTE: /vendor/etc/fstab.mt6855 (second stage) comes from the prebuilt
# stock vendor image and is not overridden here.
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6855:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6855

# Display / Density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Hardware feature permissions for vendor (camera, sensors, NFC, wifi,
# telephony.gsm, ...) ship inside the prebuilt stock vendor image.

# eSIM / eUICC: feature flag + Google LPA (EuiccGoogle) from stock product.
# Do NOT ship etc/sysconfig/unavail.android.hardware.telephony.euicc-esim.xml,
# it removes the eUICC feature.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml \
    $(DEVICE_PATH)/euicc/privapp-permissions-com.google.android.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-com.google.android.euicc.xml \
    $(DEVICE_PATH)/euicc/default-permissions-com.google.android.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions-com.google.android.euicc.xml

PRODUCT_PACKAGES += \
    EuiccGoogle

# Proprietary blobs
# The blob-built vendor (vendor/motorola/taipei/taipei-vendor.mk) is disabled
# while the prebuilt stock vendor/vendor_dlkm/system_dlkm images are used.
# Re-enable once the vendor is built from blobs:
# $(call inherit-product, vendor/motorola/taipei/taipei-vendor.mk)

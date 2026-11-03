#
# Copyright (C) 2026 The LineageOS Project
#
# LineageOS makefile for Motorola Moto G55 5G (taipei)
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/taipei/device.mk)

# Device identifier
PRODUCT_DEVICE := taipei
PRODUCT_NAME := lineage_taipei
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g55 5G
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=taipei_g_sys \
    TARGET_DEVICE=taipei \
    BUILD_FINGERPRINT="motorola/taipei_g_sys/taipei:16/W1UTS36.51-39-4/4720d-615a8a:user/release-keys"

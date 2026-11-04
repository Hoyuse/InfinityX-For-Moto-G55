#
# Copyright (C) 2026 Project Infinity-X
#
# Infinity-X ROM makefile for Motorola Moto G55 5G (taipei)
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit Infinity-X common configuration
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/taipei/device.mk)

# Device identifier
PRODUCT_DEVICE := taipei
PRODUCT_NAME := infinity_taipei
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g55 5G
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Stock taipei product fingerprint (ro.product.build.fingerprint, W1UTS36M.51-39-4)
# Android 16 gen_build_prop only accepts Soong product-config keys here.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="taipei_g_sys-user 16 W1UTS36M.51-39-4 615a8a release-keys" \
    BuildFingerprint=motorola/taipei_g_sys/taipei:16/W1UTS36M.51-39-4/615a8a:user/release-keys \
    DeviceProduct=taipei_g_sys

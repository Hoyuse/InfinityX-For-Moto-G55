# Copyright (C) 2024-2026 The Android Open Source Project
# Copyright (C) 2024-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Auto-generated from proprietary-files.txt — DO NOT EDIT

PRODUCT_SOONG_NAMESPACES += \
    vendor/motorola/taipei

# Proprietary files list for Motorola Moto G55 5G (taipei / XT2435-1)
# Source firmware: W1UTS36.51-39-4 (Android 16 / SDK 36)
# Generated from verified stock images (vendor & vendor_dlkm)
# DO NOT hand-edit unverified entries. Every listed file was checked against stock images.
# Audio
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.audio.service-aidl.mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.audio.service-aidl.mediatek \
    vendor/motorola/taipei/proprietary/vendor/etc/init/android.hardware.audio.service-aidl.mediatek.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.audio.service-aidl.mediatek.rc \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/audio.primary.mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/audio.primary.mediatek.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/audio.primary.mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/audio.primary.mediatek.so \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/audio.r_submix.mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/audio.r_submix.mediatek.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/audio.r_submix.mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/audio.r_submix.mediatek.so \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/vendor.mediatek.hardware.audio-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/vendor.mediatek.hardware.audio-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/vendor.mediatek.hardware.audio-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.audio-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/android.hardware.audio.effect.aidl-impl-mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.audio.effect.aidl-impl-mediatek.so \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/android.hardware.soundtrigger3-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/android.hardware.soundtrigger3-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/android.hardware.soundtrigger3-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.soundtrigger3-impl.so \
    vendor/motorola/taipei/proprietary/vendor/etc/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    vendor/motorola/taipei/proprietary/vendor/etc/audio_effects_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_config.xml \
    vendor/motorola/taipei/proprietary/vendor/etc/audio_device.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_device.xml \
    vendor/motorola/taipei/proprietary/vendor/etc/audio_em.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_em.xml \
    vendor/motorola/taipei/proprietary/vendor/etc/audio_framework_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_framework_configuration.xml

# Biometrics (Fingerprint Goodix)
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.biometrics.fingerprint-service.goodix:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.biometrics.fingerprint-service.goodix \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/fingerprint.goodix.default.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/fingerprint.goodix.default.so

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.bluetooth-service-mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.bluetooth-service-mediatek \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.bluetooth.finder-service-mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.bluetooth.finder-service-mediatek \
    vendor/motorola/taipei/proprietary/vendor/etc/init/android.hardware.bluetooth-service-mediatek.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.bluetooth-service-mediatek.rc \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/vendor.mediatek.hardware.bluetooth.audio@2.1-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/vendor.mediatek.hardware.bluetooth.audio@2.1-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/vendor.mediatek.hardware.bluetooth.audio@2.1-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.bluetooth.audio@2.1-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/vendor.mediatek.hardware.bluetooth.audio@2.2-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/vendor.mediatek.hardware.bluetooth.audio@2.2-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/vendor.mediatek.hardware.bluetooth.audio@2.2-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.bluetooth.audio@2.2-impl.so \
    vendor/motorola/taipei/proprietary/vendor/firmware/BT_FW.cfg:$(TARGET_COPY_OUT_VENDOR)/firmware/BT_FW.cfg \
    vendor/motorola/taipei/proprietary/vendor/firmware/soc2_2_ram_bt_1b_1_hdr.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/soc2_2_ram_bt_1b_1_hdr.bin \
    vendor/motorola/taipei/proprietary/vendor/firmware/soc2_2_ram_bt_1c_1_hdr.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/soc2_2_ram_bt_1c_1_hdr.bin

# Camera (MTK MT6855 ISP6s)
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/camerahalserver:$(TARGET_COPY_OUT_VENDOR)/bin/hw/camerahalserver \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/mt6855/camerahalserver:$(TARGET_COPY_OUT_VENDOR)/bin/hw/mt6855/camerahalserver \
    vendor/motorola/taipei/proprietary/vendor/etc/init/camerahalserver.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/camerahalserver.rc \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/mt6855/android.hardware.camera.provider@2.6-impl-mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/mt6855/android.hardware.camera.provider@2.6-impl-mediatek.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/mt6855/vendor.mediatek.hardware.camera.ccap@1.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/mt6855/vendor.mediatek.hardware.camera.ccap@1.0-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/mt6855/vendor.mediatek.hardware.camera.isphal_aidl@1.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/mt6855/vendor.mediatek.hardware.camera.isphal_aidl@1.0-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/vendor.mediatek.hardware.camera.atms_aidl@1.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.camera.atms_aidl@1.0-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/vendor.mediatek.hardware.camera.bgservice_aidl@1.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.camera.bgservice_aidl@1.0-impl.so

# Display, Graphics & EGL (PowerVR Rogue MT6855)
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.graphics.composer@3.2-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.graphics.composer@3.2-service \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.graphics.composer@3.3-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.graphics.composer@3.3-service \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.graphics.composer@3.4-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.graphics.composer@3.4-service \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.graphics.allocator-V2-service-mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.graphics.allocator-V2-service-mediatek \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.graphics.allocator-V2-service-mediatek.mt6855:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.graphics.allocator-V2-service-mediatek.mt6855 \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/mt6855/android.hardware.graphics.allocator-V2-service-mediatek.mt6855:$(TARGET_COPY_OUT_VENDOR)/bin/hw/mt6855/android.hardware.graphics.allocator-V2-service-mediatek.mt6855 \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/mt6855/mapper.powervr.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/mt6855/mapper.powervr.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/mt6855/mapper.powervr.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/mt6855/mapper.powervr.so \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/mt6855/libpvr_mapper_utils.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/mt6855/libpvr_mapper_utils.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/mt6855/libpvr_mapper_utils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/mt6855/libpvr_mapper_utils.so \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/mt6855/vulkan.mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/mt6855/vulkan.mtk.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/mt6855/vulkan.mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/mt6855/vulkan.mtk.so \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/mt6855/vendor.mediatek.hardware.pq_aidl-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/mt6855/vendor.mediatek.hardware.pq_aidl-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/mt6855/vendor.mediatek.hardware.pq_aidl-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/mt6855/vendor.mediatek.hardware.pq_aidl-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/hwcomposer.mtk_common.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/hwcomposer.mtk_common.so \
    vendor/motorola/taipei/proprietary/vendor/lib/egl/egl.cfg:$(TARGET_COPY_OUT_VENDOR)/lib/egl/egl.cfg \
    vendor/motorola/taipei/proprietary/vendor/lib/egl/mt6855/libEGL_mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib/egl/mt6855/libEGL_mtk.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/egl/mt6855/libEGL_mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/egl/mt6855/libEGL_mtk.so \
    vendor/motorola/taipei/proprietary/vendor/lib/egl/mt6855/libGLESv1_CM_mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib/egl/mt6855/libGLESv1_CM_mtk.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/egl/mt6855/libGLESv1_CM_mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/egl/mt6855/libGLESv1_CM_mtk.so \
    vendor/motorola/taipei/proprietary/vendor/lib/egl/mt6855/libGLESv2_mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib/egl/mt6855/libGLESv2_mtk.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/egl/mt6855/libGLESv2_mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/egl/mt6855/libGLESv2_mtk.so \
    vendor/motorola/taipei/proprietary/vendor/firmware/rgx.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rgx.fw \
    vendor/motorola/taipei/proprietary/vendor/firmware/rgx.sh:$(TARGET_COPY_OUT_VENDOR)/firmware/rgx.sh

# Motorola Custom Services & Sensors
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/com.motorola.hardware.display.panel-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/com.motorola.hardware.display.panel-service \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/com.motorola.hardware.display.touch-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/com.motorola.hardware.display.touch-service \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/motorola.hardware.fdr-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/motorola.hardware.fdr-service \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/motorola.hardware.health-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/motorola.hardware.health-service \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/motorola.hardware.health.storage-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/motorola.hardware.health.storage-service \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/motorola.hardware.sarwifi-srv:$(TARGET_COPY_OUT_VENDOR)/bin/hw/motorola.hardware.sarwifi-srv \
    vendor/motorola/taipei/proprietary/vendor/etc/init/com.motorola.hardware.display.panel-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/com.motorola.hardware.display.panel-service.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/com.motorola.hardware.display.touch-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/com.motorola.hardware.display.touch-service.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/motorola.hardware.fdr.service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/motorola.hardware.fdr.service.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/motorola.hardware.health.service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/motorola.hardware.health.service.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/motorola.hardware.health.storage.service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/motorola.hardware.health.storage.service.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/sarwifi-default.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/sarwifi-default.rc

# Gatekeeper & Keymint (Trustonic TEE)
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.gatekeeper-service.trustonic:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.gatekeeper-service.trustonic \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.security.keymint@3.0-service.trustonic:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.security.keymint@3.0-service.trustonic \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/vendor.trustonic.tee-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.trustonic.tee-service \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/vendor.trustonic.alps.alps_device@1.1-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.trustonic.alps.alps_device@1.1-service \
    vendor/motorola/taipei/proprietary/vendor/etc/init/trustonic.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/trustonic.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/tee.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/tee.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/vendor.trustonic.tee-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.trustonic.tee-service.rc

# GNSS / GPS
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.gnss-service.mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.gnss-service.mediatek \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/vendor.mediatek.hardware.gnss-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.mediatek.hardware.gnss-service \
    vendor/motorola/taipei/proprietary/vendor/etc/init/mtk_gnss.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/mtk_gnss.rc \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/android.hardware.gnss-impl-mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.gnss-impl-mediatek.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/vendor.mediatek.hardware.gnss-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.gnss-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/vendor.mediatek.hardware.gnss.batching-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.gnss.batching-impl.so

# Lights & Vibrator
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.lights-service.mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.lights-service.mediatek \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.vibrator-service.mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.vibrator-service.mediatek \
    vendor/motorola/taipei/proprietary/vendor/etc/init/lights-mtk-default.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/lights-mtk-default.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/vibrator-mtk-default.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vibrator-mtk-default.rc

# Media Codecs
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.media.c2-mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.media.c2-mediatek \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.media.c2-mediatek-64b:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.media.c2-mediatek-64b \
    vendor/motorola/taipei/proprietary/vendor/etc/init/android.hardware.media.c2-mediatek-64b.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.media.c2-mediatek-64b.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
    vendor/motorola/taipei/proprietary/vendor/etc/media_codecs_performance_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_c2.xml \
    vendor/motorola/taipei/proprietary/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    vendor/motorola/taipei/proprietary/vendor/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# NFC (Samsung S3NRN4V)
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.nfc-service.sec:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.nfc-service.sec \
    vendor/motorola/taipei/proprietary/vendor/etc/init/nfc-service-sec.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/nfc-service-sec.rc \
    vendor/motorola/taipei/proprietary/vendor/firmware/sec_s3nrn4v_firmware.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/sec_s3nrn4v_firmware.bin

# Power & Thermal
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.thermal-service.mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.thermal-service.mediatek \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/vendor.mediatek.hardware.mtkpower-service.mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.mediatek.hardware.mtkpower-service.mediatek \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/vendor.mediatek.hardware.mtkpower_applist-service.mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.mediatek.hardware.mtkpower_applist-service.mediatek \
    vendor/motorola/taipei/proprietary/vendor/etc/init/thermal-mediatek.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/thermal-mediatek.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/vendor.mediatek.hardware.mtkpower@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.mediatek.hardware.mtkpower@1.0-service.rc \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/vendor.mediatek.hardware.mtkpower-aidl-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/vendor.mediatek.hardware.mtkpower-aidl-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/vendor.mediatek.hardware.mtkpower-aidl-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.mtkpower-aidl-impl.so \
    vendor/motorola/taipei/proprietary/vendor/lib/hw/thermal_hal.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/thermal_hal.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/thermal_hal.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/thermal_hal.so

# Radio, RIL & Modem
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/mtkfusionrild:$(TARGET_COPY_OUT_VENDOR)/bin/hw/mtkfusionrild \
    vendor/motorola/taipei/proprietary/vendor/etc/init/mtkrild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/mtkrild.rc \
    vendor/motorola/taipei/proprietary/vendor/bin/ccci_mdinit:$(TARGET_COPY_OUT_VENDOR)/bin/ccci_mdinit \
    vendor/motorola/taipei/proprietary/vendor/bin/ccci_rpcd:$(TARGET_COPY_OUT_VENDOR)/bin/ccci_rpcd \
    vendor/motorola/taipei/proprietary/vendor/bin/gsm0710muxd:$(TARGET_COPY_OUT_VENDOR)/bin/gsm0710muxd \
    vendor/motorola/taipei/proprietary/vendor/etc/init/init.cccimdinit.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.cccimdinit.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/init.cccirpcd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.cccirpcd.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/gsm0710muxd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/gsm0710muxd.rc

# Sensors & SCP
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/android.hardware.sensors@2.X-subhal-mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.sensors@2.X-subhal-mediatek.so \
    vendor/motorola/taipei/proprietary/vendor/lib64/hw/sensors.mediatek.V2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/sensors.mediatek.V2.0.so \
    vendor/motorola/taipei/proprietary/vendor/etc/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    vendor/motorola/taipei/proprietary/vendor/firmware/remoteproc_scp:$(TARGET_COPY_OUT_VENDOR)/firmware/remoteproc_scp

# Touchscreen Firmware
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/firmware/focaltech_ts_fw_csot.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/focaltech_ts_fw_csot.bin \
    vendor/motorola/taipei/proprietary/vendor/firmware/focaltech_ts_fw_csot_ft8725.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/focaltech_ts_fw_csot_ft8725.bin \
    vendor/motorola/taipei/proprietary/vendor/firmware/ILITEK_FW:$(TARGET_COPY_OUT_VENDOR)/firmware/ILITEK_FW \
    vendor/motorola/taipei/proprietary/vendor/firmware/novatek_ts_fw.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/novatek_ts_fw.bin \
    vendor/motorola/taipei/proprietary/vendor/firmware/novatek_ts_mp.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/novatek_ts_mp.bin \
    vendor/motorola/taipei/proprietary/vendor/firmware/NT36xxx_MP_Setting_Criteria_606B.csv:$(TARGET_COPY_OUT_VENDOR)/firmware/NT36xxx_MP_Setting_Criteria_606B.csv

# USB
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.usb-aidl-service.mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.usb-aidl-service.mediatek \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/android.hardware.usb.gadget-aidl-service.mediatek:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.usb.gadget-aidl-service.mediatek \
    vendor/motorola/taipei/proprietary/vendor/etc/init/android.hardware.usb-aidl-service.mediatek.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.usb-aidl-service.mediatek.rc \
    vendor/motorola/taipei/proprietary/vendor/etc/init/android.hardware.usb.gadget-aidl-service.mediatek.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.usb.gadget-aidl-service.mediatek.rc

# Wi-Fi & Connectivity
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor/bin/hw/hostapd:$(TARGET_COPY_OUT_VENDOR)/bin/hw/hostapd \
    vendor/motorola/taipei/proprietary/vendor/etc/init/hostapd.android.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hostapd.android.rc \
    vendor/motorola/taipei/proprietary/vendor/firmware/WIFI_RAM_CODE_soc2_2_1b_1.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/WIFI_RAM_CODE_soc2_2_1b_1.bin \
    vendor/motorola/taipei/proprietary/vendor/firmware/WIFI_RAM_CODE_soc2_2_1c_1.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/WIFI_RAM_CODE_soc2_2_1c_1.bin \
    vendor/motorola/taipei/proprietary/vendor/firmware/soc2_2_ram_wifi_1b_1_hdr.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/soc2_2_ram_wifi_1b_1_hdr.bin \
    vendor/motorola/taipei/proprietary/vendor/firmware/soc2_2_ram_wifi_1c_1_hdr.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/soc2_2_ram_wifi_1c_1_hdr.bin \
    vendor/motorola/taipei/proprietary/vendor/firmware/wifi.cfg:$(TARGET_COPY_OUT_VENDOR)/firmware/wifi.cfg \
    vendor/motorola/taipei/proprietary/vendor/firmware/WMT_SOC.cfg:$(TARGET_COPY_OUT_VENDOR)/firmware/WMT_SOC.cfg \
    vendor/motorola/taipei/proprietary/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    vendor/motorola/taipei/proprietary/vendor/etc/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    vendor/motorola/taipei/proprietary/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Kernel Modules (vendor_dlkm)
PRODUCT_COPY_FILES += \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/adsp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/adsp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/archcounter_timesync.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/archcounter_timesync.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/arm_dsu_pmu.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/arm_dsu_pmu.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/atf_logger.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/atf_logger.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/audio_ipi.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/audio_ipi.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/backlight_cooling.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/backlight_cooling.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/board_temp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/board_temp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/bt_drv_connac1x.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/bt_drv_connac1x.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/btif_drv.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/btif_drv.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/c2k_usb.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/c2k_usb.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/c2k_usb_f_via_atc.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/c2k_usb_f_via_atc.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/c2k_usb_f_via_ets.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/c2k_usb_f_via_ets.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/c2k_usb_f_via_modem.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/c2k_usb_f_via_modem.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/cam_qos.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/cam_qos.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/camera_dip_isp6s.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/camera_dip_isp6s.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/camera_eeprom.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/camera_eeprom.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/camera_fdvt_isp51.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/camera_fdvt_isp51.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/camera_isp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/camera_isp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/camera_mem.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/camera_mem.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/camera_mfb_isp6s.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/camera_mfb_isp6s.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/camera_rsc_isp6s.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/camera_rsc_isp6s.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/camera_wpe_isp6s.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/camera_wpe_isp6s.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ccci_auxadc.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ccci_auxadc.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ccci_ccif.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ccci_ccif.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ccci_dpmaif.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ccci_dpmaif.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ccci_fsm_scp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ccci_fsm_scp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ccci_md_all.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ccci_md_all.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ccci_util_lib.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ccci_util_lib.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ccidvfs.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ccidvfs.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ccmni.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ccmni.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/cfg80211.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/cfg80211.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/charger_cooling.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/charger_cooling.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/clk-disable-unused.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/clk-disable-unused.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/cmdq-sec-drv.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/cmdq-sec-drv.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/connadp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/connadp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/connfem.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/connfem.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/cpudvfs.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/cpudvfs.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/cpufreq_sugov_ext.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/cpufreq_sugov_ext.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/cpuqos_v3.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/cpuqos_v3.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/emi-mpu-hook-v1.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/emi-mpu-hook-v1.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/fhctl.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/fhctl.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/flashlight.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/flashlight.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/flashlights-taipei-pwm.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/flashlights-taipei-pwm.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/fmradio_drv_mt6631_6635.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/fmradio_drv_mt6631_6635.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/focaltech_0flash_mmi_v2.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/focaltech_0flash_mmi_v2.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/fpsgo.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/fpsgo.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ged.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ged.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/goodix_fps_mmi_u.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/goodix_fps_mmi_u.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/gps_drv_stp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/gps_drv_stp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/gps_pwr.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/gps_pwr.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/gz_ipc_mod.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/gz_ipc_mod.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/gz_irq_mod.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/gz_irq_mod.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/gz_log_mod.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/gz_log_mod.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/gz_main_mod.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/gz_main_mod.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/gz_trusty_mod.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/gz_trusty_mod.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/gz_tz_system.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/gz_tz_system.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/gz_virtio_mod.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/gz_virtio_mod.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/hf_manager.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/hf_manager.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ilitek_v3_mmi.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ilitek_v3_mmi.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/imgsensor_isp6s.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/imgsensor_isp6s.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/iommu_gz.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/iommu_gz.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/libarc4.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/libarc4.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/lm3644.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/lm3644.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/load_track.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/load_track.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mac80211.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mac80211.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/main2af.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/main2af.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/main3af.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/main3af.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mainaf.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mainaf.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mcupm.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mcupm.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/md_cooling_all.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/md_cooling_all.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mddp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mddp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mdp_drv_mt6855.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mdp_drv_mt6855.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/met.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/met.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/met_backlight_api.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/met_backlight_api.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/met_emi_api.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/met_emi_api.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/met_gpu_adv_api.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/met_gpu_adv_api.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/met_gpu_api.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/met_gpu_api.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/met_ipi_api.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/met_ipi_api.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/met_mcupm_api.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/met_mcupm_api.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/met_scmi_api.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/met_scmi_api.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/met_sspm_api.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/met_sspm_api.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/met_vcore_api.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/met_vcore_api.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mmi_decrete_charger_cp_qc3p.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mmi_decrete_charger_cp_qc3p.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mmi_info.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mmi_info.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mmi_relay.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mmi_relay.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/moto_binder.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/moto_binder.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/moto_f_usbnet.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/moto_f_usbnet.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/moto_mm.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/moto_mm.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/moto_mmap_fault.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/moto_mmap_fault.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/moto_sched.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/moto_sched.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/moto_swap.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/moto_swap.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mt6369-accdet.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mt6369-accdet.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mt6855-mt6369.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mt6855-mt6369.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-btcvsd.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-btcvsd.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-composite.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-composite.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-cqdma.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-cqdma.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-dvfsrc-start.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-dvfsrc-start.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-lpm-dbg-common-v1-legacy.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-lpm-dbg-common-v1-legacy.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-lpm-dbg-mt6855-legacy.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-lpm-dbg-mt6855-legacy.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-lpm-legacy.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-lpm-legacy.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-lpm-plat-v1-legacy.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-lpm-plat-v1-legacy.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-mbox.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-mbox.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-pm-domain-disable-unused.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-pm-domain-disable-unused.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-pmic-oc-debug.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-pmic-oc-debug.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-pwm.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-pwm.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-scp-ultra.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-scp-ultra.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-scp-vow.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-scp-vow.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-sp-spk-amp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-sp-spk-amp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-ssc-dbg-v2.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-ssc-dbg-v2.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-ssc.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-ssc.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-swpm-dbg-common-v1-legacy.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-swpm-dbg-common-v1-legacy.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-swpm-dbg-v6855.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-swpm-dbg-v6855.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-swpm-legacy.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-swpm-legacy.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-vcodec-common.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-vcodec-common.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-vcodec-dec.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-vcodec-dec.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-vcodec-enc.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-vcodec-enc.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-vcu.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-vcu.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk-vow.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk-vow.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_apu_power_throttling.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_apu_power_throttling.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_battery_oc_throttling.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_battery_oc_throttling.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_bp_thl.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_bp_thl.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_cm_ipi_legacy_v1.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_cm_ipi_legacy_v1.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_cm_mgr_legacy_v1.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_cm_mgr_legacy_v1.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_cm_mgr_mt6855.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_cm_mgr_mt6855.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_core_ctl.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_core_ctl.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_cpu_power_throttling.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_cpu_power_throttling.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_disp_sec.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_disp_sec.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_dynamic_loading_throttling.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_dynamic_loading_throttling.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_fpsgo_v3.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_fpsgo_v3.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_gpu_hal.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_gpu_hal.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_gpu_power_throttling.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_gpu_power_throttling.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_gpu_qos.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_gpu_qos.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_gpueb.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_gpueb.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_gpufreq_mt6855.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_gpufreq_mt6855.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_gpufreq_wrapper.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_gpufreq_wrapper.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_heap_debug.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_heap_debug.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_ioctl_powerhal.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_ioctl_powerhal.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_ioctl_touch_boost.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_ioctl_touch_boost.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_irtx_pwm.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_irtx_pwm.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_jpeg.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_jpeg.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_low_battery_throttling.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_low_battery_throttling.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_md_power_throttling.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_md_power_throttling.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_mdpm.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_mdpm.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_pbm.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_pbm.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_peak_power_budget.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_peak_power_budget.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_perf_common.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_perf_common.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_perf_ioctl.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_perf_ioctl.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_qos.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_qos.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_rpmsg_mbox.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_rpmsg_mbox.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_sec_heap.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_sec_heap.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_tinysys_ipi.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_tinysys_ipi.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_u_ether.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_u_ether.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/mtk_usb_f_rndis.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/mtk_usb_f_rndis.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/nova_0flash_mmi_v2.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/nova_0flash_mmi_v2.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/pda_drv_mt6855.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/pda_drv_mt6855.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/perf_common_v.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/perf_common_v.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/pmic_temp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/pmic_temp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/pmsr.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/pmsr.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/powerhal_cpu_ctrl.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/powerhal_cpu_ctrl.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/pvrsrvkm.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/pvrsrvkm.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/qpnp_adaptive_charge.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/qpnp_adaptive_charge.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/reboot-mode.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/reboot-mode.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/rfkill.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/rfkill.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/richtek_spm_cls.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/richtek_spm_cls.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/rps_perf.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/rps_perf.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/scheduler.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/scheduler.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/scp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/scp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/sec.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/sec.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/sec_nfc.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/sec_nfc.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/sensorhub.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/sensorhub.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/sensors_class.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/sensors_class.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/snd-soc-audiodsp-common.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/snd-soc-audiodsp-common.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/snd-soc-aw87390.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/snd-soc-aw87390.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/snd-soc-mt6369.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/snd-soc-mt6369.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/snd-soc-mt6855-afe.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/snd-soc-mt6855-afe.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/snd-soc-mtk-common.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/snd-soc-mtk-common.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/snd-soc-mtk-scp-ultra.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/snd-soc-mtk-scp-ultra.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/snd-soc-rt5512.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/snd-soc-rt5512.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/snd-soc-tfa98xx.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/snd-soc-tfa98xx.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/soc_temp_lvts.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/soc_temp_lvts.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/spmi-mtk-mpu.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/spmi-mtk-mpu.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/sspm_v3.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/sspm_v3.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/sub2af.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/sub2af.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/subaf.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/subaf.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/sx937x_sar.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/sx937x_sar.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/syscon-reboot-mode.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/syscon-reboot-mode.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/task_turbo.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/task_turbo.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/thermal-generic-adc.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/thermal-generic-adc.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/thermal_interface.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/thermal_interface.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/thermal_trace.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/thermal_trace.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/touch_boost.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/touch_boost.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/trace_mmstat.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/trace_mmstat.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/trusted_mem.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/trusted_mem.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/ts_scp_common.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/ts_scp_common.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/tui-common.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/tui-common.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/uload_ind.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/uload_ind.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/utags.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/utags.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/vcp.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/vcp.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/vdec-fmt.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/vdec-fmt.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/videogo.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/videogo.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/vip_engine.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/vip_engine.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/widevine_driver.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/widevine_driver.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/wlan_drv_gen4m_6855.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/wlan_drv_gen4m_6855.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/wmt_chrdev_wifi.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/wmt_chrdev_wifi.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/wmt_drv.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/wmt_drv.ko \
    vendor/motorola/taipei/proprietary/vendor_dlkm/lib/modules/zsmalloc.ko:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/zsmalloc.ko


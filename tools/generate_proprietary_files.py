#!/usr/bin/env python3
"""
generate_proprietary_files.py

Analiza las carpetas extraidas 'extracted/vendor' y 'extracted/vendor_dlkm'
para generar una plantilla 'proprietary-files.txt' estricta y verificada,
organizada por subsistemas de hardware (SoC MT6855 / taipei).
"""

import os
import sys

VENDOR_DIR = "extracted/vendor"
VENDOR_DLKM_DIR = "extracted/vendor_dlkm"

def check_file(base_dir, rel_path):
    full = os.path.join(base_dir, rel_path)
    return os.path.exists(full) or os.path.islink(full)

# Secciones y patrones a incluir
SECTIONS = [
    ("Audio", [
        "bin/hw/android.hardware.audio.service-aidl.mediatek",
        "etc/init/android.hardware.audio.service-aidl.mediatek.rc",
        "lib/hw/audio.primary.mediatek.so",
        "lib64/hw/audio.primary.mediatek.so",
        "lib/hw/audio.r_submix.mediatek.so",
        "lib64/hw/audio.r_submix.mediatek.so",
        "lib/hw/vendor.mediatek.hardware.audio-impl.so",
        "lib64/hw/vendor.mediatek.hardware.audio-impl.so",
        "lib64/hw/android.hardware.audio.effect.aidl-impl-mediatek.so",
        "lib/hw/android.hardware.soundtrigger3-impl.so",
        "lib64/hw/android.hardware.soundtrigger3-impl.so",
        "etc/audio_effects.xml",
        "etc/audio_effects_config.xml",
        "etc/audio_device.xml",
        "etc/audio_em.xml",
        "etc/audio_framework_configuration.xml",
    ]),
    ("Biometrics (Fingerprint Goodix)", [
        "bin/hw/android.hardware.biometrics.fingerprint-service.goodix",
        "etc/init/android.hardware.biometrics.fingerprint-service.goodix.rc",
        "lib64/hw/fingerprint.goodix.default.so",
        "etc/vintf/manifest/manifest_IMoto_AIDL_Fingerprint.xml",
    ]),
    ("Bluetooth", [
        "bin/hw/android.hardware.bluetooth-service-mediatek",
        "bin/hw/android.hardware.bluetooth.finder-service-mediatek",
        "bin/hw/android.hardware.bluetooth.ranging-service-mediatek",
        "etc/init/android.hardware.bluetooth-service-mediatek.rc",
        "lib/hw/android.hardware.bluetooth.audio@2.0-impl.so",
        "lib64/hw/android.hardware.bluetooth.audio@2.0-impl.so",
        "lib/hw/android.hardware.bluetooth.audio@2.1-impl.so",
        "lib64/hw/android.hardware.bluetooth.audio@2.1-impl.so",
        "lib/hw/vendor.mediatek.hardware.bluetooth.audio@2.1-impl.so",
        "lib64/hw/vendor.mediatek.hardware.bluetooth.audio@2.1-impl.so",
        "lib/hw/vendor.mediatek.hardware.bluetooth.audio@2.2-impl.so",
        "lib64/hw/vendor.mediatek.hardware.bluetooth.audio@2.2-impl.so",
        "firmware/BT_FW.cfg",
        "firmware/soc2_2_ram_bt_1b_1_hdr.bin",
        "firmware/soc2_2_ram_bt_1c_1_hdr.bin",
    ]),
    ("Camera (MTK MT6855 ISP6s)", [
        "bin/hw/camerahalserver",
        "bin/hw/mt6855/camerahalserver",
        "etc/init/camerahalserver.rc",
        "lib64/hw/mt6855/android.hardware.camera.provider@2.6-impl-mediatek.so",
        "lib64/hw/mt6855/vendor.mediatek.hardware.camera.ccap@1.0-impl.so",
        "lib64/hw/mt6855/vendor.mediatek.hardware.camera.isphal_aidl@1.0-impl.so",
        "lib64/hw/vendor.mediatek.hardware.camera.atms_aidl@1.0-impl.so",
        "lib64/hw/vendor.mediatek.hardware.camera.bgservice_aidl@1.0-impl.so",
        "etc/vintf/manifest/manifest_cameraprovider.xml",
        "etc/vintf/manifest/manifest_isphal.xml",
    ]),
    ("Display, Graphics & EGL (PowerVR Rogue MT6855)", [
        "bin/hw/android.hardware.graphics.composer@3.2-service",
        "bin/hw/android.hardware.graphics.composer@3.3-service",
        "bin/hw/android.hardware.graphics.composer@3.4-service",
        "bin/hw/android.hardware.graphics.allocator-V2-service-mediatek",
        "bin/hw/android.hardware.graphics.allocator-V2-service-mediatek.mt6855",
        "bin/hw/mt6855/android.hardware.graphics.allocator-V2-service-mediatek.mt6855",
        "etc/init/android.hardware.graphics.composer@3.2-service.rc",
        "etc/init/android.hardware.graphics.allocator-V2-service-mediatek.rc",
        "lib/hw/mt6855/mapper.powervr.so",
        "lib64/hw/mt6855/mapper.powervr.so",
        "lib/hw/mt6855/libpvr_mapper_utils.so",
        "lib64/hw/mt6855/libpvr_mapper_utils.so",
        "lib/hw/mt6855/vulkan.mtk.so",
        "lib64/hw/mt6855/vulkan.mtk.so",
        "lib/hw/mt6855/vendor.mediatek.hardware.pq_aidl-impl.so",
        "lib64/hw/mt6855/vendor.mediatek.hardware.pq_aidl-impl.so",
        "lib/hw/hwcomposer.mtk_common.so",
        "lib64/hw/hwcomposer.mtk_common.so",
        "lib/egl/egl.cfg",
        "lib/egl/mt6855/libEGL_mtk.so",
        "lib64/egl/mt6855/libEGL_mtk.so",
        "lib/egl/mt6855/libGLESv1_CM_mtk.so",
        "lib64/egl/mt6855/libGLESv1_CM_mtk.so",
        "lib/egl/mt6855/libGLESv2_mtk.so",
        "lib64/egl/mt6855/libGLESv2_mtk.so",
        "firmware/rgx.fw",
        "firmware/rgx.sh",
        "etc/vintf/manifest/manifest_hwcomposer.xml",
        "etc/vintf/manifest/manifest_gralloc.xml",
    ]),
    ("Motorola Custom Services & Sensors", [
        "bin/hw/com.motorola.hardware.display.panel-service",
        "bin/hw/com.motorola.hardware.display.touch-service",
        "bin/hw/motorola.hardware.fdr-service",
        "bin/hw/motorola.hardware.health-service",
        "bin/hw/motorola.hardware.health.storage-service",
        "bin/hw/motorola.hardware.sarwifi-srv",
        "etc/init/com.motorola.hardware.display.panel-service.rc",
        "etc/init/com.motorola.hardware.display.touch-service.rc",
        "etc/init/motorola.hardware.fdr.service.rc",
        "etc/init/motorola.hardware.health.service.rc",
        "etc/init/motorola.hardware.health.storage.service.rc",
        "etc/init/sarwifi-default.rc",
    ]),
    ("Gatekeeper & Keymint (Trustonic TEE)", [
        "bin/hw/android.hardware.gatekeeper-service.trustonic",
        "bin/hw/android.hardware.security.keymint@3.0-service.trustonic",
        "bin/hw/vendor.trustonic.tee-service",
        "bin/hw/vendor.trustonic.alps.alps_device@1.1-service",
        "etc/init/trustonic.rc",
        "etc/init/tee.rc",
        "etc/init/vendor.trustonic.tee-service.rc",
    ]),
    ("GNSS / GPS", [
        "bin/hw/android.hardware.gnss-service.mediatek",
        "bin/hw/vendor.mediatek.hardware.gnss-service",
        "etc/init/mtk_gnss.rc",
        "lib64/hw/android.hardware.gnss-impl-mediatek.so",
        "lib64/hw/vendor.mediatek.hardware.gnss-impl.so",
        "lib64/hw/vendor.mediatek.hardware.gnss.batching-impl.so",
    ]),
    ("Lights & Vibrator", [
        "bin/hw/android.hardware.lights-service.mediatek",
        "bin/hw/android.hardware.vibrator-service.mediatek",
        "etc/init/lights-mtk-default.rc",
        "etc/init/vibrator-mtk-default.rc",
        "lib/hw/vibrator.default.so",
        "lib64/hw/vibrator.default.so",
    ]),
    ("Media Codecs", [
        "bin/hw/android.hardware.media.c2-mediatek",
        "bin/hw/android.hardware.media.c2-mediatek-64b",
        "bin/hw/android.hardware.media.omx@1.0-service",
        "etc/init/android.hardware.media.c2-mediatek-64b.rc",
        "etc/init/android.hardware.media.c2-mediatek.rc",
        "etc/media_codecs_c2.xml",
        "etc/media_codecs_performance_c2.xml",
        "etc/media_codecs.xml",
        "etc/media_profiles_V1_0.xml",
    ]),
    ("NFC (Samsung S3NRN4V)", [
        "bin/hw/android.hardware.nfc-service.sec",
        "etc/init/nfc-service-sec.rc",
        "firmware/sec_s3nrn4v_firmware.bin",
    ]),
    ("Power & Thermal", [
        "bin/hw/android.hardware.thermal-service.mediatek",
        "bin/hw/vendor.mediatek.hardware.mtkpower-service.mediatek",
        "bin/hw/vendor.mediatek.hardware.mtkpower_applist-service.mediatek",
        "etc/init/thermal-mediatek.rc",
        "etc/init/vendor.mediatek.hardware.mtkpower@1.0-service.rc",
        "lib/hw/vendor.mediatek.hardware.mtkpower-aidl-impl.so",
        "lib64/hw/vendor.mediatek.hardware.mtkpower-aidl-impl.so",
        "lib/hw/thermal_hal.so",
        "lib64/hw/thermal_hal.so",
    ]),
    ("Radio, RIL & Modem", [
        "bin/hw/mtkfusionrild",
        "etc/init/mtkrild.rc",
        "bin/ccci_mdinit",
        "bin/ccci_rpcd",
        "bin/gsm0710muxd",
        "etc/init/init.cccimdinit.rc",
        "etc/init/init.cccirpcd.rc",
        "etc/init/gsm0710muxd.rc",
    ]),
    ("Sensors & SCP", [
        "bin/hw/android.hardware.sensors-service.multihal",
        "bin/hw/android.hardware.contexthub-service.tinysys",
        "etc/init/android.hardware.sensors-service.multihal.rc",
        "lib64/hw/android.hardware.sensors@2.X-subhal-mediatek.so",
        "lib/hw/sensors.mediatek.V2.0.so",
        "lib64/hw/sensors.mediatek.V2.0.so",
        "etc/sensors/hals.conf",
        "firmware/remoteproc_scp",
    ]),
    ("Touchscreen Firmware", [
        "firmware/focaltech_ts_fw_csot.bin",
        "firmware/focaltech_ts_fw_csot_ft8725.bin",
        "firmware/ILITEK_FW",
        "firmware/novatek_ts_fw.bin",
        "firmware/novatek_ts_mp.bin",
        "firmware/NT36xxx_MP_Setting_Criteria_606B.csv",
        "etc/vintf/manifest/manifest_touch.xml",
    ]),
    ("USB", [
        "bin/hw/android.hardware.usb-aidl-service.mediatek",
        "bin/hw/android.hardware.usb.gadget-aidl-service.mediatek",
        "etc/init/android.hardware.usb-aidl-service.mediatek.rc",
        "etc/init/android.hardware.usb.gadget-aidl-service.mediatek.rc",
    ]),
    ("Wi-Fi & Connectivity", [
        "bin/hw/android.hardware.wifi-service-lazy",
        "bin/hw/hostapd",
        "bin/hw/wpa_supplicant",
        "etc/init/android.hardware.wifi-service-lazy.rc",
        "etc/init/hostapd.android.rc",
        "firmware/WIFI_RAM_CODE_soc2_2_1b_1.bin",
        "firmware/WIFI_RAM_CODE_soc2_2_1c_1.bin",
        "firmware/soc2_2_ram_wifi_1b_1_hdr.bin",
        "firmware/soc2_2_ram_wifi_1c_1_hdr.bin",
        "firmware/wifi.cfg",
        "firmware/WMT_SOC.cfg",
        "etc/wifi/p2p_supplicant_overlay.conf",
        "etc/wifi/wpa_supplicant.conf",
        "etc/wifi/wpa_supplicant_overlay.conf",
    ]),
]

def main():
    lines = []
    lines.append("# Proprietary files list for Motorola Moto G55 5G (taipei / XT2435-1)")
    lines.append("# Source firmware: W1UTS36.51-39-4 (Android 16 / SDK 36)")
    lines.append("# Generated from verified stock images (vendor & vendor_dlkm)")
    lines.append("# DO NOT hand-edit unverified entries. Every listed file was checked against stock images.")
    lines.append("")

    # Vendor files
    for section_name, file_list in SECTIONS:
        lines.append(f"# {section_name}")
        for rel in file_list:
            if check_file(VENDOR_DIR, rel):
                lines.append(f"vendor/{rel}")
            else:
                # Si no existe, no lo inventamos, pero lo dejamos documentado
                pass
        lines.append("")

    # Vendor DLKM modules
    lines.append("# Kernel Modules (vendor_dlkm)")
    if os.path.exists(os.path.join(VENDOR_DLKM_DIR, "lib/modules")):
        modules = sorted(os.listdir(os.path.join(VENDOR_DLKM_DIR, "lib/modules")))
        for m in modules:
            if m.endswith(".ko"):
                lines.append(f"vendor_dlkm/lib/modules/{m}")
        lines.append("")

    content = "\n".join(lines) + "\n"

    # Write to target files
    targets = [
        "research/taipei/proprietary-files.txt",
        "device/motorola/taipei/proprietary-files.txt"
    ]
    for t in targets:
        os.makedirs(os.path.dirname(t), exist_ok=True)
        with open(t, "w") as f:
            f.write(content)
        print(f"Generated: {t} ({len(lines)} lines)")

if __name__ == "__main__":
    main()

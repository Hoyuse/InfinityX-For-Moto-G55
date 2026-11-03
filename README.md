# Project Infinity-X for Motorola Moto G55 5G (`taipei`)

[![Android Version](https://img.shields.io/badge/Android-16-green.svg)](https://source.android.com/)
[![Infinity-X Version](https://img.shields.io/badge/Project%20Infinity--X-3.12-blue.svg)](https://infinity-x.org/)
[![Target SoC](https://img.shields.io/badge/SoC-MediaTek%20Dimensity%207025%20(MT6855)-orange.svg)](https://www.mediatek.com/)
[![License](https://img.shields.io/badge/License-Apache%202.0%20%2F%20GPL%20v2-lightgrey.svg)](LICENSE)

Unofficial Project Infinity-X (Android 16 / SDK 36) bringup and device tree adaptation for the **Motorola Moto G55 5G** (Codename: `taipei` / Model: `XT2435-1`).

---

## 📱 Device Specifications

| Feature | Specification |
| :--- | :--- |
| **Model** | Motorola Moto G55 5G (`XT2435-1`) |
| **Codename** | `taipei` / `taipei_g_sys` |
| **Chipset** | MediaTek MT6855 (Dimensity 7025) |
| **CPU** | 2x 2.5 GHz ARM Cortex-A78 + 6x 2.0 GHz ARM Cortex-A55 |
| **GPU** | Imagination Technologies PowerVR B-Series BXM-8-256 |
| **Display** | 1080 x 2400 (400 dpi), 120Hz IPS LCD |
| **Stock Firmware Baseline** | `W1UTS36.51-39-4` (Android 16 / SDK 36) |
| **Kernel Version** | 6.12.58-android16-6 (GKI baseline `android16-6.12-2025-12`) |
| **Partition Scheme** | Virtual A/B (Retrofit Dynamic Partitions, Super EROFS) |

---

## 📂 Repository Structure

```text
├── device/motorola/taipei/          # Android 16 device tree
│   ├── prebuilt/                    # Stock GKI 6.12.58 kernel, DTB (MT6855), DTBO
│   ├── rootdir/                     # first_stage_ramdisk fstab.mt6855 & init scripts
│   ├── sepolicy/vendor/             # SELinux contexts and taipei_types.te
│   ├── vintf/                       # Hardware interface manifests (Camera, Graphics, Touch, Fingerprint)
│   ├── AndroidProducts.mk           # Target product definition (infinity_taipei)
│   ├── BoardConfig.mk               # Architecture, partition sizes, GKI prebuilts, flags
│   ├── device.mk                    # Hardware feature flags, permissions, copy rules
│   └── infinity_taipei.mk           # Infinity-X ROM inheritance & build fingerprints
├── vendor/motorola/taipei/          # Proprietary vendor blobs and makefiles
│   ├── proprietary/                 # 353 extracted and verified hardware blobs & modules
│   ├── BoardConfigVendor.mk         # Vendor board configuration
│   └── taipei-vendor.mk             # Automated copy rules for HALs & vendor_dlkm (.ko)
├── research/                        # Porting status, DTS decompilations, and hardware logs
│   ├── taipei/                      # Stock extracted fstab, modules.load, vendor.dts, file lists
│   └── cancunf/                     # Reference Moto G54 (cancunf) DTB & DTS comparisons
├── tools/                           # Helper scripts
│   ├── dump_fdt_properties.py       # Device Tree property inspector
│   ├── generate_proprietary_files.py # Blob extraction list generator
│   └── sync_rom.sh                  # Project Infinity-X repository sync script
└── AGENT.md                         # Detailed project log, technical roadmap & build verification
```

---

## 🛠️ Build Status & Validation

- **Soong Build Engine**: Verified & passing (`build.infinity_taipei.ninja` generated).
- **Kati Makefile Parser**: Verified with zero target conflicts.
- **Ninja Dry Run**: Verified clean (`m nothing` completed successfully).
- **Target Target**: `infinity_taipei-userdebug` (`Project_Infinity-X-3.12-taipei-GAPPS-UNOFFICIAL`).

---

## 🚀 How to Build

### 1. Initialize & Sync Infinity-X Android 16
```bash
mkdir infinity-16 && cd infinity-16
repo init -u https://github.com/Project-Infinity-X/manifest -b 16 --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### 2. Clone Device and Vendor Trees
Clone this repository directly into your source root or symlink:
```bash
git clone https://github.com/Hoyuse/InfinityX-For-Moto-G55.git device/motorola/taipei
# (or place the device and vendor folders inside device/motorola/taipei and vendor/motorola/taipei)
```

### 3. Setup Environment & Compile
```bash
source build/envsetup.sh
lunch infinity_taipei-userdebug
m bacon -j$(nproc --all)
```

---

## 🤝 Credits & Acknowledgements

- **[Project Infinity-X Team](https://github.com/Project-Infinity-X)** for the ROM source.
- **[LineageOS Project](https://github.com/LineageOS)** for AOSP device trees and hardware interfaces.
- **Motorola Mobility LLC** for stock firmware baseline and hardware drivers.
- Maintained and ported by **[Hoyuse](https://github.com/Hoyuse)**.

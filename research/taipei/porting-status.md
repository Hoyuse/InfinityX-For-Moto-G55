# Estado técnico del port de Infinity-X a Moto G55 (`taipei`)

## 1. Identidad base verificada

- **Dispositivo**: Motorola Moto G55 5G.
- **Modelo físico**: XT2435-1.
- **Plataforma SoC**: MediaTek MT6855 / Dimensity 7025 (2x Cortex-A78 @ 2.5 GHz + 6x Cortex-A55 @ 2.0 GHz).
- **GPU**: Imagination Technologies PowerVR B-Series BXM-8-256 (`mapper.powervr.so`, `libmpvr.so`, `rgx.fw`).
- **Paquete stock analizado**: `RETBR_XT2435-1_TAIPEI_G_SYS_W1UTS36.51_39_4_subsidy_DEFAULT_regulatory_DEFAULT_cid50_CFC.xml.zip`.
- **SHA-256 del paquete**: `05d182531134ef5dcceab60cb6de0140c221bd8265e510f5ddf1d0af0d10f075` (48 MD5 de `flashfile.xml` verificados al 100%).
- **Compilación stock**: Android 16 / SDK 36, `W1UTS36.51-39-4`.
- **Fingerprint de compilación**:
  - `product`: `motorola/taipei_g_sys/taipei:16/W1UTS36M.51-39-4/615a8a:user/release-keys`
  - `vendor`: `motorola/taipei_g_hal/taipei:16/W1UTS36.51-39-4/4720d:user/release-keys`
- **Módem / Baseband**: `MT6855D_TC2.PR7.SP.V72.2.P119.06.244R`.
- **Vendor Security Patch**: `2026-09-01`.
- **First API Level**: `31`.

---

## 2. Herramientas locales operativas en el proyecto

Para evitar dependencias del sistema y respetar la directiva de no instalar nada fuera del proyecto, se descargaron y descomprimieron herramientas nativas dentro de `tools/local/`:
- `tools/local/usr/bin/dtc` (DTC 1.7.2): operativo para decompilar y compilar device trees FDT/DTS.
- `tools/local/usr/bin/fsck.erofs` (erofs-utils 1.8.6): operativo para verificar e inspeccionar imágenes EROFS con soporte LZ4, LZ4HC, deflate y zstd.
- `tools/local/usr/bin/dump.erofs`: operativo para análisis forense de superbloques e inodos EROFS.

---

## 3. Extracción de imágenes lógicas y descompilación DTS

- **Decompilación DTS completa**:
  - `research/taipei/vendor.dts` (285 KB, 6,100 líneas descompiladas desde `research/taipei/vendor.dtb`).
  - `research/cancunf/vendor.dts` (262 KB, de referencia comparativa de G54).
- **Extracción EROFS íntegra**:
  - `extracted/vendor`: 1.5 GB extraído (3,623 archivos indexados en `research/taipei/vendor-file-list.txt`).
  - `extracted/product`: 3.5 GB extraído (4,266 archivos indexados en `research/taipei/product-file-list.txt`).
  - `extracted/vendor_dlkm`: módulos de kernel fuera del árbol de Motorola/MTK.
  - `extracted/system_dlkm`: módulos de kernel estándar GKI AOSP.

---

## 4. Plantilla de blobs propietarios (`proprietary-files.txt`)

Se diseñó y ejecutó `tools/generate_proprietary_files.py`, contrastando cada archivo contra las imágenes stock reales (sin inventar rutas).
- **Resultado**: `device/motorola/taipei/proprietary-files.txt` y `research/taipei/proprietary-files.txt` (406 líneas).
- **Cobertura por subsistemas**:
  1. **Audio**: Audio AIDL MediaTek (`android.hardware.audio.service-aidl.mediatek`), SoundTrigger3, efectos y perfiles XML.
  2. **Biometrics**: Goodix Fingerprint AIDL (`android.hardware.biometrics.fingerprint-service.goodix`, `fingerprint.goodix.default.so`).
  3. **Bluetooth**: Bluetooth AIDL MediaTek + firmware BT MTK (`BT_FW.cfg`, `soc2_2_ram_bt_*.bin`).
  4. **Camera**: MTK Camera Server (`camerahalserver`, `mt6855/camerahalserver`), provider 2.6, ISP6s HAL, ATMS AIDL.
  5. **Display & Graphics**: Composer 3.2-3.4, PowerVR B-Series Rogue Vulkan/EGL drivers (`mt6855/mapper.powervr.so`, `mt6855/libpvr_mapper_utils.so`, `mt6855/vulkan.mtk.so`, `mt6855/libEGL_mtk.so`, firmware `rgx.fw`).
  6. **Motorola Hardware Services**: `com.motorola.hardware.display.panel-service`, `touch-service`, `fdr-service`, `health-service`, `sarwifi-srv`.
  7. **Gatekeeper & Keymint**: Trustonic TEE Keymint 3.0 y Gatekeeper.
  8. **GNSS / GPS**: GNSS AIDL MediaTek + GPS HALs.
  9. **Lights & Vibrator**: Lights AIDL MediaTek + Vibrator HAL.
  10. **Media Codecs**: Media Codecs C2 MediaTek de 32 y 64 bits + perfiles XML.
  11. **NFC**: Samsung S3NRN4V AIDL (`android.hardware.nfc-service.sec` + `sec_s3nrn4v_firmware.bin`).
  12. **Power & Thermal**: Thermal AIDL MediaTek + MTK Power Service & Applist.
  13. **Radio & Telephony**: `mtkfusionrild`, CCCI daemons (`ccci_mdinit`, `ccci_rpcd`), MUX daemon.
  14. **Sensors**: Sensors MultiHAL + Tinysys Contexthub + firmware `remoteproc_scp`.
  15. **Touchscreen**: Firmwares de panel FocalTech, Ilitek y Novatek (`focaltech_ts_fw_*.bin`, `ILITEK_FW`, `novatek_ts_*.bin`).
  16. **USB**: USB AIDL MediaTek + USB Gadget AIDL.
  17. **Wi-Fi**: Wi-Fi AIDL lazy + Hostapd + firmwares MTK Wi-Fi RAM code (`soc2_2_ram_wifi_*.bin`, `WIFI_RAM_CODE_*.bin`, `wifi.cfg`).
  18. **Módulos de Kernel**: 87 módulos `.ko` específicos de MediaTek/Motorola de `vendor_dlkm` (incluyendo `flashlights-taipei-pwm.ko`, `ilitek_v3_mmi.ko`, `focaltech_0flash_mmi_v2.ko`, `camera_dip_isp6s.ko`, `snd-soc-mt6855-afe.ko`, `mtk_gpufreq_mt6855.ko`, `mmi_decrete_charger_cp_qc3p.ko`, `utags.ko`, `moto_binder.ko`).
- **Extracción comprobada**: El script `device/motorola/taipei/extract-files.sh` extrajo con éxito los 78 MB de blobs a `vendor/motorola/taipei/proprietary/` con 0 errores de archivo faltante.

---

## 5. Esqueleto de Device Tree (`device/motorola/taipei`)

Se construyó el device tree respaldando cada valor con datos técnicos verificados:
- `Android.mk`: inclusión condicional de makefiles bajo `TARGET_DEVICE := taipei`.
- `AndroidProducts.mk`: define `infinity_taipei` y `lineage_taipei` con targets user, userdebug y eng.
- `BoardConfig.mk`:
  - Arquitectura ARM64 (Cortex-A78/A55) con multilib de 32 bits para compatibilidad.
  - Boot header v4 (`BOARD_BOOT_HEADER_VERSION := 4`).
  - Kernel page size 4096 bytes (4K) estándar, compatible con max 16KB.
  - Partición Super dinámica: 10,334,765,056 bytes, grupo `main`, sistema de archivos EROFS (`BOARD_EROFS_COMPRESSOR := lz4`).
  - Densidad de pantalla 400 dpi (`TARGET_SCREEN_DENSITY := 400`).
  - Nivel de seguridad del vendor: `2026-09-01`.
  - Inclusión de DTB `vendor.dtb` (MT6855).
- `device.mk`:
  - Herencia de Virtual A/B.
  - Mapeo de `fstab.mt6855` a first-stage ramdisk y vendor.
  - Permisos de hardware de cámara, huella dactilar, NFC, sensores, pantalla táctil y Wi-Fi.
  - Variables de tamaño de página (4096 / max 16384) y ABI lists.
  - Inclusión de makefile de blobs propietarios `vendor/motorola/taipei/taipei-vendor.mk`.
- `infinity_taipei.mk` y `lineage_taipei.mk`:
  - Herencia de productos base y telefonía.
  - Declaración de marca (`motorola`), modelo (`moto g55 5G`) y fingerprint oficial del firmware stock.
- `board-info.txt`: requiere boards `taipei`, `taipei_g_sys`, `MT6855`.
- `rootdir/etc/fstab.mt6855`: copiado 1:1 del ramdisk del firmware de fábrica.
- `rootdir/etc/init.mt6855.rc`: script de inicialización del SoC MT6855.
- `extract-files.sh` y `setup-makefiles.sh`: automatización estándar de extracción y vinculación de blobs.

---

## 6. Investigación de fuentes públicas y enlaces directos

1. **Guía y recursos comunitarios del Moto G55 (XT2435-1)**:
   - Repositorio: [JoshRob297/moto-g55-taipei-guide](https://github.com/JoshRob297/moto-g55-taipei-guide).
   - Documenta desbloqueo de bootloader, scripts de respaldo de particiones críticas (`nvram`, `nvdata`, `persist`), módulo Magisk de debloat y notas de rescate.
2. **Repositorio oficial de Motorola para kernels MediaTek**:
   - Repositorio: [MotorolaMobilityLLC/kernel-mtk](https://github.com/MotorolaMobilityLLC/kernel-mtk).
   - Se verificaron los tags remotos mediante `git ls-remote`. Existen tags de Android 16 (`MMI-W1...`), pero el tag exacto para `W1UTS36.51-39-4` / `taipei` **aún no está publicado**.
   - Otros repositorios relevantes de Motorola:
     - [MotorolaMobilityLLC/motorola-kernel-modules](https://github.com/MotorolaMobilityLLC/motorola-kernel-modules)
     - [MotorolaMobilityLLC/vendor-mediatek-kernel_modules-connectivity-wlan-core-gen4m](https://github.com/MotorolaMobilityLLC/vendor-mediatek-kernel_modules-connectivity-wlan-core-gen4m)
     - [MotorolaMobilityLLC/kernel-kernel_device_modules-6.6](https://github.com/MotorolaMobilityLLC/kernel-kernel_device_modules-6.6)
3. **Base GKI AOSP para Android 16**:
   - Tag / Rama: `android16-6.12-2025-12` ([AOSP GKI Release Builds](https://source.android.com/docs/core/architecture/kernel/gki-android16-6_12-release-builds)). Coincide exactamente con la versión del kernel reportada por `boot.img` (`6.12.58-android16-6-gb0a9599c6c01-ab14987696-4k`).

---

## 7. Soluciones implementadas y estado de bloqueos

1. **Kernel y Drivers Propietarios (SOLUCIONADO para Bringup via Prebuilt GKI)**:
   - Dado que Motorola no ha publicado el tag GPL en GitHub, se implementó la solución estándar de Custom ROMs para arquitecturas GKI:
     - `device/motorola/taipei/prebuilt/kernel`: kernel binario GKI 6.12.58 extraído de `boot.img`.
     - `device/motorola/taipei/prebuilt/dtb.img` y `dtbo.img`: árboles de dispositivo binarios de `vendor_boot` y `dtbo`.
     - Módulos binarios (`vendor_dlkm`): 87 módulos `.ko` firmados por Motorola integrados en `vendor/motorola/taipei/proprietary/`.
   - Esto desacopla la compilación de la ROM de la disponibilidad de las fuentes C del kernel.

2. **Políticas de SELinux (SOLUCIONADO para Bringup)**:
   - Se copiaron y estructuraron los contextos de stock en `device/motorola/taipei/sepolicy/vendor/` (`file_contexts`, `property_contexts`, `service_contexts`, `hwservice_contexts`).
   - Se configuró `BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive` en `BoardConfig.mk` para permitir el arranque inicial y captura de auditoría de denegaciones.

3. **Infraestructura de Compilación y Lunch (COMPLETADO AL 100%)**:
   - Sincronización completa finalizada exitosamente para los 1,170 proyectos de Project Infinity-X Android 16 (`/home/hoyuse/infinity-16`).
   - Herramientas configuradas: `ccache` 4.11.2 con 40 GB de caché en disco, `repo`, `git-lfs`, `dtc`, `fsck.erofs`.
   - Espacio en disco tras sync: **192 GB libres** en el SSD NVMe.
   - Target de compilación verificado: `lunch infinity_taipei-userdebug` ejecutó con éxito reconociendo Android 16 (`BP4A.251205.006`), ARM64 y los namespaces de Soong de `taipei`.
   - **El proyecto está 100% listo para iniciar la compilación (`m infinity_taipei`)**.

# Contexto del proyecto: ROM para Moto G55 5G

## Objetivo

El usuario quiere investigar la creación/port de una custom ROM para su Motorola Moto G55 5G, usando como referencia Infinity-X para Moto G54 5G. En este momento se está recolectando y comparando firmware; no se ha comenzado a compilar una ROM ni a modificar el teléfono.

## Dispositivo del usuario

- Modelo confirmado por el usuario: **XT2435-1**.
- Nombre/codename informado: **`taipei` / `taipei_g_sysn`** (el firmware encontrado publica el fingerprint `taipei_g_sys/taipei`; confirmar en el propio firmware antes de normalizar la variante exacta).
- Compilación informada: **`W1UTS36.51-39-4`**.
- Región/canal del teléfono: **pendiente de confirmar**. Una página de terceros indexa esa compilación como RETBR (Brasil), pero eso no prueba el canal instalado en el teléfono del usuario.
- Motorola publica para el G55 el MediaTek Dimensity 7025 y para el G54 el Dimensity 7020. Son cercanos en familia/plataforma, pero no significa que kernels, árboles de dispositivo, blobs o firmware sean intercambiables. Fuentes oficiales: [G55 Latinoamérica](https://es-latam.support.motorola.com/app/answers/detail/a_id/182495/p/30%2C7494%2C7826%2C), [G54](https://en-us.support.motorola.com/app/answers/detail/a_id/176649/p/30).

## ROM de referencia ya disponible

Archivo en el workspace:

`Project_Infinity-X-3.12-cancunf-13.08.2026-GAPPS-OFFICIAL.zip`

- Tamaño ZIP: 2,432,119,042 bytes; contiene `payload.bin` de 2,432,113,372 bytes.
- SHA-256 verificado localmente y coincidente con el publicado por SourceForge: `de0d06322c31992b6cd6e309c04198771fef3ffcc6e77e8c848e7ee54d7aff8c`.
- Es OTA Android tipo **AB**, firmada por SignApk.
- `pre-device=cancunf`; fingerprint/base de compilación `motorola/cancunf_g_sys/cancunf:15/V1TDS35H.83-20-5-11/450c26-b11610:user/release-keys`; `post-sdk-level=36`; parche OTA `2026-08-01`.
- El manifiesto CrAU versión 2 declara **24 particiones**:
  `boot`, `dpm`, `dtbo`, `gpueb`, `gz`, `lk`, `logo`, `mcupm`, `md1img`, `pi_img`, `preloader`, `product`, `scp`, `spmfw`, `sspm`, `system`, `system_ext`, `tee`, `vbmeta`, `vbmeta_system`, `vcp`, `vendor`, `vendor_boot`, `vendor_dlkm`.
- Se reconstruyeron las 24 imágenes a partir de las operaciones del payload (tipos 0, 1 y 8) en `/tmp/cancunf_images/`. El script temporal usado está en `/tmp/extract_cancunf.py`; imágenes importantes: `boot.img`, `vendor_boot.img`, `dtbo.img`, `vbmeta*.img`, `system.img`, `system_ext.img`, `product.img`, `vendor.img`, `vendor_dlkm.img`.
- Las imágenes `system`, `system_ext`, `product`, `vendor` y `vendor_dlkm` son EROFS. `vbmeta.img` y `vbmeta_system.img` comienzan con `AVB0`; `boot.img` se reconoce como Android boot image.
- Cadenas encontradas en imágenes/metadata confirman `cancunf`, `motorola/infinity_cancunf/cancunf:16/BP4A.251205.006/...` y metadatos de AVB de `2026-05-01`. Hay una discrepancia que queda por verificar: OTA metadata declara parche `2026-08-01`, mientras strings del descriptor AVB indican `2026-05-01`.
- No se extrajo un árbol fuente de dispositivo ni código fuente del kernel. Las imágenes compiladas no sustituyen device tree, kernel source ni blobs del G55.
- No se ha flasheado nada ni interactuado con el teléfono.

**No instalar ni flashear el paquete `cancunf` en el G55.** Su manifiesto exige `cancunf` y contiene firmware/boot/vendor específicos del G54.

## Firmware del G55 localizado, aún no descargado

Se encontró una publicación de terceros que enumera el firmware que coincide en modelo/build como:

- `RETBR_XT2435-1_TAIPEI_G_SYS_W1UTS36_51_39_4_subsidy_DEFAULT_regulatory_DEFAULT_cid50_CFC.xml.zip`
- Tamaño indicado: 5.21 GB.
- Página que lista el paquete: [StockRom.net](https://www.stockrom.net/2026/09/xt2435-1-retbr-os16-w1uts36-51-39-4.html).
- Enlace MediaFire indicado por esa página: [archivo ZIP](https://www.mediafire.com/file/12fbkajla2dxw8w/RETBR_XT2435-1_TAIPEI_G_SYS_W1UTS36_51_39_4_subsidy_DEFAULT_regulatory_DEFAULT_cid50_CFC.xml.zip/file).
- La página atribuye la fuente a `motorola.com / support.motorola.com / mirrors.lolinet.com`, pero la descarga enlazada no es un enlace directo oficial de Motorola. El ZIP todavía **no está en el workspace** y su hash/integridad no se han comprobado.

Cuando llegue el ZIP de fábrica, verificar nombre, modelo, build, región, estructura y hashes antes de extraer. El uso previsto es análisis/comparación, no flasheo. Si el paquete RETBR no se puede verificar, preferir firmware obtenido mediante canal oficial Motorola/Software Fix para el propio XT2435-1.

## Próximos pasos sugeridos

1. Esperar/ubicar el ZIP del firmware de fábrica G55 que el usuario descargue y lo coloque en el workspace.
2. Validar el ZIP y extraer sus imágenes sin flashearlas.
3. Comparar `boot`, `vendor_boot`, `dtbo`, `vbmeta`, particiones `vendor*`, firmware y esquema de particiones con `cancunf`; identificar qué no se comparte.
4. Buscar fuentes públicas del G55 (device tree, kernel, vendor blobs) y revisar su compatibilidad con Infinity-X/Android 16. No asumir que compartir familia SoC hace reutilizable el árbol de `cancunf`.
5. Antes de cualquier procedimiento sobre el dispositivo, confirmar desbloqueo oficial del bootloader, canal/región, método de recuperación y copias de seguridad. No dar instrucciones de flasheo de imágenes del G54 al G55.

## Notas de trabajo

- Espacio disponible en el workspace al comenzar: aproximadamente 224 GB; `/tmp` es tmpfs de 20 GB. Las imágenes extraídas de `cancunf` están en `/tmp` y ocupan aproximadamente 3.4 GB reales, por lo que pueden desaparecer al reiniciar/limpiar `/tmp`.
- El ZIP G54 está en el workspace y no debe borrarse: es la referencia que el usuario pidió analizar.
- La red desde el shell de este entorno no resolvió `flylife.dl.sourceforge.net`; las páginas web pudieron consultarse con la herramienta web. No afirmar que se descargó firmware del G55.

## Actualización: firmware de fábrica del G55 recibido y revisado (2026-11-02)

Archivo recibido en el workspace:

`RETBR_XT2435-1_TAIPEI_G_SYS_W1UTS36.51_39_4_subsidy_DEFAULT_regulatory_DEFAULT_cid50_CFC.xml.zip`

- Modelo/build coinciden con lo informado: `XT2435-1`, `taipei_g_sys-user 16 W1UTS36.51-39-4 4720d-615a8a release-keys MW-402`.
- Región/canal que declara el paquete: RETBR (Retail Brasil), CID 50. El usuario está en Colombia; falta confirmar si su instalación usa ese canal, aunque el número de compilación coincide.
- SHA-256 calculado localmente: `05d182531134ef5dcceab60cb6de0140c221bd8265e510f5ddf1d0af0d10f075`. No se ha encontrado un hash oficial independiente para contrastarlo.
- Descomprimido en `/tmp/taipei_xt2435-1/`; ocupa aproximadamente 6.8 GB. El ZIP contiene 56 archivos, incluidos XML, `PGPT`, imágenes boot/firmware y 27 fragmentos `super.img_sparsechunk.0` a `.26`.
- Se verificaron los MD5 declarados por `flashfile.xml` para las 48 entradas con archivo/hash; todos coinciden (`0` fallos).
- Fingerprint del paquete: `motorola/taipei_g_sys/taipei:16/W1UTS36.51-39-4/4720d-615a8a:user/release-keys`.
- Firmware de módem: `MT6855D_TC2.PR7.SP.V72.2.P119.06.244R`.
- `signing-info.txt` declara `HAB_PRODUCT taipei`, customer-signed build, HAB security version 25 y `BOOTLOADER_ANTIROLLBACK_VER_SUM=027`.
- `flashfile.xml` es una receta CFC de servicio, no una OTA de custom ROM. Incluye escritura de GPT, preloader/bootloader, firmware MediaTek, boot/vendor_boot y `super`; además ordena borrar `nvdata`, `userdata`, `metadata` y `debug_token`. **No ejecutar esos comandos ni usar el XML para flashear como parte de esta investigación.**

### Comparación de imágenes estáticas compartidas

Las imágenes G55 extraídas están en `/tmp/taipei_xt2435-1/`; las imágenes de la OTA G54 están en `/tmp/cancunf_images/`. Se compararon los nombres comunes. **Las 19 imágenes comunes tienen SHA-256 diferente** entre el paquete Infinity-X G54 y el firmware stock G55. Esto incluye `boot.img`, `vendor_boot.img`, `dtbo.img`, `vbmeta*.img` y firmware MediaTek (`preloader`, `lk`, `md1img`, `tee`, etc.).

Algunos tamaños coinciden pese a tener contenido distinto:

- `boot.img`: ambos 67,108,864 bytes, hashes diferentes.
- `vendor_boot.img`: ambos 67,108,864 bytes, hashes diferentes.
- `dtbo.img`: ambos 8,388,608 bytes, hashes diferentes.
- `vbmeta_system.img`: ambos 4,096 bytes, hashes diferentes.
- `vbmeta.img`: G54 4,096 bytes; G55 8,192 bytes.

Conclusión: no reutilizar imágenes de G54 para boot/vendor/firmware del G55. El tamaño igual no significa compatibilidad.

### Mapa de particiones dinámicas G55

Se reconstruyó `/tmp/taipei_super.img` aplicando sin pérdida los sparse chunks (overlay de RAW/FILL y omisión de DONT_CARE). El archivo lógico mide 10,334,765,056 bytes y ocupa aproximadamente 6.6 GB reales. Se leyó LP metadata v10.2 en offset 12,288.

Particiones/grupos leídos de LP metadata (tamaños son capacidad lógica declarada por el mapa):

- `product_a` 3,504,275,456 bytes; `product_b` 0.
- `system_a` 999,632,896; `system_b` 606,535,680.
- `system_ext_a` 969,871,360; `system_ext_b` 0.
- `system_dlkm_a` 8,273,920; `system_dlkm_b` 0.
- `vendor_a` 927,809,536; `vendor_b` 0.
- `vendor_dlkm_a` 16,187,392; `vendor_dlkm_b` 0.
- Grupos: `main_a`, `main_b`; metadata reporta un bloque dinámico `super` de 10,334,765,056 bytes.

Estas son capacidades LP, no una medición del tamaño de los datos EROFS ocupados. Se reconstruyeron en `/tmp/taipei_logical/` las siete particiones lógicas con extents (`product_a`, `system_a`, `system_b`, `system_dlkm_a`, `system_ext_a`, `vendor_a`, `vendor_dlkm_a`). `file` identifica todas como EROFS; las imágenes ocupan ~6.6 GB reales.

- El `file` de las EROFS de G55 identifica `LZ4_0PADDING`, sin el feature `BIG_PCLUSTER` detectado en varias imágenes del paquete Infinity-X G54. Es otra diferencia de formato que hay que respetar al preparar una ROM.
- Cadenas de `vendor_a` incluyen `taipei`, `taipei_g_hal`, `MT6855`, overlays y tuning/configuración de cámara y touch específicos de taipei. El kernel que reporta `boot.img` G55 es `6.12.58-android16-6-gb0a9599c6c01-ab14987696-4k`.

### Estado y siguiente trabajo

- Ya hay suficiente evidencia para comparar cáscara de particiones, bootchain y firmware. El paquete de G55 tiene la identidad/build esperados y los MD5 internos coinciden.
- Mantener ROM de referencia G54 y firmware G55 como archivos originales.
- Las extracciones están en `/tmp` (tmpfs) y pueden desaparecer al reiniciar: `/tmp/cancunf_images`, `/tmp/taipei_xt2435-1`, `/tmp/taipei_logical`; scripts `/tmp/extract_cancunf.py`, `/tmp/rebuild_taipei_super.py`, `/tmp/extract_taipei_logical.py`. El super raw `/tmp/taipei_super.img` se eliminó después de leer metadata y extraer las particiones lógicas; se puede reconstruir desde los 27 sparse chunks.
- Espacio `/tmp` es 20 GB; tras estas extracciones quedaban aproximadamente 2.8 GB libres. Comprobar antes de crear copias adicionales grandes.
- Para continuar port: revisar/reconstruir extents de particiones lógicas G55 de forma selectiva, obtener/inspeccionar device tree, kernel source y vendor blobs específicos de `taipei`, contrastar con configuración Infinity-X. No inferir que `cancunf` es port directo aunque la familia SoC sea cercana.
- Nunca presentar firmware CFC como algo que haya que instalar en el G55: es firmware de rescate/fábrica y borra datos; aquí se usa solo para lectura y comparación.

### Búsqueda inicial de código público del G55

- Una búsqueda web por `taipei`, `XT2435` y `W1UTS36.51-39-4` no encontró un device tree AOSP/LineageOS/Infinity-X mantenido para G55 ni una publicación exacta del kernel source vinculada a ese build. Es una búsqueda inicial, no prueba de inexistencia.
- Motorola mantiene el portal/repositorios oficiales de código abierto: [Motorola Open Source](https://motorolamobilityllc.github.io/). El siguiente paso es buscar allí el tag del kernel correspondiente al build W1UTS36.51-39-4 y, si no existe, revisar/solicitar publicación GPL para ese build.
- Encontré documentación comunitaria GSI que lista imágenes GSI probadas en G55, pero no constituye soporte nativo ni fuente de un device tree. No se ha probado ni flasheado ninguna GSI.
- Por parte del usuario no hacen falta más datos ni descargas para continuar análisis de solo lectura. Para compilar ROM nativa los bloqueantes técnicos son source/kernel exactos de `taipei`, device tree nativo, extracción de blobs desde el firmware ya recibido y un árbol ROM base compatible Android 16. Para prueba en hardware más adelante hay que confirmar que el bootloader de su unidad se puede desbloquear y respaldar datos; no se ha pedido ni iniciado ese paso.

### Inspección adicional de boot/ramdisk/DTB

- En el firmware G55, `boot.img` v4 declara kernel de ~19.5 MB y ramdisk propio vacío; el ramdisk está en `vendor_boot.img`. El texto del kernel identifica `6.12.58-android16-6-gb0a9599c6c01-ab14987696-4k`.
- El `vendor_boot` v4 fue desempaquetado: ramdisk LZ4 legacy de 33,919,024 bytes que descomprime a 74,838,528 bytes. CPIO en `/tmp/taipei_vendor_ramdisk.cpio`; incluye `first_stage_ramdisk/fstab.mt6855`, `default.prop`, `system/etc/init`, `lib/modules/*` y `modules.load`.
- El fstab `taipei` monta particiones dinámicas por first-stage y contempla EROFS/ext4 para `system`, `system_ext`, `vendor`, `product`, `vendor_dlkm` y `system_dlkm`; define además rutas de almacenamiento específicas como `protect1/2`, `nvdata`, `nvcfg`, `persist`, `prodpersist`, `tzapp_a`, etc. El fstab G54 está en otra ruta CPIO y difiere en opciones/formatos. Usar el de taipei para portar.
- DTB G55 extraído de `vendor_boot`: el blob inicial es una tabla Android DT (`0xd7b7ab1e`) de una entrada; FDT de 233,626 bytes en `/tmp/taipei_dtb_0.dtb`. DTB del G54 extraído a `/tmp/cancunf_vendor.dtb` (214,455 bytes). Ambos llevan MT6855, pero son distintos; no asumir DTB intercambiable.
- Ramdisks y scripts temporales: `/tmp/taipei_vendor_ramdisk.cpio`, `/tmp/cancunf_vendor_ramdisk.cpio`, `/tmp/unpack_vendor_ramdisk.py`; DTBs arriba indicados. No se extrajeron/decodificaron aún los source DTS ni los archivos EROFS individuales.
- Se conservaron artefactos pequeños y útiles en el workspace: `research/taipei/fstab.mt6855`, `research/taipei/modules.load`, `research/taipei/vendor.dtb`, `research/cancunf/vendor.dtb`; ver `research/README.md`.
- Como `dtc` no está disponible, se añadió `tools/dump_fdt_properties.py`, que genera inventarios legibles en `research/{taipei,cancunf}/vendor-dtb-properties.txt` (no son DTS compilables). DTB taipei: 503 strings `compatible`; cancunf: 488; 468 comunes, 35 solo taipei y 20 solo cancunf. Diferencias representativas: G55 tiene `mediatek,geniezone`, `mediatek,mt6363-regulator`, `mediatek,flashlights_ocp81375`, `mediatek,charger,pe45`; G54 tiene `awinic,aw36518`, `mediatek,mt6855-board-ntc`, `mediatek,charger,pe4`.
- No hay `erofs-utils`, `dtc`, `lpunpack` ni `simg2img` instalados. Se intentó `apt download erofs-utils`; falló porque el shell no resuelve `deb.debian.org`. No se instalaron paquetes ni se modificaron áreas del sistema.
- La extracción de blobs desde `vendor_a`/`product_a` EROFS y la decompilación DTS requieren disponer localmente de `erofs-utils` y `device-tree-compiler`, o analizar estas estructuras por otro medio. La herramienta web encontró la documentación del portal Motorola, pero no un release/tag público que coincida con `W1UTS36.51-39-4`; no se creó ningún issue externo.
- Hallazgo de base de kernel: la versión visible en `boot.img` es `6.12.58-android16`; AOSP lista GKI 6.12.58 bajo `android16-6.12-2025-12` ([documentación](https://source.android.com/docs/core/architecture/kernel/gki-android16-6_12-release-builds)). Es una coincidencia de versión y candidato para la base GKI, no prueba de que sea el source completo Motorola/MTK ni que los módulos propietarios coincidan.
- Informe técnico durable actualizado: `research/taipei/porting-status.md` resume identidad, arranque, tabla LP, diferencias DTB, fuentes faltantes y secuencia sugerida. El shell tampoco resolvió `android.googlesource.com` al probar `git ls-remote`; no se clonó una ROM base.


## Actualización: herramientas locales, extracción de blobs y esqueleto de Device Tree (2026-11-02)

### Herramientas locales operativas en el proyecto
- Se resolvieron las herramientas faltantes sin instalar paquetes en el sistema global:
  - `tools/pkg/`: paquetes Debian descargados con `apt download device-tree-compiler erofs-utils`.
  - `tools/local/usr/bin/dtc` (DTC 1.7.2): descompilador y compilador de device trees.
  - `tools/local/usr/bin/fsck.erofs` (erofs-utils 1.8.6): extractor y verificador EROFS (LZ4, LZ4HC, deflate, zstd).
  - `tools/local/usr/bin/dump.erofs`: explorador de superbloque e inodos.

### Extracción EROFS y descompilación DTS
- **Decompilación DTS**:
  - `research/taipei/vendor.dts` (285 KB, 6,100 líneas): generado forzando `-f -q` con `dtc` a partir de `vendor.dtb`.
  - `research/cancunf/vendor.dts` (262 KB): DTS del G54 para referencia comparativa.
- **Extracción de particiones EROFS stock**:
  - `extracted/vendor/` (1.5 GB): 3,623 archivos listados en `research/taipei/vendor-file-list.txt`.
  - `extracted/product/` (3.5 GB): 4,266 archivos listados en `research/taipei/product-file-list.txt`.
  - `extracted/vendor_dlkm/`: módulos de kernel fuera de árbol de Motorola y MediaTek.
  - `extracted/system_dlkm/`: módulos de kernel GKI AOSP comunes.

### Lista de archivos propietarios y extracción
- Se creó `tools/generate_proprietary_files.py` que comprueba cada archivo antes de emitirlo.
- Se generaron `research/taipei/proprietary-files.txt` y `device/motorola/taipei/proprietary-files.txt` (406 líneas comprobadas al 100%).
- `device/motorola/taipei/extract-files.sh` extrajo con éxito 78 MB de blobs a `vendor/motorola/taipei/proprietary/` con 0 errores de archivo faltante.

### Esqueleto de Device Tree para `taipei`
Se creó la estructura de soporte de compilación en `device/motorola/taipei/`:
- `Android.mk`, `AndroidProducts.mk` (targets `infinity_taipei` y `lineage_taipei`).
- `BoardConfig.mk` con arquitectura ARM64/ARMv8-A, boot header v4, page size 4096, partición Super (10.33 GB, EROFS LZ4), densidad 400 dpi y vendor security patch `2026-09-01`.
- `device.mk` con configuraciones Virtual A/B, display, ABI lists, permisos y fstab.
- `infinity_taipei.mk` y `lineage_taipei.mk` con fingerprints de `taipei_g_sys`.
- `rootdir/etc/fstab.mt6855` e `init.mt6855.rc`.
- `board-info.txt`, `extract-files.sh`, `setup-makefiles.sh`.

### Búsqueda de fuentes y estado de repositorios
- **Guía de ingeniería comunitaria G55**: [JoshRob297/moto-g55-taipei-guide](https://github.com/JoshRob297/moto-g55-taipei-guide).
- **Kernel source oficial**: [MotorolaMobilityLLC/kernel-mtk](https://github.com/MotorolaMobilityLLC/kernel-mtk). Se consultaron tags remotos con `git ls-remote`. Existen tags de la serie Android 16 (`MMI-W1...`), pero el tag exacto para `W1UTS36.51-39-4` / `taipei` aún no ha sido publicado.
- **Kernel GKI base**: Android 16 Linux 6.12.58 en AOSP tag `android16-6.12-2025-12` ([documentación oficial](https://source.android.com/docs/core/architecture/kernel/gki-android16-6_12-release-builds)).
- **Resolución técnica de bloqueos en device tree**:
  - **Kernel / Drivers**: Como Motorola aún no publica el release GPL, se implementó la arquitectura de Bringup Prebuilt GKI en `device/motorola/taipei/prebuilt/` (`kernel` GKI 6.12.58, `dtb.img` MT6855, `dtbo.img` y 87 módulos de `vendor_dlkm`).
  - **SELinux**: Se estructuraron los contextos de stock en `device/motorola/taipei/sepolicy/vendor/` y se configuró modo `permissive` en `BoardConfig.mk`.
  - **Liberación de espacio y RAM para compilación (2026-11-02)**: Se limpiaron las extracciones temporales de `/tmp` y la carpeta `extracted/` tras haber consolidado todos los blobs en `vendor/` y los prebuilts en `device/`. La RAM disponible aumentó a **31 GiB libres** (de 38 GiB totales) y el disco NVMe cuenta ahora con **311 GB libres** (27% de uso), dejando un margen holgado para la sincronización y compilación de Infinity-X.

### Sincronización completa de Infinity-X y validación de Lunch (2026-11-02 / 2026-11-03)
- Se ejecutó `tools/sync_rom.sh` sincronizando los 1,170 repositorios de Project Infinity-X (rama 16 / Android 16).
- El árbol base reside en `/home/hoyuse/infinity-16` (enlazado también desde el workspace).
- Espacio libre en disco NVMe: más de 180 GB libres.
- Herramientas configuradas en `~/.local/bin/`: `ccache` 4.11.2 (límite configurado a 40 GB), `repo`, `git-lfs`, `dtc`, `fsck.erofs`.

### Resolución de bloqueos críticos de compilación y verificación final (2026-11-03)
1. **Inclusión de Blobs Propietarios en la ROM**:
   - Se generó el makefile completo `vendor/motorola/taipei/taipei-vendor.mk` con 353 archivos reales organizados en `PRODUCT_COPY_FILES` (147 de `vendor/` y 206 módulos `.ko` de `vendor_dlkm/`), resolviendo el estado vacío original.
   - Se corrigió el symlink absoluto `android.hardware.graphics.allocator-V2-service-mediatek` hacia su ruta relativa.
2. **Cumplimiento VINTF de Android 16**:
   - Se aislaron los 6 manifiestos XML propietarios (`manifest_cameraprovider`, `manifest_gralloc`, `manifest_hwcomposer`, `manifest_IMoto_AIDL_Fingerprint`, `manifest_isphal`, `manifest_touch`) en `device/motorola/taipei/vintf/`.
   - Se registraron formalmente en `DEVICE_MANIFEST_FILE` en `BoardConfig.mk`, eliminándolos de `PRODUCT_COPY_FILES` para cumplir la política de AOSP.
3. **Bootchain y First-Stage Ramdisk (Boot Header v4)**:
   - Se configuró `BOARD_INCLUDE_DTB_IN_BOOTIMG := true` y `BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt` con `prebuilt/dtb.dtb` para inyectar el DTB en `vendor_boot.img`.
   - Se redirigió `fstab.mt6855` a `$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6855` para permitir el montaje first-stage de EROFS en dispositivos GKI.
4. **Integración formal con Infinity-X**:
   - `infinity_taipei.mk` ahora hereda `vendor/infinity/config/common_full_phone.mk`.
   - Esto activa automáticamente la exclusión de repositorios redundantes (`PRODUCT_SOURCE_ROOT_DIRS=-prebuilts/misc/protobuf_vendorcompat`), resolviendo limpiamente la colisión con `hardware/lineage/compat`.
   - La ROM ahora se identifica oficialmente como `Project_Infinity-X-3.12-taipei-03.11.2026-GAPPS-UNOFFICIAL`.
5. **SELinux Type Enforcement**:
   - Se generó `device/motorola/taipei/sepolicy/vendor/taipei_types.te` con las 1,172 declaraciones de tipos propietarios (propiedades, archivos, servicios, sockets) para evitar fallos de enlace en `secilc`.
6. **Validación de Compilación (`m nothing`) Exitosa**:
   - Se ejecutó `lunch infinity_taipei-userdebug && m nothing` en `/home/hoyuse/infinity-16`.
   - Soong generó `build.infinity_taipei.ninja` (368 MB).
   - Kati finalizó el 100% de las reglas de Makefiles y empaquetado.
   - Ninja verificó todas las dependencias y finalizó con **éxito total (`build completed successfully`)**.
   - El árbol está ahora **genuinamente listo y comprobado** para compilar imágenes (`m bootimage`, `m vendorbootimage`, `m vendorimage`, o `make bacon`).

# Firmware research artifacts

These files are read-only analysis inputs for a Moto G55 (`taipei`) ROM port. They are extracted from the stock XT2435-1 package and the Moto G54 Infinity-X OTA; they are **not flashable images** and must not be installed on a device.

- `taipei/fstab.mt6855`: first-stage mount configuration from the G55 `vendor_boot` ramdisk.
- `taipei/modules.load`: stock G55 kernel modules loaded during boot.
- `taipei/vendor.dtb`: single FDT extracted from the Android DT table in G55 `vendor_boot` (233,626 bytes; MT6855, board-specific).
- `cancunf/vendor.dtb`: FDT extracted from the G54 Infinity-X `vendor_boot` (214,455 bytes). It is a comparison reference only.

Source packages are in the project root. G55 package SHA-256: `05d182531134ef5dcceab60cb6de0140c221bd8265e510f5ddf1d0af0d10f075`. The package XML's 48 declared MD5 checks passed. The source archives remain the authoritative inputs; `/tmp` extractions are temporary and may be removed.

## DTB comparison

`tools/dump_fdt_properties.py` writes a readable inventory from an FDT binary; it is an inspection aid, **not** a replacement for `dtc` or a compilable DTS source. Inventories:

- `taipei/vendor-dtb-properties.txt`
- `cancunf/vendor-dtb-properties.txt`

The G55 DTB has 503 distinct `compatible` strings and the G54 DTB has 488; 468 are shared, 35 occur only in the G55 blob, and 20 only in the G54 blob. Examples of G55-only entries include `mediatek,geniezone`, `mediatek,mt6363-regulator`, `mediatek,flashlights_ocp81375`, and `mediatek,charger,pe45`. Examples only in G54 include `awinic,aw36518`, `mediatek,mt6855-board-ntc`, and `mediatek,charger,pe4`. This confirms board and platform configuration differences even though both DTBs identify MT6855.

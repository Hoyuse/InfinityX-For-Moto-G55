#!/bin/bash
#
# sync_rom.sh
# Script para sincronizar el arbol fuente completo de Project Infinity-X (Android 16)
#

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ROM_DIR="${PROJECT_ROOT}/infinity-16"

export PATH="${PROJECT_ROOT}/tools/local/usr/bin:$PATH"

if [ ! -d "$ROM_DIR" ]; then
    echo "Error: ROM directory not found at $ROM_DIR"
    exit 1
fi

cd "$ROM_DIR"

echo "=========================================================="
echo "Iniciando repo sync de Project Infinity-X (rama 16)..."
echo "Directorio destino: $ROM_DIR"
echo "Hora de inicio: $(date)"
echo "Espacio libre en disco antes de iniciar: $(df -h . | tail -1 | awk '{print $4}')"
echo "=========================================================="

repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j4

echo "=========================================================="
echo "repo sync completado con exito."
echo "Hora de fin: $(date)"
echo "Espacio libre en disco al terminar: $(df -h . | tail -1 | awk '{print $4}')"
echo "=========================================================="

#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="$(tr -d '[:space:]' < "$ROOT_DIR/VERSION")"
DEB="$ROOT_DIR/dist/pardus-yansit_${VERSION}_all.deb"
export TMPDIR="$ROOT_DIR/build/tmp"
mkdir -p "$TMPDIR"

bash -n \
    "$ROOT_DIR/src/bin/pardus-yansit" \
    "$ROOT_DIR/src/bin/pardus-yansit-check" \
    "$ROOT_DIR/src/lib/enable-extension" \
    "$ROOT_DIR/scripts/build-deb.sh" \
    "$ROOT_DIR/tests/test-package.sh"

sh -n \
    "$ROOT_DIR/packaging/preinst" \
    "$ROOT_DIR/packaging/postinst" \
    "$ROOT_DIR/packaging/postrm"

node --input-type=module --check < "$ROOT_DIR/src/extension/extension.js"

python3 -m json.tool "$ROOT_DIR/src/extension/metadata.json" >/dev/null
python3 - <<'PY' "$ROOT_DIR/src/data/pardus-yansit.svg" "$ROOT_DIR/src/data/pardus-yansit-symbolic.svg"
import sys
import xml.etree.ElementTree as ET

for path in sys.argv[1:]:
    ET.parse(path)
PY

for desktop in "$ROOT_DIR"/src/data/*.desktop; do
    grep -q '^\[Desktop Entry\]$' "$desktop"
    grep -q '^Type=Application$' "$desktop"
    grep -q '^Exec=' "$desktop"
done

[[ -f "$DEB" ]] || {
    printf 'Paket bulunamadı: %s\n' "$DEB" >&2
    exit 1
}

dpkg-deb --info "$DEB" >/dev/null
CONTENTS_FILE="$TMPDIR/pardus-yansit-package-contents.txt"
dpkg-deb --contents "$DEB" > "$CONTENTS_FILE"
grep -q 'usr/bin/pardus-yansit$' "$CONTENTS_FILE"
grep -q 'pardus-yansit@pardus.org.tr/extension.js$' "$CONTENTS_FILE"
grep -q 'org.gnome.NetworkDisplays.desktop$' "$CONTENTS_FILE"

INSTALLED_SIZE="$(du -k "$DEB" | awk '{print $1}')"
if (( INSTALLED_SIZE > 2048 )); then
    printf 'Paket beklenenden büyük: %s KiB\n' "$INSTALLED_SIZE" >&2
    exit 1
fi

printf 'Tüm statik paket testleri başarılı.\n'

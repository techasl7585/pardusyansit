#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="$(tr -d '[:space:]' < "$ROOT_DIR/VERSION")"
PACKAGE_ROOT="$ROOT_DIR/build/pardus-yansit_${VERSION}_all"
DIST_DIR="$ROOT_DIR/dist"
EXTENSION_DIR="$PACKAGE_ROOT/usr/share/gnome-shell/extensions/pardus-yansit@pardus.org.tr"
export TMPDIR="$ROOT_DIR/build/tmp"

rm -rf "$PACKAGE_ROOT"
mkdir -p \
    "$TMPDIR" \
    "$PACKAGE_ROOT/DEBIAN" \
    "$PACKAGE_ROOT/usr/bin" \
    "$PACKAGE_ROOT/usr/lib/pardus-yansit" \
    "$PACKAGE_ROOT/usr/share/applications" \
    "$PACKAGE_ROOT/usr/share/icons/hicolor/scalable/apps" \
    "$PACKAGE_ROOT/usr/share/icons/hicolor/symbolic/apps" \
    "$PACKAGE_ROOT/usr/share/doc/pardus-yansit" \
    "$PACKAGE_ROOT/etc/xdg/autostart" \
    "$EXTENSION_DIR" \
    "$DIST_DIR"

install -m 0755 "$ROOT_DIR/src/bin/pardus-yansit" "$PACKAGE_ROOT/usr/bin/pardus-yansit"
install -m 0755 "$ROOT_DIR/src/bin/pardus-yansit-check" "$PACKAGE_ROOT/usr/bin/pardus-yansit-check"
install -m 0755 "$ROOT_DIR/src/lib/enable-extension" "$PACKAGE_ROOT/usr/lib/pardus-yansit/enable-extension"

install -m 0644 "$ROOT_DIR/src/extension/extension.js" "$EXTENSION_DIR/extension.js"
install -m 0644 "$ROOT_DIR/src/extension/metadata.json" "$EXTENSION_DIR/metadata.json"

install -m 0644 "$ROOT_DIR/src/data/org.gnome.NetworkDisplays.desktop" \
    "$PACKAGE_ROOT/usr/share/applications/org.gnome.NetworkDisplays.desktop"
install -m 0644 "$ROOT_DIR/src/data/pardus-yansit-check.desktop" \
    "$PACKAGE_ROOT/usr/share/applications/pardus-yansit-check.desktop"
install -m 0644 "$ROOT_DIR/src/data/pardus-yansit-enable.desktop" \
    "$PACKAGE_ROOT/etc/xdg/autostart/pardus-yansit-enable.desktop"
install -m 0644 "$ROOT_DIR/src/data/pardus-yansit.svg" \
    "$PACKAGE_ROOT/usr/share/icons/hicolor/scalable/apps/pardus-yansit.svg"
install -m 0644 "$ROOT_DIR/src/data/pardus-yansit-symbolic.svg" \
    "$PACKAGE_ROOT/usr/share/icons/hicolor/symbolic/apps/pardus-yansit-symbolic.svg"

install -m 0644 "$ROOT_DIR/README.md" "$PACKAGE_ROOT/usr/share/doc/pardus-yansit/README.md"
install -m 0644 "$ROOT_DIR/packaging/copyright" "$PACKAGE_ROOT/usr/share/doc/pardus-yansit/copyright"

sed "s/^Version: .*/Version: $VERSION/" "$ROOT_DIR/packaging/control" > "$PACKAGE_ROOT/DEBIAN/control"
install -m 0755 "$ROOT_DIR/packaging/preinst" "$PACKAGE_ROOT/DEBIAN/preinst"
install -m 0755 "$ROOT_DIR/packaging/postinst" "$PACKAGE_ROOT/DEBIAN/postinst"
install -m 0755 "$ROOT_DIR/packaging/postrm" "$PACKAGE_ROOT/DEBIAN/postrm"

find "$PACKAGE_ROOT" -type d -exec chmod 0755 {} +

dpkg-deb --root-owner-group --build "$PACKAGE_ROOT" \
    "$DIST_DIR/pardus-yansit_${VERSION}_all.deb"

printf 'Paket hazır: %s\n' "$DIST_DIR/pardus-yansit_${VERSION}_all.deb"

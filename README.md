# Pardus Yansıt

[![Pardus 25 paket testi](https://github.com/techasl7585/pardusyansit/actions/workflows/package-test.yml/badge.svg)](https://github.com/techasl7585/pardusyansit/actions/workflows/package-test.yml)

Pardus Yansıt, Pardus 25 GNOME masaüstüne kablosuz ekran paylaşımını
bütünleşik hale getiren açık kaynaklı bir sistem eklentisidir. Sağ üstteki
hızlı ayarlar paneline **Yansıt** kutucuğu ekler ve Pardus depolarındaki
`gnome-network-displays` motorunu Pardus arayüzüyle başlatır.

## Özellikler

- GNOME hızlı ayarlar panelinde Yansıt kutucuğu
- Ana kutucuktan tek tıkla kablosuz ekran uygulamasını açma
- Alt menüden uygulamayı açma ve sistem uygunluk denetimi
- Miracast ve Chromecast destekli GNOME Network Displays motoru
- Wi-Fi Direct, NetworkManager, PipeWire ve portal denetimi
- Türkçe Pardus Yansıt adı, açıklaması ve özgün simge
- Pardus 25 üzerinde bağımlılıkları otomatik kuran `.deb` paketi
- İlk GNOME oturumunda hızlı ayar eklentisini otomatik etkinleştirme
- Paket kaldırıldığında özgün GNOME başlatıcısını geri yükleme

## Kurulum

[`pardus-yansit_0.1.0_all.deb` dosyasını indirin](https://github.com/techasl7585/pardusyansit/raw/main/release/pardus-yansit_0.1.0_all.deb).
Dosyanın bulunduğu klasörde:

```bash
sudo apt install ./pardus-yansit_0.1.0_all.deb
```

Kurulum, Pardus deposundan gerekli yansıtma motorunu ve sistem bileşenlerini
otomatik olarak kurar. Yeni sistem eklentisi açık GNOME oturumunda hemen
görünmezse oturumu kapatıp yeniden açtığınızda otomatik etkinleşir; başka bir
terminal ayarı gerekmez.

Paketin SHA-256 özeti GitHub deposundaki `release/SHA256SUMS` dosyasında
bulunur. İndirdiğiniz paketi doğrulamak için:

```bash
sha256sum pardus-yansit_0.1.0_all.deb
```

## Kullanım

1. Sağ üstteki hızlı ayarlar panelini açın.
2. **Yansıt** kutucuğuna basın.
3. Listeden kablosuz ekranınızı seçin.
4. GNOME ekran paylaşımı penceresinden paylaşılacak ekranı onaylayın.

Uygulama menüsündeki **Pardus Yansıt Sistem Denetimi** kısayolu; Wi-Fi Direct,
NetworkManager, PipeWire, ekran paylaşım portalı ve GNOME sürümünü denetler.

## Komutlar

```bash
pardus-yansit
pardus-yansit --check
pardus-yansit --check-gui
```

## Kaynaktan paket oluşturma

```bash
./scripts/build-deb.sh
./tests/test-package.sh
```

Paket `dist/` klasörüne yazılır. GitHub Actions aynı işlemi temiz Debian 13
ortamında tekrarlar ve paket bağımlılıklarının çözülebildiğini denetler.

## Sistem gereksinimleri

- Pardus 25
- GNOME Shell 45–49
- Wi-Fi Direct destekli kablosuz ağ kartı (Miracast için)
- Wayland oturumu önerilir

Chromecast keşfi ve Miracast bağlantısı kullanılan ağ kartı, sürücü ve hedef
cihazın özelliklerine bağlıdır. Sistem denetimi destek eksiklerini kullanıcıya
açık şekilde bildirir.

## Açık kaynak ve atıf

Pardus Yansıt bütünleştirme kodu GPL-3.0-or-later lisanslıdır. Kablosuz ekran
motoru olarak GNOME projesinin `gnome-network-displays` uygulamasını kullanır;
GNOME geliştiricilerinin telif hakları ve lisansı korunur. Pardus Yansıt,
GNOME Network Displays'ın kaynak kodunu kendi geliştirmesi gibi sunmaz.

Kaynak depo: <https://github.com/techasl7585/pardusyansit>

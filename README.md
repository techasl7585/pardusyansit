<div align="center">
  <img src="src/data/pardus-yansit.svg" width="128" alt="Pardus Yansıt logosu">

# Pardus Yansıt

**Pardus 25 için masaüstüne bütünleşik kablosuz ekran yansıtma çözümü**

[![Pardus 25](https://img.shields.io/badge/Pardus-25-009999?style=flat-square)](https://pardus.org.tr/)
[![GNOME Shell](https://img.shields.io/badge/GNOME-45–49-4A86CF?style=flat-square&logo=gnome)](https://www.gnome.org/)
[![Sürüm](https://img.shields.io/badge/sürüm-0.1.0-36C7C9?style=flat-square)](https://github.com/techasl7585/pardusyansit)
[![Lisans](https://img.shields.io/badge/lisans-GPL--3.0--or--later-blue?style=flat-square)](LICENSE)
[![Paket testi](https://github.com/techasl7585/pardusyansit/actions/workflows/package-test.yml/badge.svg)](https://github.com/techasl7585/pardusyansit/actions/workflows/package-test.yml)

[**`.deb` paketini indir**](https://github.com/techasl7585/pardusyansit/raw/main/release/pardus-yansit_0.1.0_all.deb)

</div>

## Proje hakkında

Pardus Yansıt, bilgisayar ekranınızı televizyon, projeksiyon ve diğer uyumlu
kablosuz ekranlara kolayca yansıtmanızı sağlar.

Uygulama GNOME hızlı ayarlar paneline **Yansıt** kutucuğu ekler. Kullanıcı ayrı
bir uygulama aramak veya gerekli sistem bileşenlerini tek tek kurmak zorunda
kalmadan kablosuz ekran penceresine doğrudan ulaşabilir.

Pardus Yansıt, yansıtma motoru olarak açık kaynaklı
[GNOME Network Displays](https://gitlab.gnome.org/GNOME/gnome-network-displays)
uygulamasını kullanır; Pardus bütünleşmesi, hızlı ayar eklentisi, temiz kurulum
paketlemesi ve sistem uygunluk denetimi bu proje tarafından sağlanır.

## Neden geliştirildi?

Pardus üzerinde kablosuz ekran paylaşımı için kullanılabilen açık kaynak
bileşenler bulunsa da özellik işletim sistemi arayüzünde görünür ve kolay
erişilebilir değildir. Kullanıcının uygun uygulamayı, bağımlılıkları ve donanım
desteğini kendisinin araştırması gerekebilir.

Pardus Yansıt bu parçaları tek deneyimde birleştirir:

- Sağ üst hızlı ayarlardan tek tıkla erişim
- Pardus adı, Türkçe açıklamalar ve özgün simge
- Gerekli paketlerin otomatik kurulması
- Donanım ve servis uygunluğunun anlaşılır biçimde denetlenmesi
- Paket kaldırıldığında özgün GNOME başlatıcısının geri yüklenmesi

## Öne çıkan özellikler

- GNOME hızlı ayarlar panelinde **Yansıt** kutucuğu
- Miracast ve Chromecast destekli yansıtma motoru
- Yerleşik monitör, pencere ve sanal monitör paylaşımı
- Wi-Fi Direct, NetworkManager, PipeWire ve ekran paylaşım portalı denetimi
- Uygulama içinden erişilebilen grafik sistem kontrolü
- Pardus 25 için bağımlılıkları tanımlanmış `.deb` kurulum paketi
- Hızlı ayar eklentisini ilk GNOME oturumunda otomatik etkinleştirme
- Kurulum ve kaldırma sırasında güvenli masaüstü başlatıcısı yönetimi
- Temiz Debian 13 ortamında otomatik paket oluşturma ve bağımlılık testi

## Nasıl çalışır?

```mermaid
flowchart LR
    A["GNOME Hızlı Ayarlar"] --> B["Pardus Yansıt"]
    B --> C["GNOME Network Displays"]
    C --> D["Miracast veya Chromecast ekran"]
```

Pardus Yansıt kullanıcı arayüzü ve sistem bütünleşmesini yönetir. Gerçek ekran
aktarımı GNOME Network Displays, PipeWire ve masaüstü ekran paylaşım portalı
üzerinden gerçekleştirilir.

## Kurulum

### 1. Paketi indirin

[`pardus-yansit_0.1.0_all.deb` dosyasını indirin](https://github.com/techasl7585/pardusyansit/raw/main/release/pardus-yansit_0.1.0_all.deb).

### 2. Paketi kurun

Dosyanın bulunduğu klasörde terminal açın:

```bash
sudo apt install ./pardus-yansit_0.1.0_all.deb
```

APT; yansıtma motorunu, PipeWire bileşenlerini, GNOME ekran paylaşım portalını
ve gerekli yardımcı araçları Pardus deposundan otomatik olarak kurar.

> [!NOTE]
> GNOME Wayland, oturum çalışırken sonradan eklenen sistem eklentilerini hemen
> yüklemeyebilir. **Yansıt** kutucuğu kurulumdan sonra görünmezse oturumu bir kez
> kapatıp yeniden açın. Başka bir terminal ayarı gerekmez.

## Kullanım

1. Sağ üst köşedeki sistem menüsünü açın.
2. **Yansıt** kutucuğuna basın.
3. Listeden televizyonunuzu, projeksiyonu veya kablosuz ekranınızı seçin.
4. Ekran paylaşımı penceresinden paylaşılacak monitörü ya da pencereyi onaylayın.

Uygulama menüsündeki **Pardus Yansıt Sistem Denetimi** kısayolu bağlantı için
gerekli bileşenleri grafik bir pencerede kontrol eder.

## Sistem uygunluk denetimi

Terminalden ayrıntılı kontrol:

```bash
pardus-yansit --check
```

Grafik kontrol penceresi:

```bash
pardus-yansit --check-gui
```

Denetlenen bileşenler:

| Bileşen | Denetim amacı |
|---|---|
| GNOME Shell | Hızlı ayar eklentisi uyumluluğu |
| Wayland | Önerilen ekran paylaşım oturumu |
| NetworkManager | Ağ ve Wi-Fi aygıt yönetimi |
| Wi-Fi Direct | Miracast bağlantı desteği |
| PipeWire | Görüntü ve ses aktarım altyapısı |
| WirePlumber | PipeWire oturum yönetimi |
| XDG Desktop Portal | Güvenli ekran/pencere seçimi |
| Pardus Yansıt eklentisi | Hızlı ayar kutucuğunun durumu |

## Sistem gereksinimleri

| Gereksinim | Açıklama |
|---|---|
| İşletim sistemi | Pardus 25 |
| Masaüstü | GNOME Shell 45–49 |
| Oturum | Wayland önerilir |
| Miracast | Wi-Fi Direct destekli ağ kartı ve sürücü |
| Chromecast | Bilgisayar ve hedef cihazın aynı ağda olması |

> [!IMPORTANT]
> Miracast desteği yalnızca yazılıma bağlı değildir. Kablosuz ağ kartının,
> Linux sürücüsünün ve hedef ekranın Wi-Fi Direct desteği bulunmalıdır.
> Pardus Yansıt desteklenmeyen donanıma yazılımsal olarak Wi-Fi Direct özelliği
> kazandıramaz; sistem denetimi bu durumu kullanıcıya bildirir.

## Paket doğrulama

İndirilen paketin SHA-256 değerini görüntüleyin:

```bash
sha256sum pardus-yansit_0.1.0_all.deb
```

Sonucu [`release/SHA256SUMS`](release/SHA256SUMS) dosyasındaki değerle
karşılaştırın.

## Kaynak koddan paket oluşturma

Geliştirme araçları kurulu bir Debian/Pardus sisteminde:

```bash
git clone https://github.com/techasl7585/pardusyansit.git
cd pardusyansit
./scripts/build-deb.sh
./tests/test-package.sh
```

Oluşturulan paket `dist/` klasörüne yazılır. Aynı işlem GitHub Actions üzerinde
temiz Debian 13 ortamında tekrarlanır ve APT bağımlılık çözümü simüle edilir.

## Proje yapısı

```text
pardusyansit/
├── .github/workflows/       # Otomatik paket ve bağımlılık testleri
├── packaging/               # Debian paket bilgileri ve kurulum betikleri
├── release/                 # İndirilebilir .deb paketi ve SHA-256 özeti
├── scripts/                 # Paket oluşturma aracı
├── src/
│   ├── bin/                 # Başlatıcı ve sistem denetimi
│   ├── data/                # Masaüstü kısayolları ve simgeler
│   ├── extension/           # GNOME hızlı ayar eklentisi
│   └── lib/                 # Otomatik eklenti etkinleştiricisi
└── tests/                   # Statik paket testleri
```

## Kaldırma

```bash
sudo apt remove pardus-yansit
```

Kaldırma işlemi Pardus Yansıt hızlı ayar bütünleşmesini ve başlatıcısını kaldırır,
ardından GNOME Network Displays'ın özgün masaüstü başlatıcısını geri yükler.

## Sorun giderme

### Yansıt kutucuğu görünmüyor

Oturumu kapatıp yeniden açın. Ardından:

```bash
gnome-extensions info pardus-yansit@pardus.org.tr
```

### Kablosuz ekran bulunamıyor

```bash
pardus-yansit --check
```

çıktısında Wi-Fi aygıtı ve Wi-Fi Direct satırlarını kontrol edin. Miracast için
hedef ekranın kablosuz görüntü alma modunun açık olduğundan emin olun.

### Uygulama açılmıyor

Paketi bağımlılıklarıyla birlikte onarın:

```bash
sudo apt install --reinstall pardus-yansit
```

## Gizlilik

- Ekran paylaşımı yalnızca kullanıcı onayından sonra başlar.
- Paylaşılacak ekran veya pencere GNOME portalı üzerinden kullanıcı tarafından seçilir.
- Proje bir bulut hesabı veya uzak sunucu gerektirmez.
- Cihaz keşfi ve aktarım yerel ağ teknolojileri üzerinden gerçekleştirilir.

## Lisans ve atıf

Pardus Yansıt bütünleştirme kodu
[GPL-3.0-or-later](LICENSE) lisansıyla yayımlanır.

Kablosuz ekran motoru GNOME projesinin açık kaynaklı **GNOME Network Displays**
uygulamasıdır. GNOME geliştiricilerinin telif hakları, proje kimliği ve lisansı
korunur. GNOME Network Displays kaynak kodu bu depoya kopyalanmaz; Pardus
deposundaki özgün paket bağımlılık olarak kurulur.

> Pardus Yansıt bağımsız bir topluluk geliştirmesidir; TÜBİTAK ULAKBİM veya
> Pardus Projesi tarafından yayımlanmış resmî bir bileşen değildir.

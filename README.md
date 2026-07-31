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

## Proje Hakkında

Pardus Yansıt, bilgisayar ekranınızı televizyon, projeksiyon ve diğer uyumlu
kablosuz ekranlara kolayca yansıtmanızı sağlar.

Uygulama GNOME hızlı ayarlar paneline **Yansıt** kutucuğu ekler. Kullanıcı ayrı
bir uygulama aramak veya gerekli sistem bileşenlerini tek tek kurmak zorunda
kalmadan kablosuz ekran penceresine doğrudan ulaşabilir.

Pardus Yansıt, yansıtma motoru olarak açık kaynaklı
[GNOME Network Displays](https://gitlab.gnome.org/GNOME/gnome-network-displays)
kullanır; Pardus bütünleşmesi, hızlı ayar eklentisi, temiz kurulum
paketlemesi ve sistem uygunluk denetimi bu proje tarafından sağlanır.

## Neden Geliştirildi?

Pardus üzerinde kablosuz ekran paylaşımı için kullanılabilen açık kaynak
bileşenler bulunsa da özellik işletim sistemi arayüzünde görünür ve kolay
erişilebilir değildir. Kullanıcının uygun uygulamayı, bağımlılıkları ve donanım
desteğini kendisinin araştırması gerekmekte idi.


## Öne Çıkan Özellikler

- Miracast ve Chromecast destekli yansıtma motoru
- Yerleşik monitör, pencere ve sanal monitör paylaşımı
- Wi-Fi Direct, NetworkManager, PipeWire ve ekran paylaşım portalı denetimi
- Uygulama içinden erişilebilen grafik sistem kontrolü
- Pardus 25 için bağımlılıkları tanımlanmış `.deb` kurulum paketi


## Kurulum

### 1. Paketi indirin

[`pardus-yansit_0.1.0_all.deb` dosyasını indirin](https://github.com/techasl7585/pardusyansit/raw/main/release/pardus-yansit_0.1.0_all.deb).

### 2. Paketi kurun

İndirdiğiniz Paketi Pardus Paket Kurucu ile yükleyin

Uygulamalar Kısmından Uygulamayı Çalıştırın

> [!NOTE]
> GNOME Wayland, oturum çalışırken sonradan eklenen sistem eklentilerini hemen
> yüklemeyebilir. **Yansıt** kutucuğu kurulumdan sonra görünmezse oturumu bir kez
> kapatıp yeniden açın. Başka bir terminal ayarı gerekmez.

## Kullanım

1. Bilgisayar İle Yansıtılacak Ekranın Aynı Wifi Ağına Bağlı Olduğuna Emin Olun
2. Uygulamada **Yansıt** kutucuğuna basın.
3. Listeden televizyonunuzu, projeksiyonu veya kablosuz ekranınızı seçin.
4. Ekran paylaşımı penceresinden paylaşılacak monitörü ya da pencereyi onaylayın.

Uygulama menüsündeki **Pardus Yansıt Sistem Denetimi** kısayolu bağlantı için
gerekli bileşenleri grafik bir pencerede kontrol eder.


## Sistem gereksinimleri

| Gereksinim | Açıklama |
|---|---|
| İşletim sistemi | Pardus 25 Gnome |
| Masaüstü | GNOME Shell 45–49 |
| Oturum | Wayland önerilir |
| Miracast | Wi-Fi Direct destekli ağ kartı ve sürücü |
| Chromecast | Bilgisayar ve hedef cihazın aynı ağda olması |

> [!Önemli]
> Miracast desteği yalnızca yazılıma bağlı değildir. Kablosuz ağ kartının,
> Linux sürücüsünün ve hedef ekranın Wi-Fi Direct desteği bulunmalıdır.
> Pardus Yansıt desteklenmeyen donanıma yazılımsal olarak Wi-Fi Direct özelliği
> kazandıramaz; sistem denetimi bu durumu kullanıcıya bildirir.


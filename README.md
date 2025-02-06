# Real-Time Petandingan Bola

Ikhtisar
Aplikasi Detail Pertandingan Sepak Bola Real-Time dirancang untuk menyediakan skor langsung, statistik pertandingan, data performa pemain, dan wawasan tim yang terperinci kepada pengguna. Baik Anda penggemar biasa atau penggemar sepak bola, aplikasi ini akan terus memberi Anda informasi terkini tentang acara pertandingan real-time, statistik pemain, susunan tim, dan aksi penting seperti gol dan kartu merah. Dengan pemberitahuan push untuk acara penting, Anda tidak akan pernah melewatkan satu momen pun dari pertandingan!

## Features

Skor Pertandingan Langsung: Dapatkan pembaruan skor pertandingan secara langsung.
Statistik Pertandingan: Lihat statistik pertandingan terperinci seperti penguasaan bola, tembakan, tendangan sudut, dan banyak lagi.
Performa Pemain: Metrik performa terperinci untuk setiap pemain, termasuk gol, assist, dan statistik penting lainnya.

- Wawasan Tim: Periksa susunan pemain, formasi, dan data tim penting lainnya.

- Pemberitahuan Acara Penting: Terima pemberitahuan push untuk gol, kartu merah, dan acara pertandingan penting.

## Tech Stack

- Flutter: Kerangka kerja lintas platform untuk membangun aplikasi seluler berkinerja tinggi.
- BLoC: Solusi manajemen status untuk aplikasi yang dapat diskalakan dan dipelihara.
- GoRouter: Solusi perutean deklaratif untuk Flutter.
- Flutter ScreenUtil: Untuk desain UI responsif guna mengakomodasi berbagai ukuran layar.
- Firebase: Untuk sinkronisasi data waktu nyata dan pemberitahuan push.
- Equatable: Untuk perbandingan objek berbasis nilai dalam BLoC.
- Google Fonts: Untuk menyempurnakan tipografi dengan pilihan font yang bergaya.
- BLoC Terhidrasi: Untuk mempertahankan status BLoC saat aplikasi dimulai ulang.

## Folder Structure

```plaintext
lib/
├── core/
│   ├── config/
│   │   ├── app_theme.dart
│   │   ├── app_text_styles.dart
│   │   ├── app_colors.dart
│   ├── utils/
│   │   ├── screen_utils.dart
│   │   ├── extensions/
│   │   │   ├── context_extensions.dart
│   │   │   ├── string_extensions.dart
├── features/
│   ├── match/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   ├── presentation/
│   │   │   ├── bloc/
│   │   │   ├── screens/
│   │   │   ├── widgets/
│   │   ├── domain/
│   │   │   ├── usecases/
│   │   │   ├── entities/
├── navigation/
│   ├── app_router.dart
├── main.dart
```

# Core

- **config**: Berisi berkas konfigurasi global untuk tema aplikasi, gaya teks, dan warna.
- **utils**: Meliputi berkas utilitas seperti utilitas layar dan ekstensi konteks.

## Features

- **pertandingan**: Berisi fitur-fitur yang terkait dengan pertandingan sepak bola, termasuk:
- **data**: Menangani pengambilan data, model, dan repositori.
  **presentasi**: Termasuk BLoC, layar, dan komponen UI.
  domain: Berisi logika bisnis, kasus penggunaan, dan entitas.

## Navigation

**app_router.dart**: Mengelola perutean di seluruh aplikasi, menggunakan paket GoRouter untuk navigasi deklaratif.

# App Architecture

Aplikasi ini mengikuti prinsip arsitektur yang bersih untuk memastikan basis kode yang dapat dipelihara dan diskalakan:

- Lapisan Data: Bertanggung jawab untuk mengambil data pertandingan dan statistik pemain (model, repositori).
  Lapisan Domain: Berisi logika bisnis, termasuk kasus penggunaan dan entitas yang berinteraksi dengan data.
- Lapisan Presentasi: Menangani elemen UI, interaksi pengguna, dan manajemen status (menggunakan BLoC).
  Lapisan Inti: Komponen bersama seperti pengaturan tema, utilitas, dan ekstensi.

# Getting Started

git clone https://github.com/Zammil00/football_matches

## Install Dependencies

flutter pub get

# Running the App

Untuk Android:
flutter run --release
Untuk iOS:
flutter run --release --target lib/main.dart

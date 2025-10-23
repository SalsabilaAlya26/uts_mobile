# 📱 Shalat & Dzikriku

Aplikasi mobile berbasis **Flutter** yang membantu pengguna Muslim dalam menjalankan ibadah sehari-hari seperti shalat, dzikir, dan membaca doa harian.
Aplikasi ini mengusung tema **“Pinky Coquette Aesthetic”** — tampilan lembut, modern, dan menenangkan yang dirancang agar pengguna merasa nyaman dan fokus beribadah.

---

## 🎯 Tujuan Aplikasi

Aplikasi ini bertujuan untuk:

* Menjadi teman digital spiritual yang membantu pengguna dalam melaksanakan ibadah harian.
* Menghadirkan pengalaman beribadah yang modern, interaktif, dan estetis.
* Menunjukkan penerapan pengembangan aplikasi Flutter dengan navigasi multi-halaman, integrasi data lokal (JSON), dan API eksternal.

---

## 🧩 Tema & Desain

* **Tema:** Pinky Coquette Aesthetic
* **Warna dominan:** Gradasi pink muda dan putih
* **Font:**

  * Poppins (utama, modern dan mudah dibaca)
  * Sacramento (judul dan sapaan elegan)
* **Gaya desain:** Minimalis, lembut, dan konsisten di seluruh halaman

---

## 📖 Daftar Halaman & Fungsinya

| Halaman             | Fungsi Utama                                                                                   |
| ------------------- | ---------------------------------------------------------------------------------------------- |
| **Splash Screen**   | Menyapa pengguna dengan ucapan *Assalamu’alaikum* sebelum masuk aplikasi.                      |
| **Welcome Page**    | Tampilan sambutan dengan tombol *Login* dan *Register*.                                        |
| **Login Page**      | Form untuk masuk akun (data dummy pada tahap UTS).                                             |
| **Register Page**   | Form pendaftaran pengguna baru.                                                                |
| **Home Page**       | Beranda utama berisi 7 fitur utama (Tasbih, Doa, Reminder, Catatan, Kiblat, Tracker, Setting). |
| **Tasbih Page**     | Penghitung dzikir digital dengan tombol *Tambah*, *Kurangi*, dan *Reset*.                      |
| **Doa Harian Page** | Menampilkan daftar doa dari file lokal `doa_dummy.json`.                                       |
| **Doa Detail Page** | Menampilkan teks doa lengkap (Arab & terjemahan).                                              |
| **Reminder Page**   | Menampilkan jadwal shalat real-time menggunakan **API Aladhan**.                               |
| **Note Page**       | Fitur menulis catatan pribadi atau doa (CRUD sederhana).                                       |
| **Qiblah Page**     | Kompas arah kiblat (dummy, siap integrasi API MyQuran).                                        |
| **Tracker Page**    | Pelacak shalat harian dengan checkbox tiap waktu shalat.                                       |
| **Setting Page**    | Profil pengguna sederhana dan tombol *Logout*.                                                 |

---

## 🗺️ Alur Navigasi Aplikasi

Berikut **diagram flowchart** alur navigasi aplikasi *Shalat & Dzikriku*:

<img width="548" height="598" alt="image" src="https://github.com/user-attachments/assets/b1086ecb-1b46-4eb6-b4f0-41964c2619bd" />


### 🔍 Penjelasan Alur Flowchart:

1. **Splash Screen**
   Menjadi tampilan pertama saat aplikasi dijalankan, menampilkan salam pembuka dan tombol *Mulai*.
2. **Welcome Page**
   Pengguna dapat memilih untuk *Login*, *Register*, atau langsung masuk ke aplikasi sebagai tamu.
3. **Login/Register Page**
   Digunakan untuk autentikasi pengguna. Setelah berhasil login atau register, pengguna diarahkan ke **Home Page**.
4. **Home Page**
   Berfungsi sebagai pusat navigasi utama, menampilkan grid menu menuju seluruh fitur aplikasi.
5. Dari **Home Page**, pengguna dapat berpindah ke:

   * **Tasbih Page** untuk menghitung dzikir.
   * **Doa Harian Page** untuk membaca doa dan menampilkan **Doa Detail Page**.
   * **Reminder Page** untuk melihat jadwal shalat dari API.
   * **Note Page** untuk mencatat aktivitas atau doa pribadi.
   * **Qiblah Page** untuk melihat arah kiblat.
   * **Tracker Page** untuk menandai shalat yang sudah dilakukan.
   * **Setting Page** untuk mengatur profil atau logout.
6. Dari setiap halaman, pengguna dapat kembali ke **Home Page** menggunakan tombol *Back* atau navigasi Flutter default.

Flowchart ini menunjukkan hubungan hierarkis dan jalur interaksi antarhalaman agar navigasi aplikasi lebih mudah dipahami oleh pengembang maupun pengguna baru.

---

## 🏗️ Struktur Proyek

```
lib/
│
├── main.dart
├── pages/
│   ├── splash_screen.dart
│   ├── welcome_page.dart
│   ├── login_page.dart
│   ├── register_page.dart
│   ├── home_page.dart
│   ├── doa_page.dart
│   ├── doa_detail_page.dart
│   ├── reminder_page.dart
│   ├── note_page.dart
│   ├── qiblah_page.dart
│   ├── tasbih_page.dart
│   ├── tracker_page.dart
│   ├── setting_page.dart
│
├── assets/
│   └── data/
│       └── doa_dummy.json
│
└── pubspec.yaml
```

---

## ⚙️ Langkah Menjalankan Aplikasi

1. **Persiapkan Lingkungan**

   * Pastikan telah menginstal **Flutter SDK** dan **Android Studio / VS Code**.
   * Pastikan emulator Android atau perangkat fisik sudah siap.

2. **Clone atau Ekstrak Proyek**

   ```bash
   git clone https://github.com/username/shalat_dzikirku.git
   cd shalat_dzikirku
   ```

3. **Instal Dependency**

   ```bash
   flutter pub get
   ```

4. **Jalankan Aplikasi**

   ```bash
   flutter run
   ```

5. **Opsional (Testing API)**

   * Pastikan koneksi internet aktif agar fitur **Reminder (Jadwal Sholat)** dapat menampilkan data dari API Aladhan.

---

## 🔗 Integrasi Data

* **JSON Lokal:** `assets/data/doa_dummy.json` → daftar doa harian.
* **API Aladhan:** menampilkan jadwal shalat berdasarkan koordinat Kota Malang.

---

## 🚀 Pengembangan Lanjutan (Tahap UAS)

* Integrasi Firebase Authentication untuk login/register nyata.
* CRUD penuh untuk doa dan catatan menggunakan Firestore.
* Implementasi API arah kiblat dan notifikasi waktu shalat.
* Penambahan mode gelap (Dark Mode).

---

## 👩‍💻 Pengembang

**Nama:** Salsabila Alya Putri Waluyo

**NIM:** 230605110015

**Kelas:** Praktikum Pemrograman Mobile – E

**Dosen Pengampu:** A’la Syauqi, M.Kom

**Institusi:** Universitas Islam Negeri Maulana Malik Ibrahim Malang

---

© 2025 — *Shalat & Dzikriku* · Built with Flutter 💖

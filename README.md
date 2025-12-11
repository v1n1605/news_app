# 📰 News App

Aplikasi Berita

Aplikasi Flutter sederhana untuk menampilkan berita terkini dari seluruh dunia menggunakan [NewsAPI.org](https://newsapi.org).  
Dilengkapi dengan fitur kategori, pencarian berita, dan mode tampilan **Dark/Light** yang bisa diganti secara langsung.

---

## ✨ **Fitur Utama**

✅ **Berita Global (Real-time)**  
Menampilkan berita dari seluruh dunia berdasarkan kata kunci atau kategori.  

✅ **Kategori Berita**  
Filter berita berdasarkan topik seperti Technology, Sports, Health, Business, Entertainment, dll.  

✅ **Pencarian (Search)**  
Cari berita berdasarkan kata kunci tertentu.  

✅ **Dark & Light Theme**  
Pengguna dapat mengganti tema aplikasi langsung dari AppBar.  

✅ **Detail Berita (WebView)**  
Membaca berita lengkap langsung di dalam aplikasi menggunakan WebView.  

---

## 🛠️ **Teknologi yang Digunakan**

| Teknologi | Deskripsi |
|------------|------------|
| **Flutter** | Framework utama untuk membangun aplikasi |
| **Provider** | State Management sederhana untuk Flutter |
| **HTTP** | Mengambil data dari REST API (NewsAPI) |
| **WebView** | Menampilkan halaman berita secara penuh |
| **NewsAPI.org** | Sumber data berita (API publik gratis) |

---

---

## 🚀 **Cara Menjalankan Project**

### 1 Clone Repository
git clone https://github.com/v1n1605/news_app.git
cd news_app

### 2 Install Dependency
flutter pub get

### 3 Jalankan Aplikasi
flutter run

## 🔑 **API Key Setup**
1. Daftar di https://newsapi.org
2. Get API Key
3. Masukkan API key kamu ke file lib/services/news_service.dart di bagian:
  static const String apiKey = 'YOUR_API_KEY_HERE';

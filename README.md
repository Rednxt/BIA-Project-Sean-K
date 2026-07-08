# 🏗️ Data Warehouse & BI System for Mining Equipment Optimization

**Mata Kuliah:** Business Intelligence and Analytics (BIA) - Tugas 1  
**Penulis:** Sean Kenneth Tommy Keleyan  
**NIM:** 2702751694  

---

## Deskripsi Proyek
Repositori ini berisi keseluruhan _requirements_ untuk Tugas 1 mata kuliah *Business Intelligence and Analytics*. Proyek ini berfokus pada perancangan arsitektur *Data Warehouse* untuk mengoptimalkan inventori suku cadang kritis serta memanajemen *downtime* alat berat pada industri pertambangan. 

Studi kasus berfokus pada transisi dari sistem pelaporan reaktif (silo data antara sistem CMMS dan ERP) menuju arsitektur pemeliharaan prediktif (*Predictive Maintenance*) berbasis data terpusat.

---

## 📂 Struktur Folder dan Isi Repositori
Di dalam repositori/folder ini, terdapat 6 (enam) *file* utama yang merupakan syarat pengumpulan tugas. Berikut adalah rincian isi dari masing-masing *file*:

1. **`BIA Tugas 1 - Sean Kenneth Tommy Keleyan.docx`**  
   **Fungsi:** Dokumen laporan utama (Bab I - III).  
   **Isi:** Mencakup latar belakang permasalahan organisasi, profil dan analisis kualitas *dataset* mentah, serta penjabaran metodologi operasional *Extract, Transform, Load* (ETL) yang diaplikasikan untuk merombak data menjadi struktur *Data Warehouse*.

2. **`BIA_Project_Code_Sean_K.ipynb`**  
   **Fungsi:** Skrip komputasi *Extract, Transform, Load* (ETL).  
   **Isi:** *Source code* berbasis Python (Jupyter/Google Colab) yang menangani pembersihan data renggang (*sparsity resolution*), standarisasi format waktu, dan *Feature Engineering* untuk menghasilkan parameter analitik seperti `Machine_Stress_Level`.

3. **`PPT BIA Project - Sean Kenneth Tommy Keleyan.pdf`**  
   **Fungsi:** Salindia (*slide*) presentasi proyek Tugas 1.  
   **Isi:** Rangkuman visual yang mendemonstrasikan latar belakang masalah, identifikasi *Silo Data*, rancangan *Enterprise Bus Matrix*, dan cetak biru transformasi operasional menuju skema multidimensional.

4. **`Skema_DW_Tambang.sql`**  
   **Fungsi:** Skrip pembentuk kerangka basis data (*Database Schema*).  
   **Isi:** Kode SQL (*Data Definition Language* / DDL) untuk membangun arsitektur 3 *Star Schema*. Terdiri dari instruksi pembuatan 4 Tabel Dimensi (`Dim_Machine`, `Dim_Part`, `Dim_Plant`, `Dim_Date`) dan 3 Tabel Fakta (`Fact_Demand`, `Fact_Telemetry`, `Fact_Breakdown`).

5. **`synthetic_industrial_machine_data.csv`**  
   **Fungsi:** *Dataset* operasional mentah (*Raw Data*).  
   **Isi:** Data awal berformat *flat-file* yang memuat log harian telemetri mesin, pengeluaran inventori suku cadang, dan pencatatan insiden kerusakan. *File* ini menjadi sumber utama sebelum diproses oleh *pipeline* ETL.

6. **`Link Video Presentasi BIA - Sean K.txt`**  
   **Fungsi:** Tautan dokumentasi penjelasan proyek.  
   **Isi:** Berisi *link* akses Google Drive untuk menonton rekaman video presentasi. 
---

## Metodologi & Arsitektur
Proyek ini mengadopsi kerangka kerja **CRISP-DM** dan pendekatan pemodelan dimensional **Kimball**. Proses orkestrasi data dilakukan melalui:
* **Transformasi Data (Python/Pandas):** Merombak *flat-file* yang berantakan menjadi skema relasional murni.
* **Arsitektur DW:** Pembentukan 3 *Star Schema* (Logistik, Telemetri, dan Insiden) yang saling diikat oleh *Enterprise Bus Matrix* untuk mencegah *error* dan memastikan integritas *Single Source of Truth*.

## Cara Penggunaan (How to Use)
1. **Laporan & Presentasi:** Buka *file* `.docx` dan `.pdf` untuk meninjau fondasi arsitektur dan metodologi proyek.
2. **Menjalankan ETL:** Buka *file* `.ipynb` menggunakan *environment* Jupyter atau Google Colab. Pastikan *file* `.csv` berada dalam satu direktori yang sama saat menjalankan skrip.
3. **Menguji Skema DB:** *Copy-paste* isi dari *file* `.sql` ke dalam sistem manajemen *database* (seperti phpMyAdmin, DBeaver, atau MySQL Workbench) untuk melihat struktur relasional otomatis dari arsitektur DW yang dibangun.

---

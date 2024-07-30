import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 16), // Tambahkan jarak antara gambar dan teks
            Text(
              'Foto Profil',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/img-profil.png'),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    // Aksi untuk mengubah foto profil
                  },
                  child: Text(
                    'Ubah',
                    style: TextStyle(color: secondaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Nama Lengkap',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan Nama Lengkap',
                hintStyle:
                    TextStyle(color: Colors.grey[350]), // Ubah warna hint text
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12, horizontal: 10), // Atur ukuran kotak
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan Email',
                hintStyle:
                    TextStyle(color: Colors.grey[350]), // Ubah warna hint text
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12, horizontal: 10), // Atur ukuran kotak
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nomor Telepon',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Masukkan Nomor Telepon',
                hintStyle:
                    TextStyle(color: Colors.grey[350]), // Ubah warna hint text
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 12, horizontal: 10), // Atur ukuran kotak
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi untuk menyimpan perubahan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                child: Text(
                  'Simpan',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

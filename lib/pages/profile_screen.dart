import 'package:burger_app/controllers/auth_controller.dart';
import 'package:burger_app/pages/editprofil.dart';
import 'package:burger_app/pages/ubahpassword.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50), // Jarak dari atas
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/img-profil.png'),
            ),
            SizedBox(height: 5),
            Text(
              SpUtil.getString("nama_user").toString(),
              style: blackTextstyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 45),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 0.0), // Geser teks ke kiri
              title: Text(
                'Edit Profil',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 0.0), // Geser teks ke kiri
              title: Text(
                'Ubah Password',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UbahPasswordScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 0.0), // Geser teks ke kiri
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          'Yakin ingin sign out?',
                          style: TextStyle(
                              fontSize: 18), // Ukuran teks lebih kecil
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text(
                            'Tidak Jadi',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 10),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                authC.logout();

                                //Navigator.of(context).pushReplacement(
                                // MaterialPageRoute(
                                // builder: (context) => LoginPage(),
                                // ),
                                // );
                              },
                              child: Text(
                                ' Log Out',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          // Navigasi berdasarkan index
          switch (index) {
            case 0:
              // Aksi untuk Beranda
              break;
            case 1:
              // Aksi untuk Keranjang
              break;
            case 2:
              // Aksi untuk Pesanan
              break;
            case 3:
              // Aksi untuk Profil (Halaman saat ini)
              break;
          }
        },
      ),
    );
  }
}

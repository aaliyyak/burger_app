import 'dart:ui';

import 'package:burger_app/pages/home_screen.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';

class ProsesPage extends StatelessWidget {
  const ProsesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: MediaQuery.of(context).size.height * 0.15,
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Pesananmu sudah\nDiterima!",
                textAlign: TextAlign.center,
                style: blackTextstyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset("assets/img-proses.png"),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Pesananmu sedang diproses dan akan segera di antarkan ke tempatmu, mohon ditunggu ya!",
                textAlign: TextAlign.center,
                style: greyTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
              ),
              onPressed: null,
              child: Text("Cek Pesanan", style: blackTextstyle, ),
            ),
            SizedBox(
              height: 23,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen() ));
              },
              child: Center(child: Text("Kembali ke Beranda", style: secodaryTextstyle, ))),
          ],
        ),
      ),
    );
  }
}
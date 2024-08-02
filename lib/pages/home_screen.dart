import 'package:burger_app/pages/cart_screen.dart';
import 'package:burger_app/pages/landing_page.dart';
import 'package:burger_app/pages/order_screen.dart';
import 'package:burger_app/pages/profile_screen.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // siapkan variabel untuk nilai awal tab bottom navigation barnya
  int selectedIndex = 0;

  // variabel screen/page apa saja yg akan dipakai
  static List<Widget> screenList = [
    LandingPage(), //0
    CartPage(), //1
    OrderPage(), //2
    ProfileScreen(), //3

    ///3
  ];

  // buat fungsi tap.nya
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Keranjang"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Pesanan"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],

        // atribut konfigurasi bottomnavigationbarnya
        currentIndex: selectedIndex,
        selectedItemColor: secondaryColor,
        unselectedItemColor: blackColor,
        onTap: onItemTapped,
        backgroundColor: whiteColor,
        type: BottomNavigationBarType.fixed,
      ),
      body: screenList.elementAt(selectedIndex),
    );
  }
}

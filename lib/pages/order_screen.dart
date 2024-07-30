import 'package:burger_app/themes/themes.dart';
import 'package:burger_app/widget/order_widget.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            Text(
              "Riwayat Pesanan",
              style: blackTextstyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //panggil order widgets
            OrderWidget(
              nama: "Beef Burger",
              imageUrl: "assets/burger1.png",
              harga: "20000",
              qty: "1",
              status: "Diproses",
            ),

            OrderWidget(
              nama: "Regular Burger",
              imageUrl: "assets/burger2.png",
              harga: "15000",
              qty: "1",
              status: "Selesai",
            ),
          ],
        ),
      ),
    );
  }
}

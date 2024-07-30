import 'package:burger_app/config/config.dart';
import 'package:burger_app/models/product_model.dart';
//import 'package:burger_app/models/product_model.dart';

import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:burger_app/controllers/cart_controller.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key, required this.dataProduct});

  final ProductModel dataProduct;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  // variabel jumlah
  int jumlah = 1;

  // fungsi menambah
  void increment() {
    setState(() {
      jumlah++;
    });
  }

  // fungsi mengurang
  void decrement() {
    setState(() {
      if (jumlah > 1) {
        jumlah--;
      }
    });
  }

  Widget build(BuildContext context) {
    // panggil CartController (jgn lupa import terlebih dahulu get.dart )
    final cartC = Get.put(CartController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Burger",
          style: blackTextstyle,
        ),
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Image.network(
              widget.dataProduct.gambar,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        widget.dataProduct.namaProduct,
                        style: blackTextstyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      Config.convertToIdr(
                          int.parse(widget.dataProduct.harga), 0),
                      style: greyTextstyle.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        decrement();
                      },
                      child: Image.asset(
                        "assets/ic-kurang.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(jumlah.toString()),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        increment();
                      },
                      child: Image.asset(
                        "assets/ic-tambah.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Detail
            SizedBox(
              height: 20,
            ),
            Text(
              "Detail",
              style: blackTextstyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            HtmlWidget(widget.dataProduct.spesifikasi),

            // Komposisi
            SizedBox(
              height: 20,
            ),
            Text(
              "Komposisi",
              style: blackTextstyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Roti, seledri, wijen, bawang bombai, daging sapi, keju..",
              style: greyTextstyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      // BottomNavigation
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // keranjang
            Container(
              width: 150,
              height: 42,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  cartC.postCart(
                      widget.dataProduct.id.toString(), jumlah.toString());
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 19,
                    right: 19,
                  ),
                  child: Text(
                    "+ Keranjang",
                    style: blackTextstyle,
                  ),
                ),
              ),
            ),

            // Pesan Sekarang
            InkWell(
              onTap: () {
                cartC.postCartNow(widget.dataProduct.id.toString(),
                    widget.dataProduct, jumlah.toString());
              },
              child: Container(
                width: 150,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: redColor, width: 2),
                ),
                child: Center(
                    child: Text(
                  "Pesan Sekarang",
                  style: secodaryTextstyle,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

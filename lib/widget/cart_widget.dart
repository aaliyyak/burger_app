import 'package:burger_app/config/config.dart';
import 'package:burger_app/models/Cart_model.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartWidget extends StatefulWidget {
  CartWidget({super.key, required this.dataCart});

  // buat variabel untuk menerima data (panggil CartModel)
  final CartModel dataCart;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10), // Atur padding sesuai kebutuhan
            child: SizedBox(
              width: 140,
              height: 140, // Tentukan tinggi yang tetap untuk gambar
              child: Image.network(
                widget.dataCart.gambar,
                fit: BoxFit.cover, // Sesuaikan penyesuaian gambar
              ),
            ),
          ),
          SizedBox(width: 10), // Jarak antara gambar dan teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.dataCart.namaProduct,
                  style: blackTextstyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5), // Jarak antara teks
                Text(
                  Config.convertToIdr(int.parse(widget.dataCart.totalharga), 0),
                  style: greyTextstyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5), // Jarak antara teks
                Row(
                  children: [
                    Image.asset(
                      "assets/ic-kurang.png",
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(width: 10), // Jarak antara ikon
                    Text(
                      widget.dataCart.jumlah,
                      style: blackTextstyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10), // Jarak antara teks
                    Image.asset(
                      "assets/ic-tambah.png",
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ), // Jarak antara teks dan tombol
                Container(
                  width: 80,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    onPressed: null,
                    child: Text(
                      "Pesan",
                      style: blackTextstyle.copyWith(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

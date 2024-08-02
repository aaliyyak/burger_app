import 'package:burger_app/config/config.dart';
import 'package:burger_app/controllers/checkout_controller.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage(
      {super.key,
      required this.namaLengkap,
      required this.nohp,
      required this.alamat,
      required this.metodePembayaran,
      required this.nama,
      required this.harga,
      required this.qty,
      required this.imageUrl,
      required this.idCart,
      required this.totalharga});

  // siaplan variabel penerima data dari halaman sebelumnya (order now page)
  // variabel penerima data detail pemesan
  final String namaLengkap, nohp, alamat, metodePembayaran, idCart, totalharga;

  // variabel penerima data detail burger
  final String nama, harga, qty, imageUrl;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    final checkoutC = Get.put(CheckoutController());

    // variabel hitungannya
    int totHarga = int.parse(widget.harga) * int.parse(widget.qty);
    int ongkir = 10000;
    int totBayar = totHarga + ongkir;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          "Pesan Burger",
          style: blackTextstyle,
        ),
        centerTitle: true,
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
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: whiteColor),
            child: Row(
              children: [
                Image.network(
                  widget.imageUrl,
                  width: 105,
                  height: 105,
                ),
                SizedBox(
                  width: 21,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nama,
                      style: blackTextstyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(Config.convertToIdr(int.parse(widget.harga), 0),
                        style: greyTextstyle),
                    Text("Qty : ${widget.qty} ", style: greyTextstyle),
                    Text(
                      "Total : " +
                          Config.convertToIdr(
                              int.parse(totHarga.toString()), 0),
                      style: greyTextstyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Detail Pemesan
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Detail Pemesan",
                    style: blackTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Nama Lengkap",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.namaLengkap,
                    style: greyTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Nomor Telepon",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.nohp,
                    style: greyTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Alamat",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.alamat,
                    style: greyTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Metode Bayar
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            color: whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Metode Bayar",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.metodePembayaran,
                    style: greyTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // rincian belanja
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            color: whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rincian Belanja",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.nama,
                        style: greyTextstyle,
                      ),
                      Text(
                        Config.convertToIdr(int.parse(totHarga.toString()), 0),
                        style: secodaryTextstyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ongkos Kirim",
                        style: greyTextstyle,
                      ),
                      Text(
                        Config.convertToIdr(int.parse(ongkir.toString()), 0),
                        style: secodaryTextstyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: blackTextstyle,
                      ),
                      Text(
                        Config.convertToIdr(int.parse(totBayar.toString()), 0),
                        style: secodaryTextstyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // note
          SizedBox(
            height: 13,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Text(
              "*Pastikan semua data sudah benar sebelum klik tombol pesan.",
              style: greyTextstyle,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: whiteColor,
        child: Container(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: primaryColor),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProsesPage() ));
                checkoutC.postCheckoutbyId(widget.idCart, widget.namaLengkap,
                    widget.nohp, widget.alamat, widget.metodePembayaran);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 19,
                  right: 19,
                ),
                child: Text(
                  "Pesan Sekarang",
                  style: blackTextstyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

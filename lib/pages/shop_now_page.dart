import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:burger_app/config/config.dart';
import 'package:get/get.dart';
import 'package:burger_app/models/Cart_model.dart';
import 'konfirmorder.dart';

class ShopNowPage extends StatefulWidget {
  const ShopNowPage(
      {super.key,
      required this.dataOrder,
      required this.jumlahBeli,
      required this.idCart,
      required this.totalharga});

  final String jumlahBeli;
  final CartModel dataOrder;
  final int idCart;
  final int totalharga;

  @override
  State<ShopNowPage> createState() => _ShopNowPageState();
}

class _ShopNowPageState extends State<ShopNowPage> {
  //variable default pilihan metode pembayaran
  String metodePembayaran = "Cash On Delivery (COD)";

  //VARIABLE UNTUK MENGIRIM NILAI (MENGGUNAKAN INPUTAN TEXTEDITING CONTROLLER
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            width: double.infinity,
            child: Row(
              children: [
                //image
                Image.network(
                  widget.dataOrder.gambar,
                  width: 105,
                  height: 105,
                ),
                SizedBox(
                  width: 21,
                ),
                //coluumn
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.dataOrder.namaProduct,
                      style:
                          blackTextstyle.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      Config.convertToIdr(
                          int.parse(widget.dataOrder.totalharga), 0),
                      style: greyTextstyle,
                    ),
                    Text(
                      "Qty : ${widget.jumlahBeli}",
                      style: greyTextstyle,
                    ),
                    Text(
                      Config.convertToIdr(
                          int.parse(widget.dataOrder.totalharga.toString()), 0),
                      style: greyTextstyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
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
                    style: blackTextstyle,
                  ),
                  Text(
                    "Nama Lengkap",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: namaLengkap,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Nama Lengkap",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Nomor Telepon",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: nohp,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Nomor Telepon",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Alamat",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: alamat,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Alamat ",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(color: whiteColor),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Metode Pembayaran",
                    style: blackTextstyle,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
                          width: 3,
                        ),
                      ),
                    ),
                    value: metodePembayaran,
                    items: <String>['Cash On Delivery (COD)', 'Transfer Bank']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: blackTextstyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        metodePembayaran = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
                Get.to(CheckoutPage(
                  namaLengkap: namaLengkap.text,
                  nohp: nohp.text,
                  alamat: alamat.text,
                  metodePembayaran: metodePembayaran,
                  nama: widget.dataOrder.namaProduct,
                  harga: widget.dataOrder.totalharga,
                  qty: widget.jumlahBeli,
                  imageUrl: widget.dataOrder.gambar,
                  idCart: widget.idCart.toString(),
                  totalharga: widget.totalharga.toString(),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 19,
                  right: 19,
                ),
                child: Text(
                  "Konfirmasi",
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

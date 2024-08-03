import 'dart:io';

import 'package:burger_app/config/config.dart';
import 'package:burger_app/controllers/checkout_controller.dart';
import 'package:burger_app/models/Checkout_model.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:burger_app/widget/order_widget.dart';

import 'package:burger_app/widget/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key, required this.dataOrder});

  // variabel untuk menanmpung data model (CheckoutModel)
  final CheckoutModel dataOrder;

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  // panggil controller checkout
  final checkoutC = Get.put(CheckoutController());

  // function pilih source untuk gambar
  takeImage(mContext) {
    return showDialog(
      context: mContext,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Pilih',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            SimpleDialogOption(
              child: Row(
                children: const [
                  Icon(Icons.camera_alt),
                  Text(
                    'Kamera',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                checkoutC.getImage(ImageSource.camera);
              },
            ),
            SimpleDialogOption(
              child: Row(
                children: const [
                  Icon(Icons.image),
                  Text(
                    'Galeri ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Get.back();
                checkoutC.getImage(ImageSource.gallery);
              },
            ),
            SimpleDialogOption(
              child: Container(
                alignment: Alignment.bottomRight,
                child: const Text(
                  'Batal',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Lacak Pesanan",
          style: blackTextstyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 37),
        child: ListView(
          children: [
            OrderWidget(
              checkoutModel: widget.dataOrder,
            ),
            SizedBox(
              height: 10,
            ),

            // status widget
            StatusWidget(
              status: widget.dataOrder.status,
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: widget.dataOrder.status == '0'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bukti Bayar"),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Obx(
                            () => checkoutC.selectedImagePath.value == ""
                                ? Image.asset(
                                    'assets/ic_photo.png',
                                    width: 100,
                                    height: 100,
                                  )
                                : Image.file(
                                    File(checkoutC.selectedImagePath.value),
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: primaryColor),
                            onPressed: () {
                              takeImage(context);
                            },
                            child: Text("Pilih File"),
                          ),
                        ),
                        Divider(),
                        widget.dataOrder.buktibayar == null
                            ? Text("Belum ada bukti bayar")
                            : Image.network(
                                Config.urlMain +
                                    'storage/' +
                                    widget.dataOrder.buktibayar,
                                width: double.infinity,
                              ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        widget.dataOrder.buktibayar == null
                            ? Text("Belum ada bukti bayar")
                            : Image.network(
                                Config.urlMain +
                                    'storage/' +
                                    widget.dataOrder.buktibayar,
                                width: double.infinity,
                              ),
                      ],
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: whiteColor,
        child: Container(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: widget.dataOrder.status == "0"
                ? TextButton(
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {
                      if (checkoutC.selectedImagePath.value == "") {
                        Get.snackbar("Error", "No file choose!");
                      } else {
                        checkoutC
                            .uploadBuktiBayar(widget.dataOrder.id.toString());
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        left: 19,
                        right: 19,
                      ),
                      child: Text(
                        "Upload Bukti Bayar",
                        style: blackTextstyle,
                      ),
                    ),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}

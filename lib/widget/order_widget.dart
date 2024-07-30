import 'package:burger_app/config/config.dart';
import 'package:burger_app/pages/order_detail.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderWidget extends StatelessWidget {
  OrderWidget(
      {super.key,
      required this.nama,
      required this.harga,
      required this.imageUrl,
      required this.qty,
      required this.status});

  String nama, harga, imageUrl, qty, status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderDetail(
                      nama: nama,
                      harga: harga,
                      imageUrl: imageUrl,
                      qty: qty,
                      status: status,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // image
            Image.asset(
              imageUrl,
              width: 105,
              height: 105,
            ),
            SizedBox(
              width: 21,
            ),
            // column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: blackTextstyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  Config.convertToIdr(int.parse(harga), 0),
                  style: greyTextstyle,
                ),
                Text(
                  "Qty : ${qty}",
                  style: greyTextstyle,
                ),
                Text(
                  status,
                  style: status == "Diproses"
                      ? primaryTextstyle.copyWith(
                          fontWeight: FontWeight.w600,
                        )
                      : greenTextstyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

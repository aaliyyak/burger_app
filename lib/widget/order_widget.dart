import 'package:burger_app/models/Checkout_model.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';

class OrderWidget extends StatelessWidget {
  OrderWidget({super.key, required this.checkoutModel});

  final CheckoutModel checkoutModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
            Image.network(
              checkoutModel.item.gambar,
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
                Text('Kode : ' + checkoutModel.kodeTransaksi),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    checkoutModel.item.namaProduct,
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  Config.convertToIdr(int.parse(checkoutModel.grandTotal), 0),
                  style: greyTextstyle,
                ),
                Text(
                  "Qty : ${checkoutModel.item.jumlah}",
                  style: greyTextstyle,
                ),
                Text(
                  checkoutModel.status == "0"
                      ? 'Baru'
                      : checkoutModel.status == "1"
                          ? "Diproses"
                          : "Selesai",
                  style: checkoutModel.status == "0"
                      ? primaryTextstyle.copyWith(
                          fontWeight: FontWeight.w600,
                        )
                      : checkoutModel.status == "1"
                          ? greyTextstyle.copyWith(
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

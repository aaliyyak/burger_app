import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatusWidget extends StatelessWidget {
  StatusWidget({super.key, required this.status});

  String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: whiteColor),
      child: Container(
        margin: EdgeInsets.only(top: 11, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Status",
              style: blackTextstyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    status == "Diproses"
                        ? Image.asset("assets/Ellipse2.png")
                        : Image.asset("assets/Ellipse1.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Pesanan Diterima",
                      style: greyTextstyle,
                    ),
                    Spacer(),
                    Text(
                      "11.00",
                      style: greyTextstyle,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Image.asset(
                    "assets/Line1.png",
                    height: 20,
                  ),
                ),
                Row(
                  children: [
                    status == "Selesai"
                        ? Image.asset("assets/Ellipse2.png")
                        : Image.asset("assets/Ellipse1.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Pesanan Selesai",
                      style: greyTextstyle,
                    ),
                    Spacer(),
                    Text(
                      "10.30",
                      style: greyTextstyle,
                    ),
                  ],
                ),
                Divider(
                  thickness: 5,
                  color: primaryColor,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:burger_app/themes/themes.dart';
import 'package:burger_app/widget/order_widget.dart';
import 'package:burger_app/widget/status_widget.dart';
import 'package:flutter/material.dart';
import 'package:burger_app/models/Checkout_model.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({
    super.key,
    required this.checkoutModel,
  });

  final CheckoutModel checkoutModel;

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
              checkoutModel: checkoutModel,
            ),
            SizedBox(
              height: 10,
            ),
            // status widget
            StatusWidget(
              status: checkoutModel.status,
            ),
          ],
        ),
      ),
    );
  }
}

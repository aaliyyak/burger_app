import 'package:burger_app/models/Checkout_model.dart';
import 'package:burger_app/services/checkout_services.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:burger_app/widget/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 15,
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
            FutureBuilder<List<CheckoutModel>>(
                future: CheckoutSerives()
                    .listCheckoutAll(SpUtil.getInt('id_user').toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return Column(
                      children: [
                        ...snapshot.data!.map((dataOrder) {
                          //panggil order widgets
                          return OrderWidget(
                            checkoutModel: dataOrder,
                          );
                        })
                      ],
                    );
                  }

                  return Container();
                }),
          ],
        ),
      ),
    );
  }
}

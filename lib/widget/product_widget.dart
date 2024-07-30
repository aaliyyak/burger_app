import 'package:burger_app/config/config.dart';
import 'package:burger_app/models/product_model.dart';
import 'package:burger_app/pages/product_detail.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  ProductWidget({super.key, required this.dataProduct});

  // buat variabel untuk menerima data (panggil ProductModel)
  final ProductModel dataProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => ProductDetail(
                      dataProduct: dataProduct,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                dataProduct.gambar,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(
                dataProduct.namaProduct,
                style: blackTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(Config.convertToIdr(int.parse(dataProduct.harga), 0),
                  style: greyTextstyle),
            ),
          ],
        ),
      ),
    );
  }
}

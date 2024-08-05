import 'package:burger_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/product_services.dart';
import '../themes/themes.dart';
import '../widget/product_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.keyword});

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        title: Text("Hasil Pencarian : " + keyword, style: blackTextstyle, ),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios, color: blackColor,)),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(

            children: [
              SizedBox(height: 20,),
              // loading data menggunakan widget FutureBuilder
            FutureBuilder<List<ProductModel>>(
              // untuk memanggil data
              future: ProductServices.searchProduct(keyword),
              builder: (context, snapshot) {
                // saat loading...
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // tampilkan widget CircularProgressIndicator
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    ),
                  );
                }
                // setelah data didapatkan
                else if (snapshot.hasData) {
                  return // list product
                      Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 12,
                      childAspectRatio: 5 / 7,
                      mainAxisSpacing: 12,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ...snapshot.data!.map((data) {
                          return ProductWidget(dataProduct: data);
                        })
                      ],
                    ),
                  );
                }
                // defautl agar future builder bisa berfungsi
                return Container();
              },
            ),
            ],

        ),
      ),
    );
  }
}
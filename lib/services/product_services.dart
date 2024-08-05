import 'dart:convert';

import 'package:burger_app/config/config.dart';
import 'package:burger_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  // function untuk request data ke API (endppoint : product-list)
  static Future<List<ProductModel> > getProductList() async {
    // siapkan variabel utk menyimpan list product
    List<ProductModel> listProduct = [];

    try {
      // buat variabel untuk request web service
      var response = await http.get( Uri.parse(Config().urlProdAll) );

      // jika statuscode == 200  (success)
      if(response.statusCode == 200) {
        // ambil isi body dr output json (postman)
        var responseBody = json.decode(response.body);

        // buat variabel utk menampung isi dari response body
        List listAllProductResponse = responseBody["data"];

        // isian variabel listProduct dengan isi dari listAllProductResponse
        listAllProductResponse.forEach((data) {
          listProduct.add(ProductModel.fromJson(data));
         });

      } else {
        listProduct = [];
      }

    } catch (e) {
      print(e);
    }
    return listProduct;
  }


  static Future<List<ProductModel> > searchProduct(String keyword) async {
    // siapkan variabel utk menyimpan list product
    List<ProductModel> listProduct = [];

    try {
      // buat variabel untuk request web service
      var response = await http.get( Uri.parse(Config().urlProdSearch + keyword) );

      // jika statuscode == 200  (success)
      if(response.statusCode == 200) {
        // ambil isi body dr output json (postman)
        var responseBody = json.decode(response.body);

        // buat variabel utk menampung isi dari response body
        List listAllProductResponse = responseBody["data"];

        // isian variabel listProduct dengan isi dari listAllProductResponse
        listAllProductResponse.forEach((data) {
          listProduct.add(ProductModel.fromJson(data));
         });

      } else {
        listProduct = [];
      }

    } catch (e) {
      print(e);
    }
    return listProduct;
  }
}
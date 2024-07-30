import 'package:http/http.dart' as http;
import 'package:burger_app/models/Cart_model.dart';
import 'dart:convert';
import 'package:burger_app/config/config.dart';
import 'package:sp_util/sp_util.dart';

class CartServices {
  // function untuk request data ke API (endppoint : keranjang-list)

  static Future<List<CartModel>> getCartList() async {
    // siapkan variabel utk mengambil data id_user yang telah tersimpan saat login
    var userId = SpUtil.getInt('id_user');
    // siapkan variabel utk mengambil  list product
    List<CartModel> listCart = [];

    try {
      // buat variabel untuk request web service
      var response = await http
          .get(Uri.parse(Config().urlKeranjangList + userId.toString()));

      // jika statuscode == 200  (success)
      if (response.statusCode == 200) {
        // ambil isi body dr output json (postman)
        var responseBody = json.decode(response.body);

        // buat variabel utk menampung isi dari response body
        List listAllProductResponse = responseBody["data"];
        // isian variabel listProduct dengan isi dari listAllProductResponse
        listAllProductResponse.forEach((data) {
          listCart.add(CartModel.fromJson(data));
        });
      } else {
        listCart = [];
      }
    } catch (e) {
      print(e);
    }
    return listCart;
  }
}

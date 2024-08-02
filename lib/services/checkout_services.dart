import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/config.dart';
import '../models/Checkout_model.dart';

class CheckoutSerives {
  // function menampilkan keranjang
  Future<List<CheckoutModel>> listCheckoutAll(String userId) async {
    // siapkan variabel untuk menyimpan list prooduct
    List<CheckoutModel> listCheckoutNew = [];

    try {
      // buat variabel untuk merequest web service
      var response =
          await http.get(Uri.parse(Config().urlCheckoutListAll + userId));

      // jika hasil output pd request status codenya adalah 200
      if (response.statusCode == 200) {
        // ambil isi body dari output json dan decode jsonnya
        var responseBody = json.decode(response.body);
        print(responseBody);
        // buat variabel utk menampung data dari response body yg ingin diambil isinya
        List listCheckoutNewResponse = responseBody['data'];
        // isikan variabel listCheckoutNew di atas (pd baris 13) yg tadinya [] dengan isi dari variabel
        // listCheckoutNewResponse yg sudah menerima response dr web service
        listCheckoutNewResponse.forEach((data) {
          listCheckoutNew.add(CheckoutModel.fromJson(data));
        });
      } else {
        listCheckoutNew = [];
      }
    } catch (e) {
      print(e);
    }
    return listCheckoutNew;
  }
}

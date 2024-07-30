import 'dart:convert';

import 'package:burger_app/config/config.dart';
import 'package:burger_app/pages/proses_page.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class CheckoutController extends GetxController {
  // function utk chcekout
  Future postCheckoutbyId(String keranjangId, String nama, String nohp,
      String alamat, String jenisPembayaran) async {
    // url request ke web service
    var url = Uri.parse(Config().urlCheckoutPostById);

    try {
      final response = await http.post(url, body: {
        'keranjang_id': keranjangId,
        'user_id': SpUtil.getInt("id_user").toString(),
        'nama': nama,
        'nohp': nohp,
        'alamat': alamat,
        'jenis_pembayaran': jenisPembayaran
      });

      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar("Success", responseDecode["message"]);
        //  kembalikan ke halaman HomePage
        Get.offAll(ProsesPage());
      } else {
        Get.snackbar("Failed", responseDecode["message"],
            backgroundColor: primaryColor, colorText: whiteColor);
      }
    } catch (e) {
      Get.snackbar("Failed", e.toString(),
          backgroundColor: primaryColor, colorText: whiteColor);
    }
  }
}

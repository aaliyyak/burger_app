import 'dart:convert';
import 'dart:io';

import 'package:burger_app/config/config.dart';
import 'package:burger_app/pages/proses_page.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
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
      print(responseDecode);
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

  // membuat fungsi untuk upload gambar
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // function upload
  void getImage(ImageSource imageSource) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: imageSource,
      maxHeight: 720,
      maxWidth: 1280,
    );

    // kondisi jika gambar diambil ataupun tidak
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;

      // resize
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb ";
    } else {
      Get.snackbar("Warning!", "No file Choose",
          backgroundColor: primaryColor,
          colorText: whiteColor,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // fungsi mengirim file ke website admin
  Future<void> uploadBuktiBayar(String checkoutId) async {
    // siapkan variabel url end point web service
    var url = Uri.parse(Config().uploadBuktiBayar);
    try {
      var request = http.MultipartRequest('POST', url);
      // parameter2 yg akan dikirim
      request.files.add(await http.MultipartFile.fromPath(
          'buktibayar', selectedImagePath.value));
      request.fields['checkout_id'] = checkoutId;

      // kirim kan request dari flutter ke web service
      http.Response response =
          await http.Response.fromStream(await request.send());

      // ambil response json dari output web service
      var responseDecode = jsonDecode(response.body);

      if (responseDecode["success"] == true) {
        Get.snackbar("Success", responseDecode["message"]);
      } else {
        Get.snackbar("Failed", responseDecode["message"]);
      }
    } catch (e) {
      Get.snackbar("Failed", e.toString());
    }
  }
}

import 'dart:convert';

import 'package:burger_app/config/config.dart';
import 'package:burger_app/pages/home_screen.dart';
import 'package:burger_app/pages/splash_page.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// untuk konek ke http/network
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
  // siapkan variabel inputan utk login/register
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController(
      text: SpUtil.getString("email") == "" ? "" : SpUtil.getString("email"));
  TextEditingController password = TextEditingController(
      text: SpUtil.getString("password") == ""
          ? ""
          : SpUtil.getString("password"));
  TextEditingController telepon = TextEditingController();

  // variabel utk menampung loading
  RxBool isLoading = false.obs;

  // function login
  Future login() async {
    // variabel untk menampung url endpoint fungsi login
    var url = Uri.parse(Config().urlLogin);

    // buat prosesnya
    try {
      // loading = true
      isLoading.value = true;
      // fungsi utk mengirim data ke web service
      final response = await http.post(url, body: {
        'email': email.text,
        'password': password.text,
      });

      SpUtil.putString("password", password.text);
      SpUtil.putString("email", email.text);
      //print hasil dari variabel response di atas
      print(response.body);

      // agar isi dari response body bisa dipakai, maka harus didecode dulu
      var responseDecode = json.decode(response.body);

      // handle error validation
      // Map<String, dynamic> errorValidation = responseDecode["data"];

      // ambil statuscode
      // jika statuscode == 200 (berhasil)
      if (response.statusCode == 200) {
        // ambil data dari response yg didapatkan dr webservice dan simpan di memori hp
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("nama_user", responseDecode["data"]["name"]);
        SpUtil.putString("email_user", responseDecode["data"]["email"]);
        SpUtil.putString("telepon_user", responseDecode["data"]["telepon"]);
        isLoading.value = false;
        // arahkan ke halaman homepage
        Get.offAll(HomeScreen());
      } else {
        // Get.snackbar("Error", responseDecode["message"] == "Error Validation" ? errorValidation.toString() : responseDecode["message"] );
        isLoading.value = false;
        Get.snackbar("Error", responseDecode["message"],
            backgroundColor: redColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(),
          backgroundColor: redColor,
          colorText: whiteColor,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10));
    }
  }

  // function login
  Future register() async {
    // variabel untk menampung url endpoint fungsi login
    var url = Uri.parse(Config().urlRegister);

    // buat prosesnya
    try {
      isLoading.value = true;
      // fungsi utk mengirim data ke web service
      final response = await http.post(url, body: {
        'name': name.text,
        'email': email.text,
        'password': password.text,
        'telepon': telepon.text,
      });

      SpUtil.putString("password", password.text);
      SpUtil.putString("email", email.text);

      //print hasil dari variabel response di atas
      print(response.body);

      // agar isi dari response body bisa dipakai, maka harus didecode dulu
      var responseDecode = json.decode(response.body);

      // handle error validation
      Map<String, dynamic> errorValidation = responseDecode["data"];

      // ambil statuscode
      // jika statuscode == 200 (berhasil)
      if (response.statusCode == 200) {
        // ambil data dari response yg didapatkan dr webservice dan simpan di memori hp
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("nama_user", responseDecode["data"]["name"]);
        SpUtil.putString("email_user", responseDecode["data"]["email"]);
        SpUtil.putString("telepon_user", responseDecode["data"]["telepon"]);
        isLoading.value = false;
        // arahkan ke halaman homepage
        Get.offAll(HomeScreen());
      } else {
        isLoading.value = false;
        Get.snackbar(
            "Error",
            responseDecode["message"] == "Error Validation"
                ? errorValidation.toString()
                : responseDecode["message"],
            backgroundColor: redColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));

        // Get.snackbar("Error", responseDecode["message"], backgroundColor: redColor, colorText: whiteColor, snackPosition: SnackPosition.TOP, margin: EdgeInsets.all(10)  );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(),
          backgroundColor: redColor,
          colorText: whiteColor,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10));
    }
  }

  // function logout
  Future logout() async {
    var url = Uri.parse(Config().urlLogout);

    try {
      final response = await http.get(url);
      var responseDecode = json.decode(response.body);
      if (response.statusCode == 200) {
        // hapus seluruh data yg tersimpan di SpUtil yg tersimpan d hp
        // SpUtil.clear();

        // menghapus satu2 data yg disimpan SpUtil
        SpUtil.remove("id_user");
        SpUtil.remove("nama_user");
        SpUtil.remove("email_user");
        SpUtil.remove("telepon_user");
        // alert
        Get.snackbar("Success", responseDecode["message"],
            backgroundColor: greenColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));

        // kembalikan ke halaman splash
        Get.offAll(SplashPage());
      } else {
        Get.snackbar("Error", responseDecode["message"],
            backgroundColor: redColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: redColor,
          colorText: whiteColor,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10));
    }
  }
}

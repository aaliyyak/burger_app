import 'dart:convert';
import 'package:burger_app/config/config.dart';
import 'package:burger_app/pages/home_screen.dart';
import 'package:burger_app/pages/splash_page.dart';
import 'package:burger_app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
  // Existing controllers for email and password
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController(
      text: SpUtil.getString("email") ?? "");
  TextEditingController password = TextEditingController(
      text: SpUtil.getString("password") ?? "");
  TextEditingController telepon = TextEditingController();

  // New variable for password visibility
  var isPasswordVisible = false.obs;

  // variabel utk menampung loading
  RxBool isLoading = false.obs;

  // function login
  Future login() async {
    var url = Uri.parse(Config().urlLogin);

    try {
      isLoading.value = true;
      final response = await http.post(url, body: {
        'email': email.text,
        'password': password.text,
      });

      SpUtil.putString("password", password.text);
      SpUtil.putString("email", email.text);

      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("nama_user", responseDecode["data"]["name"]);
        SpUtil.putString("email_user", responseDecode["data"]["email"]);
        SpUtil.putString("telepon_user", responseDecode["data"]["telepon"]);
        isLoading.value = false;
        Get.offAll(HomeScreen());
      } else {
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

  // function register
  Future register() async {
    var url = Uri.parse(Config().urlRegister);

    try {
      isLoading.value = true;
      final response = await http.post(url, body: {
        'name': name.text,
        'email': email.text,
        'password': password.text,
        'telepon': telepon.text,
      });

      SpUtil.putString("password", password.text);
      SpUtil.putString("email", email.text);

      var responseDecode = json.decode(response.body);
      Map<String, dynamic> errorValidation = responseDecode["data"];

      if (response.statusCode == 200) {
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("nama_user", responseDecode["data"]["name"]);
        SpUtil.putString("email_user", responseDecode["data"]["email"]);
        SpUtil.putString("telepon_user", responseDecode["data"]["telepon"]);
        isLoading.value = false;
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
        SpUtil.remove("id_user");
        SpUtil.remove("nama_user");
        SpUtil.remove("email_user");
        SpUtil.remove("telepon_user");
        Get.snackbar("Success", responseDecode["message"],
            backgroundColor: greenColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));
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

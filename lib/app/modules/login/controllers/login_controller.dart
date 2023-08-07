import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutterdeteksi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser(String email, String password) async {
    var url = 'http://192.168.43.171:5000/login';

    var body = {'email': email, 'password': password};
    dev.log(email.toString());
    dev.log(password.toString());
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    if (response.statusCode == 200) {
      dev.log("login berhasil");
      Get.offAllNamed(Routes.DASBOARD);
      var responseData = json.decode(response.body);
      var token = responseData['token'];
      dev.log("Token: $token");
    } else if (response.statusCode == 400) {
      dev.log("Terjadi kesalahan: ${response.body}");
    } else {
      dev.log("terjadi kesalahan saat melakukan login");
    }
  }
}

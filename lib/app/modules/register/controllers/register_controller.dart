import 'dart:convert';
import 'package:flutterdeteksi/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  final firstnameController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registerUser(String firstname, String email, String password,
      String confirmPassword) async {
    var url = 'http://192.168.43.171:5000/register';

  
    var body = {
      'firstname': firstname,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };

    // Mengirim permintaan POST ke endpoint Flask
    print(firstname);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    if (response.statusCode == 201) {
      // Registrasi berhasil
      print('Registrasi Berhasil. Silahkan cek email untuk verifikasi.');
    } else if (response.statusCode == 400) {
      // Kesalahan pada permintaan (misalnya password tidak cocok)
      print('Terjadi kesalahan: ${response.body}');
    } else {
      // Kesalahan lainnya
      print('Terjadi kesalahan saat melakukan registrasi.');
    }
  }
}

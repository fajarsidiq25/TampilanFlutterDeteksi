import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class KameraController extends GetxController {
  final count = 0.obs;
  late Timer time;
  @override
  void onInit() {
    time =
        Timer.periodic(const Duration(seconds: 1), (Timer timer) => getData());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void getData() async {
    var url = 'http://192.168.43.171:5000/realtime';
    var response = await http
        .post(Uri.parse(url), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      dev.log("login berhasil");
      var responseData = json.decode(response.body);
      dev.log(responseData.toString());
      return responseData;
    } else {
      dev.log("terjadi kesalahan saat melakukan login");
    }
  }
}

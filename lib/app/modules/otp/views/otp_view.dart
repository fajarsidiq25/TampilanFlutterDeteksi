import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:flutterdeteksi/app/modules/login/views/login_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<VerifyOtpController> {
  OtpView({Key? key}) : super(key: key);
  VerifyOtpController verifyOtpController = Get.put(VerifyOtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Verifikasi Akun Anda",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
              Text(
                "Masukan kode OTP pada Email Anda",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              OtpTextField(
                handleControllers: (controllers) => VerifyOtpController(),
                numberOfFields: 5,
                borderColor: Colors.blue,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  verifyOtpController.verifyOTP(verificationCode);
                }, // end onSubmit
              ),
            ],
          )),
    );
  }
}

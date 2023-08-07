import 'package:flutter/material.dart';
import 'package:flutterdeteksi/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../login/views/login_view.dart';
import '../controllers/register_controller.dart';
import 'package:flutter/gestures.dart';

// class RegisterView extends GetView<RegisterController> {
//   const RegisterView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('RegisterView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'RegisterView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class RegisterView extends GetView<RegisterController> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  RegisterView({Key? key}) : super(key: key) {
    // Inisialisasi kontroller
    Get.put(RegisterController());
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.LOGIN);
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              alignment: Alignment.center,
              child: Column(children: [
                Form(
                    key: _formKey,
                    child: Column(children: [
                      GestureDetector(
                        child: Stack(
                          children: [
                            Container(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Register',
                        style: GoogleFonts.poppins(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Create your account",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 50),
                      TextFormField(
                        controller: firstnameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Firstname",
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.password_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: const Icon(Icons.password_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'By signing you agree to our ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            ' Terms of use',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'and ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            ' privacy notice',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                        width: 10,
                      ),
                      SizedBox(
                          height: 60,
                          width: 300,
                          child: GetBuilder<RegisterController>(
                            init:
                                RegisterController(), // Inisialisasi controller
                            builder: (controller) {
                              return ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ))),
                                onPressed: () {
                                  // Mengambil instance RegisterController
                                  var registerController =
                                      Get.find<RegisterController>();

                                  // Mengambil nilai dari TextField
                                  var firstname = firstnameController.text;

                                  var email = emailController.text;
                                  var password = passwordController.text;
                                  var confirmPassword =
                                      confirmPasswordController.text;

                                  // Memanggil fungsi registerUser dengan parameter-parameter yang diperlukan
                                  registerController.registerUser(firstname,
                                      email, password, confirmPassword);

                                  Get.offAllNamed(Routes.OTP);
                                },
                                child: const Text('REGISTER'),
                              );
                            },
                          )),
                    ])),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

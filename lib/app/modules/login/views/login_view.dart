import 'package:flutter/material.dart';
import 'package:flutterdeteksi/app/modules/register/views/register_view.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginView({Key? key}) : super(key: key) {
    // Inisialisasi kontroller
    Get.put(LoginController());
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     color: Colors.black,
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Get.offAllNamed(Routes.HOME);
      //     },
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              alignment: Alignment.center,
              child: Column(
                children: [
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
                      const SizedBox(height: 250),
                      Text(
                        "Welcome back",
                        style: GoogleFonts.poppins(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Login to your account",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 60),
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
                      const SizedBox(
                        height: 50,
                        width: 10,
                      ),
                      SizedBox(
                          height: 60,
                          width: 300,
                          child: GetBuilder<LoginController>(
                            init: LoginController(), // Inisialisasi controller
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
                                  var loginController =
                                      Get.find<LoginController>();

                                  // Mengambil nilai dari TextField

                                  var email = emailController.text;
                                  var password = passwordController.text;

                                  // Memanggil fungsi registerUser dengan parameter-parameter yang diperlukan
                                  loginController.loginUser(email, password);

                                  // Get.offAllNamed(Routes.OTP);
                                },
                                child: const Text('LOGIN'),
                              );
                            },
                          )),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        //child: Text('Don\'t have an account? Create'),
                        child: Text.rich(TextSpan(children: [
                          const TextSpan(text: "Don't have an account? "),
                          TextSpan(
                            text: 'Register',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterView()));
                              },
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ])),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

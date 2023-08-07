import 'package:flutterdeteksi/app/modules/Kamera/bindings/kamera_binding.dart';
import 'package:flutterdeteksi/app/modules/Kamera/views/kamera_view.dart';
import 'package:get/get.dart';

import '../modules/History/bindings/history_binding.dart';
import '../modules/History/views/history_view.dart';
import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/dasboard/bindings/dasboard_binding.dart';
import '../modules/dasboard/views/dasboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';

import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DASBOARD,
      page: () => const DashboardView(),
      binding: DasboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.KAMERA,
      page: () => KameraScreen(),
      binding: KameraBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
  ];
}

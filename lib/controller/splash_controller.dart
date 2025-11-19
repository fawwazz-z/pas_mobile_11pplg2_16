import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 10));
    final pref = await SharedPreferences.getInstance();

    final token = pref.getString("token");

    if (token != null) {
      Get.offAllNamed(AppRoutes.bottomNav);
    } else {
      Get.offAllNamed(AppRoutes.loginPages);
    }
  }
}

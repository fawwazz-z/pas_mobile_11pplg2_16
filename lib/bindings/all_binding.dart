import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_16/controller/bottom_nav_controller.dart';
import 'package:pas_mobile_11pplg2_16/controller/splash_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<AuthController>(() => AuthController());

  }
}

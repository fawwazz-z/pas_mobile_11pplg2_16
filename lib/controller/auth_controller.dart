import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/model/login_model.dart';
import 'package:pas_mobile_11pplg2_16/model/register_model.dart';
import 'package:pas_mobile_11pplg2_16/network/network_api.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_16/routes/routes.dart';
import 'package:pas_mobile_11pplg2_16/theme/color.dart';
import 'package:pas_mobile_11pplg2_16/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();

  var loginResponse = Rxn<LoginModel>();
  var registerResponse = Rxn<RegisterModel>();
  var isLoading = false.obs;

  void login() async {
    final usernameToString = username.text.trim();
    final passwordToString = password.text.trim();
    print("Username : ${usernameToString}");
    print("Password : ${passwordToString}");

    final url = Uri.parse("${NetworkApi.BASE_URL}/api/latihan/login");

    try {
      isLoading.value = true;

      final res = await http.post(
        url,
        body: {"username": usernameToString, "password": passwordToString},
      );

      if (res.statusCode == 200) {
        final LoginModel loginModel = loginModelFromJson(res.body);
        loginResponse.value = loginModel;
        print("login status : ${loginModel.status}");
        if (loginModel.status == true) {
          final pref = await SharedPreferences.getInstance();
          pref.setString("token", loginModel.token.toString());

          Get.snackbar(
            "Login Pages",
            loginModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.secondarygreen,
            colorText: AppColor.neutrallight,
          );

          Get.offNamed(AppRoutes.bottomNav);
        } else {
          Get.snackbar(
            "Auth",
            loginModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.secondaryred,
            colorText: AppColor.neutrallight,
          );
        }
      } else {
        Get.snackbar(
          "Login Pages",
          "Login Gagal: Status ${res.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.secondaryred,
          colorText: AppColor.neutrallight,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Login Pages",
        "Koneksi Gagal",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.secondaryred,
        colorText: AppColor.neutrallight,
      );
      print("Error Login: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void register() async {
    final usernameTs = username.text.trim();
    final passwordTs = password.text.trim();
    final fullNameTs = fullName.text.trim();
    final emailTs = email.text.trim();

    final url = Uri.parse("${NetworkApi.BASE_URL}/api/latihan/register-user");

    try {
      isLoading.value = true;

      final res = await http.post(
        url,
        body: {
          "username": usernameTs,
          "password": passwordTs,
          "full_name": fullNameTs,
          "email": emailTs,
        },
      );

      if (res.statusCode == 200) {
        final RegisterModel registerModel = registerModelFromJson(res.body);
        registerResponse.value = registerModel;

        if (registerModel.status == true) {
          Get.snackbar(
            "Register Pages",
            registerModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.secondarygreen,
            colorText: AppColor.neutrallight,
          );

          username.clear();
          password.clear();
          isLoading.value = false;
          Get.offNamed(AppRoutes.loginPages);
        } else {
          Get.snackbar(
            "Register Pages",
            registerModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.secondaryred,
            colorText: AppColor.neutrallight,
          );
        }
      } else {
        Get.snackbar(
          "Register Pages",
          "Register Gagal: Status ${res.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.secondaryred,
          colorText: AppColor.neutrallight,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Register Pages",
        "Koneksi Gagal",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.secondaryred,
        colorText: AppColor.neutrallight,
      );
      print("Error Login: $e");
    } finally {
      isLoading.value == false;
    }
  }

  void logout() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove("token");
    Get.snackbar(
      "Information",
      "Logout successfuly",
      backgroundColor: AppColor.secondarygreen,
      colorText: AppColor.neutrallight,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
    Get.offAllNamed(AppRoutes.loginPages);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/routes/pages.dart';
import 'package:pas_mobile_11pplg2_16/routes/routes.dart';
import 'package:pas_mobile_11pplg2_16/theme/color.dart';
import 'package:pas_mobile_11pplg2_16/widget/button_widget.dart';
import 'package:pas_mobile_11pplg2_16/widget/textfields_widget.dart';
import 'package:pas_mobile_11pplg2_16/controller/auth_controller.dart';

class RegisterPages extends StatelessWidget {
  RegisterPages({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Register Pages",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15),
                TextfieldsWidget(
                  label: "Username",
                  prefixIcon: Icon(Icons.person),
                  controller: controller.username,
                ),
                SizedBox(height: 15),
                TextfieldsWidget(
                  label: "Password",
                  prefixIcon: Icon(Icons.password),
                  obscureText: true,
                  controller: controller.password,
                ),
                SizedBox(height: 15),
                TextfieldsWidget(
                  label: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  controller: controller.fullName,
                ),
                SizedBox(height: 15),
                TextfieldsWidget(
                  label: "Email",
                  prefixIcon: Icon(Icons.email),
                  controller: controller.email,
                ),
                SizedBox(height: 20),
                ButtonWidget(
                  text: "Daftar",
                  backgroundcolor: AppColor.primaryblue,
                  textcolor: AppColor.neutrallight,
                  onPressed: () {
                    controller.register();
                  },
                ),
                SizedBox(height: 15),
                ButtonWidget(
                  text: "Login",
                  backgroundcolor: AppColor.neutrallight,
                  textcolor: AppColor.primaryblue,
                  onPressed: () {
                    Get.toNamed(AppRoutes.loginPages);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

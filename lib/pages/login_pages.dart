import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/routes/pages.dart';
import 'package:pas_mobile_11pplg2_16/routes/routes.dart';
import 'package:pas_mobile_11pplg2_16/theme/color.dart';
import 'package:pas_mobile_11pplg2_16/widget/button_widget.dart';
import 'package:pas_mobile_11pplg2_16/widget/textfields_widget.dart';
import 'package:pas_mobile_11pplg2_16/controller/auth_controller.dart';

class LoginPages extends StatelessWidget {
  LoginPages({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF243B55),
              Color(0xFF141E30),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 10,
            color: Colors.white.withOpacity(0.95),
            shadowColor: Colors.black45,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    "Welcomee",
                    style: TextStyle(
                      color: Colors.blueGrey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      color: Colors.blueGrey.shade600,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Username
                  TextfieldsWidget(
                    label: "Username",
                    prefixIcon: const Icon(Icons.person_outline),
                    controller: controller.username,
                  ),

                  const SizedBox(height: 15),

                  // Password
                  TextfieldsWidget(
                    label: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    obscureText: true,
                    controller: controller.password,
                  ),

                  const SizedBox(height: 25),

                  // Login Button
                  Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : ButtonWidget(
                            text: "Login",
                            textcolor: Colors.white,
                            backgroundcolor: const Color(0xFF1E88E5),
                            onPressed: () => controller.login(),
                          ),
                  ),

                  const SizedBox(height: 20),

                  // Register Button
                  ButtonWidget(
                    text: "Create Account",
                    textcolor: const Color(0xFF1E88E5),
                    backgroundcolor: Colors.white,
                    onPressed: () {
                      Get.toNamed(AppRoutes.registerPages);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/theme/color.dart';
import 'package:pas_mobile_11pplg2_16/controller/auth_controller.dart';

class ProfilePages extends StatelessWidget {
  ProfilePages({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 83, 76, 98),
              Color.fromARGB(255, 43, 46, 77),
            ],
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Avatar Glow
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.8),
                        Colors.white.withOpacity(0.2),
                      ],
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      "https://cdn.antaranews.com/cache/1200x800/2018/06/escudo-real-madridBrandingHorizontalThumb0.jpg",
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                Text(
                  "Fawwaz Labib",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Fawwazganteng@gmail.com",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.logout, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    label: Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: Text("Confirm Logout"),
                          content: Text("Kamu yakin ingin logout?"),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text("Tidak"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.logout();
                              },
                              child: Text("Iya"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

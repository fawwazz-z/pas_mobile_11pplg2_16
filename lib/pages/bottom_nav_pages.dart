import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/controller/bottom_nav_controller.dart';
import 'package:pas_mobile_11pplg2_16/theme/color.dart';

class BottomNavPages extends StatelessWidget {
  BottomNavPages({super.key});
  final controller = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.title[controller.currentIndex.value],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.neutrallight,
            ),
          ),
          backgroundColor: Color(0xFF0D1B2A),
          automaticallyImplyLeading: false,
          elevation: 2,
          centerTitle: false,
        ),
        body: controller.pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:Color(0xFF1B263B),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          elevation: 5,
          onTap: controller.changeIndex,
          currentIndex: controller.currentIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "Product",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

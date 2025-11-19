import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pas_mobile_11pplg2_16/routes/pages.dart';
import 'package:pas_mobile_11pplg2_16/routes/routes.dart';
import 'package:pas_mobile_11pplg2_16/routes/pages.dart';
import 'package:pas_mobile_11pplg2_16/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.splashpages,
      getPages: AppPages.pages,
    );
  }
}
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/bindings/all_binding.dart';
import 'package:pas_mobile_11pplg2_16/pages/bookmark_pages.dart';
import 'package:pas_mobile_11pplg2_16/pages/bottom_nav_pages.dart';
import 'package:pas_mobile_11pplg2_16/pages/login_pages.dart';
import 'package:pas_mobile_11pplg2_16/pages/profile_pages.dart';
import 'package:pas_mobile_11pplg2_16/pages/register_pages.dart';
import 'package:pas_mobile_11pplg2_16/pages/splash_pages.dart';
import 'package:pas_mobile_11pplg2_16/pages/tv_series_pages.dart';
import 'package:pas_mobile_11pplg2_16/routes/routes.dart';  
class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.loginPages,
      page: () => LoginPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.registerPages,
      page: () => RegisterPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.splashpages,
      page: () => SplashPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomNav,
      page: () => BottomNavPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.bookmarkPages,
      page: () => BookmarkPages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.profilePages,
      page: () => ProfilePages(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRoutes.tvSeriesPages,
      page: () => TvSeriesPages(),
      binding: AppBinding(),
    ),
  ];
}
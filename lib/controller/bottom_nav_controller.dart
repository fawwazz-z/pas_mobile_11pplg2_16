import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/model/tv_series_model.dart';
import 'package:pas_mobile_11pplg2_16/pages/bookmark_pages.dart';
import 'package:pas_mobile_11pplg2_16/pages/tv_series_pages.dart';
import 'package:pas_mobile_11pplg2_16/pages/profile_pages.dart';

class BottomNavController extends GetxController {
  final currentIndex = 0.obs;
  final pages = [TvSeriesPages(), BookmarkPages(), ProfilePages()];
  final title = ["Product Pages", "Bookmark Pages", "Profile Pages"];
  void changeIndex(int i) => currentIndex.value = i;
}

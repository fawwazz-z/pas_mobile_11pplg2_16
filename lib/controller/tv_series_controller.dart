import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_16/helper/db_helper.dart';
import 'package:pas_mobile_11pplg2_16/model/tv_series_model.dart';
import 'package:pas_mobile_11pplg2_16/network/network_api.dart';

class TvSeriesController extends GetxController {
  var isLoading = false.obs;
  var tvshowResponse = <TvSeries>[].obs;
  var tvshowMark = <TvSeries>[].obs;
  final db = DBHelper();

  get productResponse => null;

  get productMark => null;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getTvShow();
    getMarkShow();
  }

  void getTvShow() async {
    final url = Uri.parse("${NetworkApi.BASE_URL_TV}/shows");

    try {
      isLoading.value = true;

      final res = await http.get(url);

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final List productData = data;

        print("TV Show ${productData}");

        tvshowResponse.assignAll(
          productData.map((e) => TvSeries.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar(
          "Status ${res.statusCode}",
          "Gagal Mengambil Data",
          backgroundColor: NetworkApi.secondaryred,
          colorText: NetworkApi.neutrallight,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Info",
        e.toString(),
        backgroundColor: NetworkApi.secondarygreen,
        colorText: NetworkApi.neutrallight,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void addToBookmark(int i) async {
    final show = tvshowResponse[i];
    print("Data TV Show : ${show.name}");

    await db.markShow({
      'image': show.image.medium,
      'title': show.name,
      'type': show.type.name,
      'language': show.language.name,
    });

    Get.snackbar(
      'TV Show',
      'TV Show Berhasil Di Bookmark',
      snackPosition: SnackPosition.TOP,
      backgroundColor: NetworkApi.secondarygreen,
      colorText: NetworkApi.neutrallight,
      duration: Duration(seconds: 1),
    );

    getMarkShow();
  }

  void getMarkShow() async {
    final mapList = await db.getMarkShow();
    final list = mapList.map((row) => TvSeries.fromDb(row)).toList();
    tvshowMark.assignAll(list);
    print("TV Show di dalam bookmark: $list");
  }

  void deleteMarkShow(int i) async {
    final showTv = tvshowMark[i];

    await db.deleteShow(showTv.id);

    Get.snackbar(
      'TV Show',
      'TV Show Berhasil Di Hapus',
      snackPosition: SnackPosition.TOP,
      backgroundColor: NetworkApi.secondarygreen,
      colorText: NetworkApi.neutrallight,
      duration: Duration(seconds: 1),
    );

    print("Hapus Show Bookmark id: ${showTv.id}");

    getMarkShow();
  }

  void fetchMarkProduct() {}

  void deleteMarkTvSeries(int index) {}

  void markFavoriteProduct(int index) {}

  void fetchProduct() {}
}
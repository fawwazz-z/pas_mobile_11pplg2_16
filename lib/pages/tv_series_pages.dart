import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/controller/tv_series_controller.dart';
import 'package:pas_mobile_11pplg2_16/widget/tv_series_widget.dart';

class TvSeriesPages extends StatelessWidget {
  TvSeriesPages({super.key});

  final TvSeriesController controller = Get.put(TvSeriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final show = controller.tvshowResponse[index];
                return TvSeriesItemWidget(
                  image: show.image.medium,
                  title: show.name,
                  type: show.type.name,
                  category: show.language.name,
                  text: "Bookmark",
                  onFavoriteTap: () {
                    controller.addToBookmark(index);
                  }, language: '',
                );
              },
              itemCount: controller.tvshowResponse.length,
            ),
            onRefresh: () async {
              controller.getTvShow();
            },
          );
        }),
      ),
    );
  }
}
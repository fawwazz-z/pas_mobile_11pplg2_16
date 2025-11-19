import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_16/controller/tv_series_controller.dart';
import 'package:pas_mobile_11pplg2_16/theme/color.dart';
import 'package:pas_mobile_11pplg2_16/widget/tv_series_widget.dart';

class BookmarkPages extends StatelessWidget {
  BookmarkPages({super.key});
  final controller = Get.find<TvSeriesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.productMark.isEmpty) {
            return Center(
              child: Text(
                "Belum ada data favorite",
                style: TextStyle(
                  color: const Color.fromARGB(255, 36, 45, 59),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              controller.fetchMarkProduct();
            },
            child: ListView.builder(
              itemCount: controller.productMark.length,
              itemBuilder: (context, index) {
                final product = controller.productMark[index];

                return TvSeriesItemWidget(
                  image: product.image,
                  title: product.title,
                  price: product.price.toString(),
                  category: product.category.toString(),
                  text: "Hapus",
                  buttonCollor: AppColor.secondaryred,
                  prefixIcon: Icon(Icons.delete, color: AppColor.neutrallight),
                  onFavoriteTap: () {
                    controller.deleteMarkTvSeries(index);
                  }, type: '', language: '', onTapMark: () {  },
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

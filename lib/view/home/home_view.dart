import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view/home/components/home_categories.dart';
import 'package:wholesell_shop/view/home/components/home_populer_products.dart';
import 'package:wholesell_shop/view/home/components/home_slider.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  HomeSlider(controller: controller),
                  gapH(5),
                  Padding(
                    padding: screenPaddingH(),
                    child: Column(
                      children: [
                        HomeCategories(controller: controller),
                        gapH(5),
                        // HomePopulerProducts(controller: controller),
                        gapH(4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

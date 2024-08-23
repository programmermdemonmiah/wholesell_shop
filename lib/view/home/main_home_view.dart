import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view/home/components/featured_stores.dart';
import 'package:wholesell_shop/view/home/components/home_categories.dart';
import 'package:wholesell_shop/view/home/components/home_slider.dart';
import 'package:wholesell_shop/view/home/components/home_sliver_appbar.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: HomeSliverAppbar(
              controller: controller,
              onRefresh: () async {
                // return controller.onInit();
              },
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeSlider(controller: controller),
                  gapH(5),
                  Padding(
                    padding: screenPaddingH(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeCategories(controller: controller),
                        gapH(5),
                        // HomePopulerProducts(controller: controller),
                        Text(
                          S.deliverTo,
                          style: AppTextStyle.tittleBig3(context: context),
                        ),
                        gapH(3),
                        Container(
                          padding: edgeInsetsSym(2, 2),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.sp,
                                color: AppColors.black.withOpacity(0.2)),
                            borderRadius: radiusAll(2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.grid_view_outlined,
                                    size: 25.sp,
                                    color: AppColors.primaryColor,
                                  ),
                                  gapW(2),
                                  Text(
                                    S.others,
                                    style: AppTextStyle.tittleBig4(
                                        context: context),
                                  ),
                                ],
                              ),
                              gapH(2),
                              Text(
                                "utttara 15, Dhaka, Bangladesh",
                                style:
                                    AppTextStyle.paragraph3(context: context),
                              )
                            ],
                          ),
                        ),
                        gapH(7),
                      ],
                    ),
                  ),

                  //================================
                  //featured stores ========
                  //===========
                  FeaturedStores(controller: controller),

                  gapH(30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

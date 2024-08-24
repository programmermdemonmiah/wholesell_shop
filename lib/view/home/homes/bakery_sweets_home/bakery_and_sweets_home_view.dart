import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view/home/components/home_slider.dart';
import 'package:wholesell_shop/view/home/components/home_sliver_appbar.dart';
import 'package:wholesell_shop/view/home/components/homes/custom_homes_category.dart';
import 'package:wholesell_shop/view/home/homes/bakery_sweets_home/components/bakery_sweets_home_best_reviews_items.dart';
import 'package:wholesell_shop/view/home/homes/bakery_sweets_home/components/bakery_sweets_home_most_popular_items.dart';
import 'package:wholesell_shop/view/home/homes/bakery_sweets_home/components/bakery_sweets_home_store_section.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class BakeryAndSweetsHomeView extends StatelessWidget {
  final HomeController mainHomeController;
  const BakeryAndSweetsHomeView({super.key, required this.mainHomeController});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        mainHomeController.homeName.value = '';
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: HomeSliverAppbar(
            controller: mainHomeController,
            onRefresh: () async {
              // return controller.onInit();
            },
            child: ListView(
              children: [
                HomeSlider(controller: mainHomeController),
                gapH(5),
                Container(
                  height: 170.h,
                  color: AppColors.white,
                  alignment: Alignment.center,
                  padding: edgeInsetsSym(0, 6),
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // final data = controller.categorisDataList[index];
                      return CustomHomesCategory(
                        padding: index == 0
                            ? edgeInsetsOnly(4, 1, 0, 0)
                            : edgeInsetsSym(1, 0),
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKsYD_uPcZeePlmyRgNllIo1eNm1Yl93vWlQ&s',
                        title: 'Sweets \nCategory $index',
                      );
                    },
                  ),
                ),

                //===========
                //=====Most Popular Items ======
                //=============
                BakerySweetsHomeMostPopularItems(),

                gapH(7),
                //==============
                //==============best Reviewes Items ============
                //==================
                BakerySweetsHomeBestReviewsItems(),

                gapH(7),
                //=========
                //=======Stores===========
                //=============
                BakerySweetsHomeStoreSection(),

                //==================
                //=========================End=========
                //==============
                //end height navbar er jonne

                gapH(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

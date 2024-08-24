import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/model/cart/cart_products_model.dart';
import 'package:wholesell_shop/res/app_routes/app_routes.dart';
import 'package:wholesell_shop/res/app_routes/app_routes_name.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/widgets/custom_textformfild.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view/home/components/home_slider.dart';
import 'package:wholesell_shop/view/home/components/home_sliver_appbar.dart';
import 'package:wholesell_shop/view/home/components/homes/custom_homes_category.dart';
import 'package:wholesell_shop/view/home/components/homes/custom_homes_stores.dart';
import 'package:wholesell_shop/view/home/components/homes/custom_popular_items.dart';
import 'package:wholesell_shop/view/home/homes/food_home/components/food_home_best_reviews_items.dart';
import 'package:wholesell_shop/view/home/homes/food_home/components/food_home_most_popular_items.dart';
import 'package:wholesell_shop/view/home/homes/food_home/components/food_home_store_section.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';
import 'package:wholesell_shop/view_model/controller/home/homes/food_home_controller.dart';

class FoodHomeView extends StatelessWidget {
  final HomeController mainHomeController;
  const FoodHomeView({super.key, required this.mainHomeController});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        mainHomeController.homeName.value = '';
        return false;
      },
      child: GetBuilder<FoodHomeController>(builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: HomeSliverAppbar(
              controller: mainHomeController,
              onRefresh: () async {
                // return controller.onInit();
              },
              child: ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  HomeSlider(controller: mainHomeController),
                  gapH(7),

                  //================
                  //=======categories=============
                  //=================
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
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAWn-xcg-EcLtumUehSkH6GR02S9y4CwDJhw&s',
                          title: 'Food \nCategory $index',
                        );
                      },
                    ),
                  ),
                  gapH(5),

                  //===========
                  //=====Most Popular Items ======
                  //=============
                  FoodHomeMostPopularItems(),

                  gapH(7),
                  //==============
                  //==============best Reviewes Items ============
                  //==================
                  FoodHomeBestReviewsItems(),

                  gapH(7),
                  //=========
                  //=======Stores===========
                  //=============
                  FoodHomeStoreSection(),

                  //==================
                  //=========================End=========
                  //==============
                  //end height navbar er jonne

                  gapH(30),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

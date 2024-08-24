import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view/home/components/home_slider.dart';
import 'package:wholesell_shop/view/home/components/home_sliver_appbar.dart';
import 'package:wholesell_shop/view/home/components/homes/custom_homes_category.dart';
import 'package:wholesell_shop/view/home/homes/shopping_mall_home/components/shaopping_mall_home_best_reviews_items.dart';
import 'package:wholesell_shop/view/home/homes/shopping_mall_home/components/shopping_mall_home_most_popular_items.dart';
import 'package:wholesell_shop/view/home/homes/shopping_mall_home/components/shopping_mall_home_store_section.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class ShoppingMallHomeView extends StatelessWidget {
  final HomeController mainHomeController;
  const ShoppingMallHomeView({super.key, required this.mainHomeController});

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
                SizedBox(
                  height: 120.h,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 4,
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
                            'https://franchiseindia.s3.ap-south-1.amazonaws.com/uploads/content/fi/art/three-most-profitable-retail-cat-87b21383c6.jpg',
                        title: 'Category $index',
                      );
                    },
                  ),
                ),

                //===========
                //=====Most Popular Items ======
                //=============
                ShoppingMallHomeMostPopularItems(),

                gapH(7),
                //==============
                //==============best Reviewes Items ============
                //==================
                ShaoppingMallHomeBestReviewsItems(),

                gapH(7),
                //=========
                //=======Stores===========
                //=============
                ShoppingMallHomeStoreSection(),

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

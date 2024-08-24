import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view/home/components/home_slider.dart';
import 'package:wholesell_shop/view/home/components/home_sliver_appbar.dart';
import 'package:wholesell_shop/view/home/components/homes/custom_homes_category.dart';
import 'package:wholesell_shop/view/home/homes/grocery_home/components/grocery_home_most_popular_items.dart';
import 'package:wholesell_shop/view/home/homes/grocery_home/components/grocery_home_store_section.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class GroceryHomeView extends StatelessWidget {
  final HomeController mainHomeController;
  const GroceryHomeView({super.key, required this.mainHomeController});

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
                            'https://www.foodnavigator-usa.com/var/wrbm_gb_food_pharma/storage/images/7/7/5/0/3400577-1-eng-GB/Snacks-sweets-are-key-online-opportunity-categories-for-new-online-grocery-shoppers-Hartman-Group.jpg',
                        title: 'Category $index',
                      );
                    },
                  ),
                ),

                //===========
                //=====Most Popular Items ======
                //=============
                GroceryHomeMostPopularItems(),

                gapH(7),
                //==============
                //==============best Reviewes Items ============
                //==================
                GroceryHomeMostPopularItems(),

                gapH(7),
                //=========
                //=======Stores===========
                //=============
                GroceryHomeStoreSection(),

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

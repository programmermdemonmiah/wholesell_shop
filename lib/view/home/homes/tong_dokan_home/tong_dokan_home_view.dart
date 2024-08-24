import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view/home/components/home_slider.dart';
import 'package:wholesell_shop/view/home/components/home_sliver_appbar.dart';
import 'package:wholesell_shop/view/home/components/homes/custom_homes_category.dart';
import 'package:wholesell_shop/view/home/homes/tong_dokan_home/components/tong_dokan_home_best_reviews_items.dart';
import 'package:wholesell_shop/view/home/homes/tong_dokan_home/components/tong_dokan_home_store_section.dart';
import 'package:wholesell_shop/view/home/homes/tong_dokan_home/components/tong_dokan_home_most_popular_items.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class TongDokanHomeView extends StatelessWidget {
  final HomeController mainHomeController;
  const TongDokanHomeView({super.key, required this.mainHomeController});

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
                            'https://mir-s3-cdn-cf.behance.net/projects/404/0ac9ba167607851.Y3JvcCwyODc0LDIyNDgsNTYyLDA.jpg',
                        title: 'Category $index',
                      );
                    },
                  ),
                ),

                //===========
                //=====Most Popular Items ======
                //=============
                TongHomeMostPopularItems(),

                gapH(7),
                //==============
                //==============best Reviewes Items ============
                //==================
                TongDokanHomeBestReviewsItems(),

                gapH(7),
                //=========
                //=======Stores===========
                //=============
                TongDokanHomeStoreSection(),

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

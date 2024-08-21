import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class HomeCategories extends StatelessWidget {
  final HomeController controller;
  const HomeCategories({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteBg,
        borderRadius: radiusAll(2),
      ),
      child: GridView.builder(
        itemCount: 8,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 130.sp,
            mainAxisSpacing: 10.sp,
            crossAxisSpacing: 10.sp,
            mainAxisExtent: 120.sp
            // mainAxisExtent: 1 / 1,
            // childAspectRatio: 4 / 5,
            ),
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.black12,
            onTap: () {
              // controller.navigateCategoriesProductPage(
              //     categoriesName: "Categories Name Provide$index");
            },
            child: Container(
              // height: 50.sp,
              // width: 50.sp,
              decoration: BoxDecoration(
                  color: AppColors.whiteBg,
                  borderRadius: radiusAll(2),
                  border: Border.all(
                      width: 1.sp,
                      color: AppColors.orrageColor.withOpacity(0.3))),
              padding: edgeInsetsSym(1, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60.sp,
                    width: 60.sp,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    child: Text("image"),
                  ),
                  gapH(1.5),
                  Text(
                    "Category Name$index",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.tittleSmall2(context: context),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

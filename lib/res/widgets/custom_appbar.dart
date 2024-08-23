import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/app_routes/app_routes_name.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/utils/ui_const.dart';

PreferredSizeWidget customAppBar(
    {required String appBarTitle,
    required BuildContext context,
    // required String appBarSubTitle,
    bool Function(ScrollNotification)? notificationPredicate,
    Color? appBarBg,
    Color? leadingColor,
    bool isActionIcon = false,
    final bool? centerTitle,
    List<Widget>? actions,
    void Function()? leadingOnTap,
    Color? textColor}) {
  return AppBar(
    backgroundColor: appBarBg ?? AppColors.primaryColor,
    primary: true,
    centerTitle: centerTitle ?? false,
    foregroundColor: appBarBg ?? AppColors.primaryColor,
    notificationPredicate: notificationPredicate ?? (notification) => true,
    automaticallyImplyLeading: false,
    leading: InkWell(
        onTap: leadingOnTap ??
            () {
              Get.back();
            },
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: leadingColor ?? Colors.white,
          size: 25.sp,
        )),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appBarTitle,
          style: AppTextStyle.tittleBig1(
              context: context, color: textColor ?? Colors.white),
        ),
        // Text(
        //   appBarSubTitle,
        //   style: AppTextStyle.text4(
        //       context: context, color: textColor ?? Colors.white),
        // ),
      ],
    ),
    actions: isActionIcon
        ? actions ??
            [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutesName.cartView);
                },
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: leadingColor ?? Colors.white,
                  size: 25.sp,
                ),
              ),
              gapW(3),
            ]
        : [],
  );
}

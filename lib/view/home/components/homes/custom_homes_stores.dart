import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/widgets/image_load.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view/home/homes/bakery_sweets_home/components/bakery_sweets_home_most_popular_items.dart';

class CustomHomesStores extends StatelessWidget {
  final String imageUrl;
  final String shopName;
  final double ratingParcentange;
  final int rating;
  final String shopLocation;
  final String durationMinutes;
  final EdgeInsets padding;
  const CustomHomesStores({
    super.key,
    required this.imageUrl,
    required this.shopName,
    required this.rating,
    required this.ratingParcentange,
    required this.shopLocation,
    required this.durationMinutes,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Card(
        elevation: 5.sp,
        child: Container(
          padding: edgeInsetsSym(1, 1),
          decoration: BoxDecoration(
            borderRadius: radiusAll(2.5),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: edgeInsetsOnly(0, 0, 0, 4),
                    child: ClipRRect(
                      borderRadius: radiusOnly(2, 2, 0, 0),
                      child: Stack(
                        children: [
                          ImageLoad(
                            imageUrl: imageUrl,
                            height: 120.h,
                            width: Get.width,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 2.h,
                            right: 4.w,
                            child: Container(
                              padding: edgeInsetsAll(0.5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                size: 20.sp,
                                color: AppColors.primaryColor.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0.h,
                      right: 4.w,
                      child: Card(
                        elevation: 10,
                        child: Container(
                          padding: edgeInsetsSym(3, 1),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: radiusAll(7),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                size: 18.sp,
                                color: AppColors.primaryColor,
                              ),
                              gapW(2),
                              Text(
                                ratingParcentange.toString(),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: AppTextStyle.text4(context: context),
                              ),
                              gapW(2),
                              Text(
                                '($rating)',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style:
                                    AppTextStyle.paragraph3(context: context),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              Padding(
                padding: edgeInsetsSym(1, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shopName,
                      style: AppTextStyle.tittleSmall3(context: context),
                    ),
                    gapH(1),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primaryColor,
                          size: 18.sp,
                        ),
                        gapW(1),
                        Text(
                          shopLocation,
                          style: AppTextStyle.paragraph4(context: context),
                        ),
                      ],
                    ),
                    gapH(1),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: AppColors.primaryColor,
                          size: 18.sp,
                        ),
                        gapW(1),
                        Text(
                          durationMinutes,
                          style: AppTextStyle.paragraph4(context: context),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

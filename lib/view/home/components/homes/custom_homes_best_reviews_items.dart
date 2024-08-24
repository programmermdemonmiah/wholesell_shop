import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/widgets/image_load.dart';
import 'package:wholesell_shop/utils/ui_const.dart';

class CustomHomesBestReviewsItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final EdgeInsets padding;
  final double ratingParcentange;
  final int rating;
  final double price;
  final String itemSize;
  final Function() onTap;
  const CustomHomesBestReviewsItems({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.padding,
    required this.ratingParcentange,
    required this.rating,
    required this.price,
    required this.itemSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 180.w,
          // height: 260.h,
          // padding: edgeInsetsSym(1, 2),
          decoration: BoxDecoration(
            borderRadius: radiusAll(2),
            color: AppColors.white,
          ),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: radiusAll(2.3)),
            elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 251.h,
                      width: 180.w,
                      padding: edgeInsetsSym(2, 2),
                      decoration: BoxDecoration(
                        borderRadius: radiusAll(2.5),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
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
                          // Container(
                          //   padding: edgeInsetsAll(0.5),
                          //   decoration: const BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     color: AppColors.white,
                          //   ),
                          //   child: Icon(
                          //     Icons.add,
                          //     size: 20.sp,
                          //     color: AppColors.primaryColor.withOpacity(0.7),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: edgeInsetsOnly(0, 0, 4, 0),
                            child: Container(
                              width: 160.w,
                              padding: edgeInsetsSym(1, 2),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteBg,
                                  borderRadius: radiusOnly(2, 2, 0, 0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  gapH(1),
                                  Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: AppTextStyle.tittleSmall2(
                                        context: context),
                                  ),
                                  gapH(0.5),
                                  Row(
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
                                        style: AppTextStyle.text4(
                                            context: context),
                                      ),
                                      gapW(2),
                                      Text(
                                        '($rating)',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: AppTextStyle.paragraph3(
                                            context: context),
                                      ),
                                    ],
                                  ),
                                  gapH(0.5),
                                  Text(
                                    '($itemSize)',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: AppTextStyle.paragraph3(
                                        context: context),
                                  ),
                                  gapH(0.5),
                                  Text(
                                    '($price) ৳',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: AppTextStyle.tittleSmall4(
                                        context: context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1.sp,
                            child: Card(
                              child: Container(
                                padding: edgeInsetsSym(4, 0.5),
                                decoration: BoxDecoration(
                                  borderRadius: radiusAll(6),
                                  color: AppColors.white,
                                ),
                                child: Text(
                                  'Add',
                                  style: AppTextStyle.tittleSmall4(
                                    context: context,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

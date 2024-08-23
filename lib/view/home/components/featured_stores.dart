import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class FeaturedStores extends StatelessWidget {
  final HomeController controller;
  const FeaturedStores({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: screenPaddingH(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.featuredStores,
                  style: AppTextStyle.tittleBig3(context: context),
                ),
                Text(
                  S.seeAll,
                  style: AppTextStyle.tittleBig3(
                      context: context, color: AppColors.primaryColor),
                ),
              ],
            )),
        gapH(3),
        SizedBox(
          height: 175.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? edgeInsetsOnly(4, 0.5, 0, 0)
                    : edgeInsetsSym(0.5, 0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: radiusAll(2.5)),
                  child: Container(
                    width: 250.w,
                    decoration: BoxDecoration(
                      borderRadius: radiusAll(2.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 90.h,
                          width: 250.w,
                          decoration: BoxDecoration(
                            borderRadius: radiusOnly(2.5, 2.5, 0, 0),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://i.ytimg.com/vi/09Nw2GX20e4/maxresdefault.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        // gapH(2),
                        Padding(
                          padding: edgeInsetsSym(2, 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PALLI MART",
                                style:
                                    AppTextStyle.tittleSmall2(context: context),
                              ),
                              gapH(1),
                              Text(
                                "Dendabar, beside PalliBiddut Eid ga Math, Sylhet",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    AppTextStyle.paragraph4(context: context),
                              ),
                              gapH(1),
                              Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    Icon(
                                      Icons.star_border,
                                      size: 18.sp,
                                      color: AppColors.black.withOpacity(0.3),
                                    ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

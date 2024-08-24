import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/res/app_routes/app_routes.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/widgets/custom_textformfild.dart';
import 'package:wholesell_shop/res/widgets/image_load.dart';
import 'package:wholesell_shop/utils/ui_const.dart';

class CustomHomesCategory extends StatelessWidget {
  final String imageUrl;
  final String title;
  final EdgeInsets padding;
  // final Function() onTap;
  const CustomHomesCategory({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.padding,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: () {
          AppRoutes.goCategoryItemsView();
        },
        child: Container(
          width: 75.w,
          // height: 150.h,
          decoration: BoxDecoration(borderRadius: radiusAll(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: radiusAll(2),
                child: ImageLoad(
                  imageUrl: imageUrl,
                  height: 70.h,
                  width: 75.w,
                  fit: BoxFit.cover,
                ),
              ),
              gapH(2),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.tittleSmall4(context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

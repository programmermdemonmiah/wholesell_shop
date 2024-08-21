import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/main.dart';
import 'package:wholesell_shop/res/app_routes/app_routes_name.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/utils/ui_const.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: screenPaddingH(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.general,
              style: AppTextStyle.tittleBig3(
                  context: context, color: AppColors.white),
            ),
            gapH(3),
            Container(
              padding: edgeInsetsSym(2, 1),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: radiusAll(2.5),
              ),
              child: Column(
                children: [
                  _generalItem(
                    name: S.profile,
                    icon: Icons.person_2_outlined,
                    context: context,
                    onTap: () {},
                  ),
                  _generalItem(
                    name: S.myaddress,
                    icon: Icons.map_outlined,
                    context: context,
                    onTap: () {},
                  ),
                  _generalItem(
                    name: S.language,
                    icon: Icons.translate_sharp,
                    context: context,
                    onTap: () {
                      Get.toNamed(AppRoutesName.languageView);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _generalItem(
      {required String name,
      required IconData icon,
      required BuildContext context,
      required Function() onTap}) {
    return Padding(
      padding: edgeInsetsSym(2, 2),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20.sp,
                ),
                gapW(2),
                Text(
                  name,
                  style: AppTextStyle.text2(context: context),
                )
              ],
            ),
          ),
          gapH(2),
          Container(
            width: double.infinity,
            height: 1.sp,
            color: AppColors.black.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/app_routes/app_routes_name.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/main/main_controller.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainController>().selectedIndex.value = 0;
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteRed,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              height: 130.h,
              color: AppColors.primaryColor,
              padding: edgeInsetsSym(6, 4),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  padding: edgeInsetsAll(1),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4.sp,
                      color: AppColors.whiteRed,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_2_outlined,
                    size: 50.sp,
                    color: AppColors.whiteRed,
                  ),
                ),
                gapW(2),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Md. Emon Miah",
                      style: AppTextStyle.tittleBig3(
                          context: context, color: AppColors.whiteRed),
                    ),
                    Text(
                      "+8801405665854",
                      style: AppTextStyle.paragraph2(
                          context: context, color: AppColors.whiteRed),
                    ),
                  ],
                )
              ]),
            ),
            Container(
              color: AppColors.whiteRed,
              child: Padding(
                padding: screenPaddingH(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH(4),
                    Text(
                      S.general,
                      style: AppTextStyle.tittleBig3(
                          context: context, color: AppColors.lightRed),
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
                          _customItem(
                            name: S.profile,
                            icon: Icons.person_2_outlined,
                            context: context,
                            onTap: () {},
                          ),
                          _customItem(
                            name: S.myaddress,
                            icon: Icons.map_outlined,
                            context: context,
                            onTap: () {},
                          ),
                          _customItem(
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
                    gapH(7),
                    Text(
                      S.helpAndSupport,
                      style: AppTextStyle.tittleBig3(
                          context: context, color: AppColors.lightRed),
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
                          _customItem(
                            name: S.liveChat,
                            icon: Icons.voice_chat,
                            context: context,
                            onTap: () {},
                          ),
                          _customItem(
                            name: S.helpAndSupport,
                            icon: Icons.support_agent_rounded,
                            context: context,
                            onTap: () {},
                          ),
                          _customItem(
                            name: S.aboutUs,
                            icon: Icons.contacts_outlined,
                            context: context,
                            onTap: () {},
                          ),
                          _customItem(
                            name: S.termsAndConditions,
                            icon: Icons.contact_support_outlined,
                            context: context,
                            onTap: () {},
                          ),
                          _customItem(
                            name: S.privacyPolicy,
                            icon: Icons.privacy_tip_outlined,
                            context: context,
                            onTap: () {},
                          ),
                          _customItem(
                            name: S.refoundPolicy,
                            icon: Icons.policy,
                            context: context,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget _customItem(
      {required String name,
      required IconData icon,
      required BuildContext context,
      required Function() onTap}) {
    return Padding(
      padding: edgeInsetsSym(2, 2.5),
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
          gapH(2.5),
          Container(
            width: double.infinity,
            height: 1.sp,
            color: AppColors.black.withOpacity(0.1),
          )
        ],
      ),
    );
  }
}

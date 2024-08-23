import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/res/widgets/custom_appbar.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/langauge/langauge_controller.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(builder: (controller) {
      return Scaffold(
        appBar: customAppBar(
            appBarTitle: S.language,
            leadingColor: AppColors.black,
            appBarBg: AppColors.white,
            textColor: AppColors.black,
            context: context),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: screenPaddingH(),
            child: Column(
              children: [
                gapH(4),
                GridView.builder(
                  itemCount: controller.langauges.length,
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 130.sp,
                      mainAxisSpacing: 10.sp,
                      crossAxisSpacing: 10.sp,
                      mainAxisExtent: 130.sp
                      // mainAxisExtent: 1 / 1,
                      // childAspectRatio: 4 / 5,6
                      ),
                  itemBuilder: (context, index) {
                    final data = controller.langauges[index];

                    return InkWell(
                      onTap: () {
                        controller.changeLanguage(
                            data['code'], data['countryCode']);
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 130.sp,
                            width: 130.sp,
                            alignment: Alignment.center,
                            padding: edgeInsetsSym(2, 2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.sp,
                                  color:
                                      AppColors.orrageColor.withOpacity(0.3)),
                              borderRadius: radiusAll(2.5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: edgeInsetsAll(2),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.sp,
                                        color: AppColors.orrageColor
                                            .withOpacity(0.3)),
                                    borderRadius: radiusAll(2.5),
                                  ),
                                  child: Icon(
                                    Icons.translate,
                                    color: AppColors.black,
                                    size: 30.sp,
                                  ),
                                ),
                                gapH(3),
                                Text(
                                  data['name'],
                                  style: AppTextStyle.text1(context: context),
                                )
                              ],
                            ),
                          ),
                          if (controller.langauesCode.value == data['code'])
                            Positioned(
                              right: 2.sp,
                              top: 2.sp,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.orrageColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.done,
                                  color: AppColors.white,
                                ),
                              ),
                            )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}

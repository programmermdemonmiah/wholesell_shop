import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/assets_manager/assets_image.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/utils/app_constant.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/main/main_controller.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Obx(() => controller.screenList[controller.selectedIndex.value]),

              //custom Navigation bar=========
              Positioned(
                  // alignment: Alignment.bottomCenter,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _customNavigationBar(controller, context)),
            ],
          ),
        ),
      );
    });
  }

  Widget _customNavigationBar(
      MainController mainController, BuildContext context) {
    return Obx(
      () => Container(
        height: 110.sp,
        width: double.infinity,
        // color: Colors.red,
        alignment: Alignment.bottomCenter,
        // padding: edgeInsetsTop(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 100.sp,
              width: Get.width,
              padding: edgeInsetsTop(2),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetsImage.navBg), fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  gapH(7),
                  Container(
                    height: 50.sp,
                    padding: edgeInsetsSym(1.5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MaterialButton(
                              padding: EdgeInsets.zero,
                              minWidth: 20.sp,
                              onPressed: () {
                                mainController.selectedIndex.value = 0;
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: 20.sp,
                                    color:
                                        mainController.selectedIndex.value == 0
                                            ? AppColors.primaryColor
                                            : Colors.black38,
                                  ),
                                  gapH(1.5),
                                  Text(
                                    S.home,
                                    style: AppTextStyle.tittleSmall2(
                                      context: context,
                                      color:
                                          mainController.selectedIndex.value ==
                                                  0
                                              ? AppColors.primaryColor
                                              : Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MaterialButton(
                              minWidth: 20.sp,
                              padding: edgeInsetsOnly(5, 0, 0, 0),
                              onPressed: () {
                                mainController.selectedIndex.value = 1;
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: 20.sp,
                                    color:
                                        mainController.selectedIndex.value == 1
                                            ? AppColors.primaryColor
                                            : Colors.black38,
                                  ),
                                  gapH(1.5),
                                  Text(
                                    S.favourite,
                                    style: AppTextStyle.tittleSmall2(
                                      context: context,
                                      color:
                                          mainController.selectedIndex.value ==
                                                  1
                                              ? AppColors.primaryColor
                                              : Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40.sp,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MaterialButton(
                              minWidth: 20.sp,
                              padding: edgeInsetsOnly(1.5, 5, 0, 0),
                              onPressed: () {
                                mainController.selectedIndex.value = 3;
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.document_scanner_outlined,
                                    size: 20.sp,
                                    color:
                                        mainController.selectedIndex.value == 3
                                            ? AppColors.primaryColor
                                            : Colors.black38,
                                  ),
                                  gapH(1.5),
                                  Text(
                                    S.orders,
                                    style: AppTextStyle.tittleSmall2(
                                      context: context,
                                      color:
                                          mainController.selectedIndex.value ==
                                                  3
                                              ? AppColors.primaryColor
                                              : Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MaterialButton(
                              minWidth: 20.sp,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                mainController.selectedIndex.value = 4;
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.menu,
                                    size: 20.sp,
                                    color:
                                        mainController.selectedIndex.value == 4
                                            ? AppColors.primaryColor
                                            : Colors.black38,
                                  ),
                                  gapH(1.5),
                                  Text(
                                    S.menu,
                                    style: AppTextStyle.tittleSmall2(
                                      context: context,
                                      color:
                                          mainController.selectedIndex.value ==
                                                  4
                                              ? AppColors.primaryColor
                                              : Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10.sp,
              child: InkWell(
                onTap: () {
                  // Get.to(
                  //   fullscreenDialog: true,
                  //   transition: Transition.downToUp,
                  //   duration: Duration(milliseconds: 800),
                  //   SearchScreen(),
                  // );
                },
                child: Container(
                  height: 100.sp,
                  // width: 60.sp,
                  // decoration: BoxDecoration(
                  //   color: primaryRed,
                  //   shape: BoxShape.circle
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: edgeInsetsAll(1.7),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.09),
                            shape: BoxShape.circle),
                        child: Container(
                          padding: edgeInsetsAll(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                            // border: Border.all(width: 4, color: primaryRed.withOpacity(0.4))
                          ),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            size: 30.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      // gapH(2),
                      // Padding(
                      //   padding: edgeInsetsBottom(0.6),
                      //   child: Text(
                      //     "",
                      //     style: AppTextStyle.tittleSmall2(
                      //       context: context,
                      //       color: mainController.selectedIndex.value == 2
                      //           ? Colors.black
                      //           : Colors.black45,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

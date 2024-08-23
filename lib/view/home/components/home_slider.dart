import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/widgets/image_load.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class HomeSlider extends StatelessWidget {
  final HomeController controller;
  const HomeSlider({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 250.sp,
                child: PageView.builder(
                  itemCount: controller.pageSliderList.length,
                  controller: controller.pageController,
                  onPageChanged: (value) {
                    controller.slidePageIndex.value = value;
                  },
                  itemBuilder: (context, i) {
                    final data = controller.pageSliderList[i];
                    return Padding(
                      padding: edgeInsetsOnly(4, 4, 6, 2),
                      child:
                          //  Container(
                          //   height: 200.sp,
                          //   width: Get.width - 70.w,
                          //   decoration: BoxDecoration(
                          //       borderRadius: radiusAll(3),
                          //       image: DecorationImage(
                          //           image: NetworkImage(data["image"]),
                          //           fit: BoxFit.cover)),
                          // ),
                          ClipRRect(
                        borderRadius: radiusAll(3),
                        child: ImageLoad(
                          imageUrl: data['image'],
                          height: 200.sp,
                          width: Get.width - 70.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Positioned(
              //   bottom: 15.sp,
              //   child: Row(
              //     children: [
              //       for (int i = 0; i < controller.pageSliderList.length; i++)
              //         Padding(
              //           padding: edgeInsetsSym(0.3, 0),
              //           child: Container(
              //             height:
              //                 controller.slidePageIndex.value == i ? 10.sp : 8.sp,
              //             width:
              //                 controller.slidePageIndex.value == i ? 10.sp : 8.sp,
              //             // constraints: BoxConstraints.,
              //             decoration: BoxDecoration(
              //                 color: controller.slidePageIndex.value == i
              //                     ? AppColors.grayBg
              //                     : AppColors.whiteBg,
              //                 shape: BoxShape.circle),
              //           ),
              //         ),
              //     ],
              //   ),
              // )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < controller.pageSliderList.length; i++)
                Padding(
                  padding: edgeInsetsSym(0.3, 0),
                  child: Container(
                    height: controller.slidePageIndex.value == i ? 10.sp : 8.sp,
                    width: controller.slidePageIndex.value == i ? 10.sp : 8.sp,
                    // constraints: BoxConstraints.,
                    decoration: BoxDecoration(
                        color: controller.slidePageIndex.value == i
                            ? AppColors.primaryColor
                            : AppColors.goldColor.withOpacity(0.5),
                        shape: BoxShape.circle),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

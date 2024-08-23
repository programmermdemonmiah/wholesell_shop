import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/app_routes/app_routes_name.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/res/widgets/custom_appbar.dart';
import 'package:wholesell_shop/res/widgets/loder_widget.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/favourite/favourite_controller.dart';
import 'package:wholesell_shop/view_model/controller/main/main_controller.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          Get.find<MainController>().selectedIndex.value = 0;
          return false;
        },
        child: Scaffold(
          appBar: customAppBar(
              appBarTitle: S.favourite,
              context: context,
              isActionIcon: false,
              leadingOnTap: () {
                Get.find<MainController>().selectedIndex.value = 0;
              }),
          body: Obx(
            () => SafeArea(
              child: LoaderWidget.cartProductLoad(
                isLoading: controller.isLoading,
                child: Padding(
                  padding: screenPaddingH(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        gapH(4),
                        ListView.builder(
                          itemCount: controller.favouriteItemList.length,
                          shrinkWrap: true,
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = controller.favouriteItemList[index];

                            final price = item.quantity * item.price;

                            return Padding(
                              padding: edgeInsetsSym(0, 1),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: AppColors.black.withOpacity(0.2),
                                  onTap: () {
                                    Get.toNamed(AppRoutesName.itemDetails,
                                        arguments: {
                                          'image':
                                              'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
                                          'item': item
                                        });
                                  },
                                  child: Card(
                                    elevation: 5.sp,
                                    child: Container(
                                      height: 140.sp,
                                      padding: edgeInsetsSym(2, 2),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteBg,
                                        borderRadius: radiusAll(2),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              width: 100.sp,
                                              height: 135.sp,
                                              padding: edgeInsetsAll(2),
                                              decoration: BoxDecoration(
                                                borderRadius: radiusAll(4),
                                                color: AppColors.grayBg,
                                                image: const DecorationImage(
                                                  image: NetworkImage(
                                                    "https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          gapW(1.5),
                                          Expanded(
                                            flex: 7,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    item.itemName,
                                                    style:
                                                        AppTextStyle.tittleBig4(
                                                            context: context),
                                                  ),
                                                  Text(
                                                    item.shopName,
                                                    style:
                                                        AppTextStyle.paragraph2(
                                                            context: context),
                                                  ),
                                                  Row(
                                                    children: [
                                                      for (int i = 0;
                                                          i < 5;
                                                          i++)
                                                        Icon(
                                                          Icons.star_border,
                                                          size: 20.sp,
                                                          color: AppColors.black
                                                              .withOpacity(0.3),
                                                        ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "price:",
                                                            style: AppTextStyle
                                                                .paragraph3(
                                                                    context:
                                                                        context),
                                                          ),
                                                          gapW(2),
                                                          Text(
                                                            "৳${price.toStringAsFixed(price.truncateToDouble() == price ? 0 : 0)}",
                                                            style: AppTextStyle
                                                                .tittleBig4(
                                                                    context:
                                                                        context),
                                                          ),
                                                        ],
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            controller
                                                                .favouriteItemList
                                                                .removeAt(
                                                                    index);
                                                          },
                                                          child: Icon(
                                                            Icons.favorite,
                                                            size: 25.sp,
                                                            color: AppColors
                                                                .primaryColor,
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        gapH(30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

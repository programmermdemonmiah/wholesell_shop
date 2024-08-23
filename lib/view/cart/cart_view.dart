import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/res/widgets/custom_appbar.dart';
import 'package:wholesell_shop/res/widgets/custom_button.dart';
import 'package:wholesell_shop/res/widgets/loder_widget.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/cart/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          if (controller.isLongPressed.value) {
            controller.isLongPressed.value = false;
            controller.selecteIndexList.clear();
          } else {
            Get.back();
          }
          return false;
        },
        child: Obx(
          () => Stack(
            children: [
              Scaffold(
                backgroundColor: AppColors.grayBg,
                appBar: customAppBar(
                  appBarTitle: S.myCart,
                  context: context,
                  leadingOnTap: () {
                    if (controller.isLongPressed.value) {
                      controller.isLongPressed.value = false;
                      controller.selecteIndexList.clear();
                    } else {
                      Get.back();
                    }
                  },
                  isActionIcon: true,
                  actions: [
                    controller.selecteIndexList.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              controller.removeCartProduct();
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 22.sp,
                              color: AppColors.grayBg,
                            ))
                        : const SizedBox.shrink(),
                  ],
                ),
                body: SafeArea(
                  child: LoaderWidget.cartProductLoad(
                    isLoading: controller.isLoading,
                    child: Padding(
                      padding: controller.isLongPressed.value
                          ? edgeInsetsSym(6, 0)
                          : screenPaddingH(),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            gapH(4),
                            ListView.builder(
                              itemCount: controller.cartProductsList.length,
                              shrinkWrap: true,
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final productsData =
                                    controller.cartProductsList[index];

                                final price =
                                    productsData.quantity * productsData.price;

                                return Padding(
                                  padding: edgeInsetsSym(0, 1),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: AppColors.grayBg,
                                      onTap: () {
                                        if (controller.isLongPressed.value) {
                                          if (controller.selecteIndexList
                                              .contains(index)) {
                                            controller.selecteIndexList
                                                .remove(index);
                                          } else {
                                            controller.selecteIndexList
                                                .add(index);
                                          }
                                        } else {
                                          // Go to another page
                                        }
                                      },
                                      onLongPress: () {
                                        controller.isLongPressed.value = true;
                                        controller.selecteIndexList.add(index);
                                      },
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
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          productsData.itemName,
                                                          style: AppTextStyle
                                                              .tittleBig4(
                                                                  context:
                                                                      context),
                                                        ),
                                                        controller.isLongPressed
                                                                .value
                                                            ? controller
                                                                    .selecteIndexList
                                                                    .contains(
                                                                        index)
                                                                ? Container(
                                                                    padding:
                                                                        edgeInsetsAll(
                                                                            0.7),
                                                                    decoration: const BoxDecoration(
                                                                        color: Colors
                                                                            .green,
                                                                        shape: BoxShape
                                                                            .circle),
                                                                    child: Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: AppColors
                                                                          .grayBg,
                                                                      size:
                                                                          16.sp,
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    padding:
                                                                        edgeInsetsAll(
                                                                            2.5),
                                                                    decoration: const BoxDecoration(
                                                                        color: AppColors
                                                                            .grayBg,
                                                                        shape: BoxShape
                                                                            .circle),
                                                                  )
                                                            : const SizedBox
                                                                .shrink(),
                                                      ],
                                                    ),
                                                    Text(
                                                      productsData.shopName,
                                                      style: AppTextStyle
                                                          .paragraph2(
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
                                                            color: AppColors
                                                                .black
                                                                .withOpacity(
                                                                    0.3),
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
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child: InkWell(
                                                                splashColor:
                                                                    AppColors
                                                                        .whiteBg,
                                                                onTap: () {
                                                                  controller
                                                                      .decrementQuantity(
                                                                          index);
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      edgeInsetsAll(
                                                                          1),
                                                                  decoration: const BoxDecoration(
                                                                      color: AppColors
                                                                          .grayBg,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 20
                                                                          .sp),
                                                                ),
                                                              ),
                                                            ),
                                                            gapW(2),
                                                            Text(
                                                              productsData
                                                                  .quantity
                                                                  .toString(),
                                                              style: AppTextStyle
                                                                  .tittleBig4(
                                                                      context:
                                                                          context),
                                                            ),
                                                            gapW(2),
                                                            Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child: InkWell(
                                                                splashColor:
                                                                    AppColors
                                                                        .whiteBg,
                                                                onTap: () {
                                                                  controller
                                                                      .incrementQuantity(
                                                                          index);
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      edgeInsetsAll(
                                                                          1),
                                                                  decoration: const BoxDecoration(
                                                                      color: AppColors
                                                                          .grayBg,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Icon(
                                                                      Icons.add,
                                                                      size: 20
                                                                          .sp),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Total price:",
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
                                );
                              },
                            ),
                            gapH(controller.selecteIndexList.isNotEmpty
                                ? 15
                                : 4),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (controller.selecteIndexList.isNotEmpty)
                Positioned(
                  bottom: 15.sp,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: screenPaddingH(),
                    child: customButton(
                      buttonName: S.purchaseItems,
                      context: context,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}

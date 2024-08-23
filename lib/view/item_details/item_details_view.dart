import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/model/cart/cart_products_model.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/res/widgets/custom_appbar.dart';
import 'package:wholesell_shop/res/widgets/custom_button.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/item_details/item_details_controller.dart';

class ItemDetailsView extends StatelessWidget {
  final String image;
  final CartProductsModel item;
  const ItemDetailsView({super.key, required this.image, required this.item});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsController>(builder: (controller) {
      return Scaffold(
        appBar: customAppBar(
          appBarTitle: S.itemDetails,
          context: context,
          isActionIcon: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                ),
              ),
              gapH(4),
              Padding(
                padding: screenPaddingH(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.itemName,
                      style: AppTextStyle.tittleBig4(context: context),
                    ),
                    gapH(1),
                    Text(
                      item.shopName,
                      style: AppTextStyle.text3(
                          context: context, color: AppColors.primaryColor),
                    ),
                    gapH(4),
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${item.price} ৳",
                                style: AppTextStyle.tittleBig3(
                                    context: context,
                                    color: AppColors.primaryColor),
                              ),
                              gapH(1),
                              Obx(() {
                                return Row(
                                  children: [
                                    Text(
                                      "0.0",
                                      style: AppTextStyle.tittleBig3(
                                          context: context,
                                          color:
                                              AppColors.black.withOpacity(0.2)),
                                    ),
                                    gapW(1),
                                    for (int i = 1; i <= 5; i++)
                                      InkWell(
                                        onTap: () {
                                          controller.ratingStar.value = i;
                                        },
                                        child: Icon(
                                          Icons.star,
                                          size: 22.sp,
                                          color:
                                              controller.ratingStar.value >= i
                                                  ? AppColors.primaryColor
                                                  : AppColors.black
                                                      .withOpacity(0.3),
                                        ),
                                      ),
                                    Text(
                                      "(0)",
                                      style: AppTextStyle.tittleBig3(
                                          context: context,
                                          color:
                                              AppColors.black.withOpacity(0.2)),
                                    ),
                                  ],
                                );
                              })
                            ],
                          ),
                        ),
                        gapW(2),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: edgeInsetsSym(2.5, 1),
                                decoration: BoxDecoration(
                                    borderRadius: radiusAll(1.5),
                                    color: AppColors.lightRed),
                                child: Text(
                                  'EACH',
                                  style: AppTextStyle.paragraph4(
                                      context: context, color: AppColors.white),
                                ),
                              ),
                              gapH(2),
                              Container(
                                padding: edgeInsetsSym(2, 1),
                                decoration: BoxDecoration(
                                    borderRadius: radiusAll(1.5),
                                    border: Border.all(
                                      width: 2.sp,
                                      color: AppColors.primaryColor,
                                    )),
                                child: Text(
                                  S.inStock,
                                  style:
                                      AppTextStyle.paragraph3(context: context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    gapH(4),
                    Container(
                      height: 1.h,
                      width: double.infinity,
                      color: AppColors.black.withOpacity(0.1),
                    ),
                    gapH(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.quantity,
                          style: AppTextStyle.tittleBig3(context: context),
                        ),
                        Obx(() {
                          return Container(
                            padding: edgeInsetsSym(2, 1),
                            decoration: BoxDecoration(
                              color: AppColors.black.withOpacity(0.08),
                              borderRadius: radiusAll(1),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (controller.quantity.value > 1) {
                                      controller.quantity.value--;
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 22.sp,
                                    color: AppColors.black.withOpacity(0.3),
                                  ),
                                ),
                                gapW(2.5),
                                Text(
                                  "${controller.quantity.value}",
                                  style: AppTextStyle.tittleBig4(
                                    context: context,
                                    color: AppColors.black.withOpacity(0.4),
                                  ),
                                ),
                                gapW(2.5),
                                InkWell(
                                  onTap: () {
                                    controller.quantity.value++;
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 22.sp,
                                    color: AppColors.black.withOpacity(0.3),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                    gapH(3),
                    Row(
                      children: [
                        Text(
                          "${S.totalAmount}:",
                          style: AppTextStyle.tittleBig3(context: context),
                        ),
                        gapW(2),
                        Obx(
                          () => Text(
                            "${controller.quantity.value * item.price} ৳",
                            style: AppTextStyle.tittleBig3(
                              context: context,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapH(4),
                    Text(
                      S.description,
                      style: AppTextStyle.tittleBig3(context: context),
                    ),
                    gapH(2),
                    Text(
                      "Item desciption \nheare",
                      style: AppTextStyle.paragraph1(context: context),
                    ),
                  ],
                ),
              ),
              gapH(14),
            ],
          ),
        )),
        bottomSheet: Container(
          height: 50.h,
          padding: edgeInsetsOnly(4, 4, 0, 1),
          color: AppColors.whiteBg,
          child: customButton(buttonName: S.addToCart, context: context),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/res/widgets/custom_appbar.dart';
import 'package:wholesell_shop/res/widgets/loder_widget.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/main/main_controller.dart';
import 'package:wholesell_shop/view_model/controller/order/orders_controller.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          Get.find<MainController>().selectedIndex.value = 0;
          return false;
        },
        child: Scaffold(
          appBar: customAppBar(
            appBarTitle: S.orders,
            context: context,
            isActionIcon: false,
            leadingOnTap: () {
              Get.find<MainController>().selectedIndex.value = 0;
            },
          ),
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
                          itemCount: controller.ordersList.length,
                          shrinkWrap: true,
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final data = controller.ordersList[index];
                            final price = data['price'];
                            return Padding(
                              padding: edgeInsetsSym(0, 1),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: AppColors.black.withOpacity(0.2),
                                  onTap: () {
                                    // Go to another page
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
                                                    data['itemName'],
                                                    style:
                                                        AppTextStyle.tittleBig4(
                                                            context: context),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Order Id:",
                                                            style: AppTextStyle
                                                                .paragraph3(
                                                                    context:
                                                                        context),
                                                          ),
                                                          gapW(2),
                                                          Text(
                                                            "#${data['orderId']}",
                                                            style: AppTextStyle
                                                                .tittleSmall2(
                                                                    context:
                                                                        context),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        padding:
                                                            edgeInsetsSym(2, 1),
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    radiusAll(
                                                                        1.5),
                                                                color: AppColors
                                                                    .lightRed),
                                                        child: Text(
                                                          data['status'],
                                                          style: AppTextStyle
                                                              .paragraph4(
                                                                  context:
                                                                      context,
                                                                  color: AppColors
                                                                      .white),
                                                        ),
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
                                                      Container(
                                                        padding:
                                                            edgeInsetsSym(2, 1),
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    radiusAll(
                                                                        1.5),
                                                                border:
                                                                    Border.all(
                                                                  width: 2.sp,
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                )),
                                                        child: Text(
                                                          S.trackOrder,
                                                          style: AppTextStyle
                                                              .paragraph3(
                                                                  context:
                                                                      context),
                                                        ),
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

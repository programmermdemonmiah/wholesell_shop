import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/model/cart/cart_products_model.dart';
import 'package:wholesell_shop/res/app_routes/app_routes.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view/home/components/homes/custom_popular_items.dart';

class ShoppingMallHomeMostPopularItems extends StatelessWidget {
  const ShoppingMallHomeMostPopularItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      alignment: Alignment.center,
      width: double.infinity,
      color: AppColors.whiteRed,
      padding: edgeInsetsSym(0, 5),
      child: Column(
        children: [
          Padding(
            padding: screenPaddingH(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      S.mostPopularItems,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: AppTextStyle.tittleBig3(context: context),
                    ),
                    gapW(2),
                    Icon(
                      Icons.local_fire_department_rounded,
                      color: AppColors.primaryColor,
                      size: 25.sp,
                    )
                  ],
                ),
                Text(
                  S.seeAll,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: AppTextStyle.tittleSmall2(
                      context: context, color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          gapH(4),
          SizedBox(
            height: 280.h,
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomPopularItems(
                  onTap: () {
                    AppRoutes.goCartView(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAWn-xcg-EcLtumUehSkH6GR02S9y4CwDJhw&s',
                      item: CartProductsModel(
                          itemName: "Fresh Chiken Burger",
                          shopName: "Emon Cafee House",
                          price: 300,
                          quantity: 1),
                    );
                  },
                  padding: index == 0
                      ? edgeInsetsOnly(4, 1, 0, 0)
                      : edgeInsetsSym(1, 0),
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAWn-xcg-EcLtumUehSkH6GR02S9y4CwDJhw&s',
                  title: 'Fresh Chiken Burger',
                  itemSize: 'EACH',
                  price: 300,
                  rating: 0,
                  ratingParcentange: 4.7,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view/home/components/homes/custom_homes_stores.dart';

class FoodHomeStoreSection extends StatelessWidget {
  const FoodHomeStoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: screenPaddingH(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.stores,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: AppTextStyle.tittleBig3(context: context),
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
          gapH(4),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            primary: false,
            // scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return CustomHomesStores(
                  padding: edgeInsetsSym(0, 1),
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAWn-xcg-EcLtumUehSkH6GR02S9y4CwDJhw&s',
                  shopName: "Palli Mart",
                  rating: 1,
                  durationMinutes: '30 - 40 Minutes',
                  shopLocation:
                      'uttara-15, First Mettro Rail, Dhaka, Bangladesh',
                  ratingParcentange: 4.7);
            },
          ),
        ],
      ),
    );
  }
}

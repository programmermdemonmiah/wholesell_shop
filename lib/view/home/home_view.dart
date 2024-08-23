import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/view/home/homes/bakery_sweets_home/bakery_and_sweets_home_view.dart';

import 'package:wholesell_shop/view/home/homes/food_home/food_home_view.dart';
import 'package:wholesell_shop/view/home/homes/grocery_home/grocery_home_view.dart';
import 'package:wholesell_shop/view/home/homes/parcel_home/parcel_home_view.dart';
import 'package:wholesell_shop/view/home/homes/pharmacy_home/pharmacy_home_view.dart';
import 'package:wholesell_shop/view/home/homes/shopping_mall_home/shopping_mall_home_view.dart';
import 'package:wholesell_shop/view/home/homes/tong_dokan_home/tong_dokan_home_view.dart';
import 'package:wholesell_shop/view/home/main_home_view.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Obx(() {
          switch (controller.homeName.value) {
            case '':
              return const MainHomeView();

            case 'Food' || 'খাদ্য':
              return FoodHomeView(mainHomeController: controller);
            case 'Grocery' || 'মুদি':
              return GroceryHomeView(mainHomeController: controller);
            case 'Pharmacy' || 'ফার্মেসি':
              return PharmacyHomeView(mainHomeController: controller);
            case 'Parcel' || 'পার্সেল':
              return ParcelHomeView(mainHomeController: controller);
            case 'Bakery & Sweets' || 'বেকারি এবং মিষ্টি':
              return BakeryAndSweetsHomeView(mainHomeController: controller);
            case 'Shopping Mall' || 'শপিং মল':
              return ShoppingMallHomeView(mainHomeController: controller);
            case 'Tong Dokan' || 'টং দোকান':
              return TongDokanHomeView(mainHomeController: controller);
            default:
              return const MainHomeView();
          }
        });
      },
    );
  }
}

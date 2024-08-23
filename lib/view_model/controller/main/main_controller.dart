import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/view/cart/cart_view.dart';
import 'package:wholesell_shop/view/favourite/favourite_view.dart';
import 'package:wholesell_shop/view/home/home_view.dart';
import 'package:wholesell_shop/view/menu/menu_view.dart';
import 'package:wholesell_shop/view/orders/orders_view.dart';

class MainController extends GetxController {
  RxInt selectedIndex =
      0.obs; // Set to 2 if you want "Search" initially selected
  List<Widget> screenList = const [
    HomeView(),
    FavouriteView(),
    CartView(),
    OrdersView(),
    MenuView(),
    //categoryhome
    // TongDokanHomeView();
  ];
}

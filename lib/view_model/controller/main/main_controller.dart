import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/view/home/home_view.dart';

class MainController extends GetxController {
  RxInt selectedIndex =
      0.obs; // Set to 2 if you want "Search" initially selected
  List<Widget> screenList = [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];
}

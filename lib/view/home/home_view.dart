import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wholesell_shop/view/home/components/home_slider.dart';
import 'package:wholesell_shop/view/home/components/home_sliver_appbar.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class ParcelHomeView extends StatelessWidget {
  final HomeController mainHomeController;
  const ParcelHomeView({super.key, required this.mainHomeController});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        mainHomeController.homeName.value = '';
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: HomeSliverAppbar(
            controller: mainHomeController,
            onRefresh: () async {
              // return controller.onInit();
            },
            child: ListView(
              children: [
                HomeSlider(controller: mainHomeController),
                Center(
                    child:
                        Text("${mainHomeController.homeName.value} HOme View")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

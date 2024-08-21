import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/app_routes/app_routes_name.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/assets_manager/assets_image.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/utils/ui_const.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // _navigateToHomePage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _navigateToHomePage() {
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HomePage()),
      // );
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutesName.homeView,
        (route) => false,
      );
      // Get.offAllNamed(AppRoutesName.homeView);
    });
  }

  // void _showNoInternetDialog() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(
  //           "No Internet Connection",
  //           style: AppTextStyle.tittleBig4(context: context),
  //         ),
  //         content: SingleChildScrollView(
  //             child: Text(
  //           "Please check your internet connection and try again.",
  //           style: AppTextStyle.text2(context: context),
  //         )),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text(
  //               "Retry",
  //               style: AppTextStyle.tittleSmall3(context: context),
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               _checkInternetConnection();
  //               _connectivitySubscription = _connectivity.onConnectivityChanged
  //                   .listen(_updateConnectionStatus);
  //             },
  //           ),
  //           TextButton(
  //             child: Text(
  //               "Exit",
  //               style: AppTextStyle.tittleSmall3(context: context),
  //             ),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               _exitApp();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _exitApp() {
  //   Future.delayed(const Duration(milliseconds: 100), () {
  //     SystemNavigator.pop();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe7eefc),
      appBar: AppBar(
        backgroundColor: const Color(0xffe7eefc),
      ),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          color: const Color(0xffe7eefc),
          // color: primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gapH(2),
              Center(
                child: Image.asset(
                  AssetsImage.logo,
                  // height: Get.height,
                  // width: Get.width,
                  // filterQuality: FilterQuality.high,
                  fit: BoxFit.fitWidth,
                ),
                // child: Text("test"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Made with love ',
                        style: AppTextStyle.text1(
                            context: context, color: AppColors.primaryColor),
                      ),
                      Icon(
                        Icons.favorite_rounded,
                        color: AppColors.primaryColor,
                        size: 18.sp,
                      )
                    ],
                  ),
                  Text(
                    'v1.0',
                    style: AppTextStyle.text2(
                        context: context, color: AppColors.primaryColor),
                  ),
                  gapH(5),
                  Text(
                    'powered by N. I. Biz Soft',
                    style: AppTextStyle.paragraph3(context: context),
                  ),
                  gapH(5)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

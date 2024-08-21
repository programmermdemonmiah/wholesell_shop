import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    setLoading = true;
    update();

    startAutoSlide();
    Future.delayed(
      Duration(seconds: 5),
      () => setLoading = false,
    );
    scrollController.addListener(() {
      if (scrollController.offset > 0 && !isScrolled.value) {
        isScrolled.value = true;
      } else if (scrollController.offset <= 0 && isScrolled.value) {
        isScrolled.value = false;
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    pageController.dispose();
    _autoSlideTimer.cancel();
    super.onClose();
  }
//===================oninit on close end=========================separate ========================

  ScrollController scrollController = ScrollController();
  var isScrolled = false.obs;
  PageController pageController = PageController();
  late Timer _autoSlideTimer;
  final RxInt slidePageIndex = 0.obs;
  final RxBool _isLoading = false.obs;
  set setLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  RxList pageSliderList = [
    {
      "image":
          "https://img.freepik.com/premium-photo/photocomposition-horizontal-shopping-banner-with-woman-big-smartphone_23-2151201773.jpg"
    },
    {
      "image":
          "https://img.freepik.com/premium-psd/black-friday-sale-social-media-post-instagram-post-web-banner-facebook-cover-template_220443-1071.jpg"
    },
    {
      "image":
          "https://t3.ftcdn.net/jpg/04/65/46/52/360_F_465465254_1pN9MGrA831idD6zIBL7q8rnZZpUCQTy.jpg"
    },
    {
      "image":
          "https://static.vecteezy.com/system/resources/thumbnails/004/707/493/small/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-vector.jpg"
    },
    {
      "image":
          "https://www.shutterstock.com/image-vector/ecommerce-internet-shopping-promotion-campaign-260nw-1473274019.jpg"
    },
  ].obs;

  void startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 8), (Timer timer) {
      if (slidePageIndex.value < pageSliderList.length - 1) {
        slidePageIndex.value++;
      } else {
        slidePageIndex.value = 0;
      }
      pageController.animateToPage(
        slidePageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}

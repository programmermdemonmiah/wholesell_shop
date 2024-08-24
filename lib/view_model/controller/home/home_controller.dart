import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    setLoading = true;
    update();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAutoSlide();
    });

    // startAutoSlide();
    // Future.delayed(
    //   const Duration(seconds: 5),
    //   () => setLoading = false,
    // );
    // scrollController.addListener(() {
    //   if (scrollController.offset > 0 && !isScrolled.value) {
    //     isScrolled.value = true;
    //   } else if (scrollController.offset <= 0 && isScrolled.value) {
    //     isScrolled.value = false;
    //   }
    // });
  }

  @override
  void onClose() {
    // scrollController.dispose();
    pageController.dispose();
    _autoSlideTimer.cancel();
    super.onClose();
  }
//===================oninit on close end=========================separate ========================

  RxString homeName = ''.obs;

  // ScrollController scrollController = ScrollController();
  // var isScrolled = false.obs;
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

  RxList cetegoriesList = [
    {
      'image':
          'https://foodsafetyhelpline.com/wp-content/uploads/2020/11/quinoa-mushrooms-lettuce-red-cabbage-spinach-cucumbers-tomatoes-bowl-buddha-dark-top-view.jpg',
      'name': S.food,
    },
    {
      'image':
          'https://browntape.com/wp-content/uploads/2016/06/Online-shopping-grocery.jpg',
      'name': S.grocery,
    },
    {
      'image':
          'https://sevsafe.co.uk/wp-content/uploads/2021/04/MediKit-Workplace-BSI-Small-First-Aid-Kit-Image.jpeg',
      'name': S.pharmacy,
    },
    {
      'image':
          'https://img.freepik.com/free-vector/isometric-postal-parcels-mails_33099-720.jpg',
      'name': S.parcel,
    },
    {
      'image':
          'https://img.freepik.com/free-vector/bakery-promo-poster_1284-10798.jpg',
      'name': S.bakeryandSweets,
    },
    {
      'image':
          'https://st.depositphotos.com/2000799/3146/i/450/depositphotos_31463991-stock-photo-shopping-mall.jpg',
      'name': S.shoppingMall,
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmZxfwY_QFcuXAsQmWmwRjL9M30NkpOsN--g&s',
      'name': S.tongDokan,
    },
  ].obs;
  void startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 8), (Timer timer) {
      if (slidePageIndex.value < pageSliderList.length - 1) {
        slidePageIndex.value++;
      } else {
        slidePageIndex.value = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          slidePageIndex.value,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}

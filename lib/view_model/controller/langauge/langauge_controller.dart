import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wholesell_shop/view_model/controller/common/prefs_controller.dart';

class LanguageController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    langauesCode.value = Get.locale?.languageCode ?? 'en';
  }

  RxString langauesCode = ''.obs;

  RxList langauges = [
    {'code': 'en', 'countryCode': 'US', 'name': 'English'},
    {'code': 'bn', 'countryCode': 'BD', 'name': 'বাংলা'}
  ].obs;

  void changeLanguage(String code, String countryCode) {
    Locale locale = Locale(code, countryCode);
    Get.updateLocale(locale);
    langauesCode.value = code;

    PrefsController.setLanguage = jsonEncode({
      "code": code,
      "countryCode": countryCode,
    });
  }
}

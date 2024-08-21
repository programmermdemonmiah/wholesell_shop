import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    langauesCode.value = Get.locale?.languageCode ?? 'en';
  }

  RxString langauesCode = ''.obs;

  RxList<Map<String, String>> langauges = [
    {'code': 'en', 'countryCode': 'US', 'name': 'English'},
    {'code': 'bn', 'countryCode': 'BD', 'name': 'বাংলা'}
  ].obs;

  void changeLanguage(String code, String countryCode) {
    Locale locale = Locale(code, countryCode);
    Get.updateLocale(locale);
    langauesCode.value = code;
  }
}

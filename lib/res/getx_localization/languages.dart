import 'package:get/get.dart';

class Languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'home': 'Home',
          'favourite': 'Favourite',
          'orders': 'Orders',
          'menu': 'Menu',
          'profile': 'Profile',
          'myaddress': 'My Address',
          'language': 'Language',
          'general': 'General',
        },
        'bn_BD': {
          'home': 'হোম',
          'favourite': 'পছন্দ',
          'orders': 'অর্ডার',
          'menu': 'মেনু',
          'profile': 'প্রোফাইল',
          'myaddress': 'আমার ঠিকানা',
          'language': 'ভাষা',
          'general': 'জেনারেল'
        },
      };
}

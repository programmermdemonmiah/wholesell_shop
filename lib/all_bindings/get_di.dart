import 'package:get/get.dart';
import 'package:wholesell_shop/view_model/controller/cart/cart_controller.dart';
import 'package:wholesell_shop/view_model/controller/common/prefs_controller.dart';
import 'package:wholesell_shop/view_model/controller/favourite/favourite_controller.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';
import 'package:wholesell_shop/view_model/controller/item_details/item_details_controller.dart';
import 'package:wholesell_shop/view_model/controller/langauge/langauge_controller.dart';
import 'package:wholesell_shop/view_model/controller/main/main_controller.dart';
import 'package:wholesell_shop/view_model/controller/order/orders_controller.dart';

Future<void> init() async {
  await PrefsController.onInit();

  Get.lazyPut(() => MainController(), fenix: true);
  Get.lazyPut(
    () => HomeController(),
    fenix: true,
  );

  Get.lazyPut(() => LanguageController(), fenix: true);

  Get.lazyPut(() => CartController(), fenix: true);
  Get.lazyPut(() => FavouriteController(), fenix: true);
  Get.lazyPut(() => OrdersController(), fenix: true);
  Get.lazyPut(() => ItemDetailsController(), fenix: true);
}

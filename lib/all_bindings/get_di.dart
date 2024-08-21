import 'package:get/get.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';
import 'package:wholesell_shop/view_model/controller/main/main_controller.dart';

init() {
  Get.lazyPut(() => MainController(), fenix: true);
  Get.lazyPut(
    () => HomeController(),
    fenix: true,
  );
}

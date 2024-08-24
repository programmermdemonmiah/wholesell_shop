import 'package:get/get.dart';
import 'package:wholesell_shop/model/cart/cart_products_model.dart';
import 'package:wholesell_shop/res/app_routes/app_routes_name.dart';
import 'package:wholesell_shop/view/Language/language_view.dart';
import 'package:wholesell_shop/view/cart/cart_view.dart';
import 'package:wholesell_shop/view/category_items/category_items_view.dart';
import 'package:wholesell_shop/view/home/home_view.dart';
import 'package:wholesell_shop/view/item_details/item_details_view.dart';
import 'package:wholesell_shop/view/main/main_view.dart';
import 'package:wholesell_shop/view/splash/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: AppRoutesName.splashView,
          page: () => const SplashView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: AppRoutesName.mainView,
          page: () => const MainView(),
        ),
        GetPage(
          name: AppRoutesName.homeView,
          page: () => const HomeView(),
        ),
        GetPage(
          name: AppRoutesName.languageView,
          page: () => const LanguageView(),
        ),
        GetPage(
          name: AppRoutesName.cartView,
          page: () => const CartView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: AppRoutesName.itemDetails,
          page: () => ItemDetailsView(
              image: Get.arguments['image'], item: Get.arguments['item']),
        ),
        GetPage(
          name: AppRoutesName.categoryItemsView,
          page: () => CategoryItemsView(),
        )
      ];

  //================
  //==========routing section========
  //============
  static goCartView({
    required String image,
    required CartProductsModel item,
  }) {
    Get.toNamed(AppRoutesName.itemDetails,
        arguments: {'image': image, 'item': item});
  }

  static goCategoryItemsView() {
    Get.toNamed(AppRoutesName.categoryItemsView);
  }
}

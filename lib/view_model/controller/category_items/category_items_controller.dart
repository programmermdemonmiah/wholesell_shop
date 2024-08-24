import 'package:get/get.dart';
import 'package:wholesell_shop/model/cart/cart_products_model.dart';

class CategoryItemsController extends GetxController {
  final RxBool _isLoading = false.obs;
  set setLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  RxList<CartProductsModel> favouriteItemList = [
    CartProductsModel(
        itemName: "Chicken Chese Burger",
        shopName: "Rover's Coffee House's",
        price: 250,
        quantity: 1),
    CartProductsModel(
        itemName: "Chicken Chese ",
        shopName: "Rover's  House's",
        price: 240,
        quantity: 1),
    CartProductsModel(
        itemName: "Chicken  Burger",
        shopName: "Rover's Coffee House's",
        price: 30,
        quantity: 1),
    CartProductsModel(
        itemName: "Chicken Chese Burger",
        shopName: "Rover's",
        price: 205,
        quantity: 1),
  ].obs;

  getFavouriteItems() {
    setLoading = true;
    update();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setLoading = false;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getFavouriteItems();
  }
}

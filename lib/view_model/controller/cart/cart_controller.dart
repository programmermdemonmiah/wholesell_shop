import 'package:get/get.dart';
import 'package:wholesell_shop/model/cart/cart_products_model.dart';

class CartController extends GetxController {
  final RxBool _isLoading = false.obs;
  set setLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  RxBool isLongPressed = false.obs;
  RxList selecteIndexList = [].obs;
  RxList<CartProductsModel> cartProductsList = [
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

  removeCartProduct() {
    selecteIndexList.sort((a, b) => b.compareTo(a));
    for (int i = 0; i < selecteIndexList.length; i++) {
      cartProductsList.removeAt(selecteIndexList[i]);
    }
    selecteIndexList.clear();
    isLongPressed.value = false;
  }

  void incrementQuantity(int index) {
    cartProductsList[index].quantity++;
    cartProductsList.refresh();
  }

  void decrementQuantity(int index) {
    if (cartProductsList[index].quantity > 1) {
      cartProductsList[index].quantity--;
      cartProductsList.refresh();
    }
  }

  //=====================
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartProducts();
  }

  //=====================
  getCartProducts() {
    setLoading = true;
    update();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setLoading = false;
      },
    );
  }
}

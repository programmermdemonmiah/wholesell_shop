import 'package:get/get.dart';

class OrdersController extends GetxController {
  final RxBool _isLoading = false.obs;
  set setLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  RxList ordersList = [
    {
      'itemName': 'Chiken Burger',
      'orderId': 103675,
      'price': 300,
      'status': 'Pending'
    }
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

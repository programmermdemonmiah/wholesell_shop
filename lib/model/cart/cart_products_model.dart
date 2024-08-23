// To parse this JSON data, do
//
//     final cartProductsModel = cartProductsModelFromJson(jsonString);

import 'dart:convert';

List<CartProductsModel> cartProductsModelFromJson(String str) =>
    List<CartProductsModel>.from(
        json.decode(str).map((x) => CartProductsModel.fromJson(x)));

String cartProductsModelToJson(List<CartProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartProductsModel {
  String itemName;
  String shopName;
  int price;
  int quantity;

  CartProductsModel({
    required this.itemName,
    required this.shopName,
    required this.price,
    required this.quantity,
  });

  factory CartProductsModel.fromJson(Map<String, dynamic> json) =>
      CartProductsModel(
        itemName: json["itemName"],
        shopName: json["shopName"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "itemName": itemName,
        "shopName": shopName,
        "price": price,
        "quantity": quantity,
      };
}

// To parse this JSON data, do
//
//     final getCartResponseModel = getCartResponseModelFromJson(jsonString);

import 'dart:convert';

GetCartResponseModel getCartResponseModelFromJson(String str) =>
    GetCartResponseModel.fromJson(json.decode(str));

String getCartResponseModelToJson(GetCartResponseModel data) =>
    json.encode(data.toJson());

class GetCartResponseModel {
  bool? success;
  String? message;
  Data? data;

  GetCartResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetCartResponseModel.fromJson(Map<String, dynamic> json) =>
      GetCartResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? userId;
  List<ProductData>? productData;
  double? totalPrice;

  Data({
    this.userId,
    this.productData,
    this.totalPrice,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        productData: json["product_data"] == null
            ? []
            : List<ProductData>.from(
                json["product_data"]!.map((x) => ProductData.fromJson(x))),
        totalPrice: json["total_price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "product_data": productData == null
            ? []
            : List<dynamic>.from(productData!.map((x) => x.toJson())),
        "total_price": totalPrice,
      };
}

class ProductData {
  int? cartId;
  String? categoryName;
  int? productId;
  String? productName;
  String? quantity;
  String? price;
  double? totalPrice;

  ProductData({
    this.cartId,
    this.categoryName,
    this.productId,
    this.productName,
    this.quantity,
    this.price,
    this.totalPrice,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        cartId: json["cart_id"],
        categoryName: json["category_name"],
        productId: json["product_id"],
        productName: json["product_name"],
        quantity: json["quantity"],
        price: json["price"],
        totalPrice: json["total_price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "category_name": categoryName,
        "product_id": productId,
        "product_name": productName,
        "quantity": quantity,
        "price": price,
        "total_price": totalPrice,
      };
}

// To parse this JSON data, do
//
//     final addToCartResponseModel = addToCartResponseModelFromJson(jsonString);

import 'dart:convert';

AddToCartResponseModel addToCartResponseModelFromJson(String str) => AddToCartResponseModel.fromJson(json.decode(str));

String addToCartResponseModelToJson(AddToCartResponseModel data) => json.encode(data.toJson());

class AddToCartResponseModel {
    bool? success;
    String? message;
    Data? data;

    AddToCartResponseModel({
        this.success,
        this.message,
        this.data,
    });

    factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) => AddToCartResponseModel(
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
    String? productId;
    String? quantity;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.userId,
        this.productId,
        this.quantity,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}

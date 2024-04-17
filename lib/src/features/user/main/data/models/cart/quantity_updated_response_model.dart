// To parse this JSON data, do
//
//     final quantityUpdatedResponseModel = quantityUpdatedResponseModelFromJson(jsonString);

import 'dart:convert';

QuantityUpdatedResponseModel quantityUpdatedResponseModelFromJson(String str) => QuantityUpdatedResponseModel.fromJson(json.decode(str));

String quantityUpdatedResponseModelToJson(QuantityUpdatedResponseModel data) => json.encode(data.toJson());

class QuantityUpdatedResponseModel {
    bool? success;
    String? message;
    Data? data;

    QuantityUpdatedResponseModel({
        this.success,
        this.message,
        this.data,
    });

    factory QuantityUpdatedResponseModel.fromJson(Map<String, dynamic> json) => QuantityUpdatedResponseModel(
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
    int? id;
    String? userId;
    String? productId;
    int? quantity;
    DateTime? createdAt;
    DateTime? updatedAt;

    Data({
        this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

// To parse this JSON data, do
//
//     final addOrderResponseModel = addOrderResponseModelFromJson(jsonString);

import 'dart:convert';

AddOrderResponseModel addOrderResponseModelFromJson(String str) =>
    AddOrderResponseModel.fromJson(json.decode(str));

String addOrderResponseModelToJson(AddOrderResponseModel data) =>
    json.encode(data.toJson());

class AddOrderResponseModel {
  bool? success;
  String? message;
  Order? order;
  Paymrent? paymrent;

  AddOrderResponseModel({
    this.success,
    this.message,
    this.order,
    this.paymrent,
  });

  factory AddOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      AddOrderResponseModel(
        success: json["success"],
        message: json["message"],
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
        paymrent: json["paymrent"] == null
            ? null
            : Paymrent.fromJson(json["paymrent"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "order": order?.toJson(),
        "paymrent": paymrent?.toJson(),
      };
}

class Order {
  int? userId;
  double? total;
  String? uCode;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Order({
    this.userId,
    this.total,
    this.uCode,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        userId: json["user_id"],
        total: json["total"]?.toDouble(),
        uCode: json["uCode"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "total": total,
        "uCode": uCode,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}

class Paymrent {
  Headers? headers;
  Original? original;
  dynamic exception;

  Paymrent({
    this.headers,
    this.original,
    this.exception,
  });

  factory Paymrent.fromJson(Map<String, dynamic> json) => Paymrent(
        headers:
            json["headers"] == null ? null : Headers.fromJson(json["headers"]),
        original: json["original"] == null
            ? null
            : Original.fromJson(json["original"]),
        exception: json["exception"],
      );

  Map<String, dynamic> toJson() => {
        "headers": headers?.toJson(),
        "original": original?.toJson(),
        "exception": exception,
      };
}

class Headers {
  Headers();

  factory Headers.fromJson(Map<String, dynamic> json) => Headers();

  Map<String, dynamic> toJson() => {};
}

class Original {
  bool? success;
  String? message;
  Data? data;

  Original({
    this.success,
    this.message,
    this.data,
  });

  factory Original.fromJson(Map<String, dynamic> json) => Original(
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
  int? orderId;
  int? userId;
  String? paymentMethod;
  double? paymentAmount;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.orderId,
    this.userId,
    this.paymentMethod,
    this.paymentAmount,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderId: json["order_id"],
        userId: json["user_id"],
        paymentMethod: json["payment_method"],
        paymentAmount: json["payment_amount"]?.toDouble(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "user_id": userId,
        "payment_method": paymentMethod,
        "payment_amount": paymentAmount,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}

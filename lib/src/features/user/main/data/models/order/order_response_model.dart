// To parse this JSON data, do
//
//     final orderResponseModel = orderResponseModelFromJson(jsonString);

import 'dart:convert';

OrderResponseModel orderResponseModelFromJson(String str) =>
    OrderResponseModel.fromJson(json.decode(str));

String orderResponseModelToJson(OrderResponseModel data) =>
    json.encode(data.toJson());

class OrderResponseModel {
  bool? success;
  String? message;
  List<Datum>? data;

  OrderResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? orderId;
  int? userId;
  String? userContactNumber;
  double? total;
  String? paymentMethod;
  DateTime? createdAt;
  List<OrderDetail>? orderDetails;

  Datum({
    this.orderId,
    this.userId,
    this.userContactNumber,
    this.total,
    this.paymentMethod,
    this.createdAt,
    this.orderDetails,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["order_id"],
        userId: json["user_id"],
        userContactNumber: json["user_contact_number"],
        total: json["total"]?.toDouble(),
        paymentMethod: json["payment_method"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        orderDetails: json["order_details"] == null
            ? []
            : List<OrderDetail>.from(
                json["order_details"]!.map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "user_id": userId,
        "user_contact_number": userContactNumber,
        "total": total,
        "payment_method": paymentMethod,
        "created_at": createdAt?.toIso8601String(),
        "order_details": orderDetails == null
            ? []
            : List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
      };
}

class OrderDetail {
  int? orderDetailId;
  int? orderDetailQuantity;
  String? productName;
  String? productPrice;
  double? totalPrice;

  OrderDetail({
    this.orderDetailId,
    this.orderDetailQuantity,
    this.productName,
    this.productPrice,
    this.totalPrice,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        orderDetailId: json["order_detail_id"],
        orderDetailQuantity: json["order_detail_quantity"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        totalPrice: json["total_price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "order_detail_id": orderDetailId,
        "order_detail_quantity": orderDetailQuantity,
        "product_name": productName,
        "product_price": productPrice,
        "total_price": totalPrice,
      };
}

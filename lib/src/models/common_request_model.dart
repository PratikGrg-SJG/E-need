import 'package:e_needs/src/core/enums/enums.dart';

class CommonRequestModel {
  final int? categoryId;
  final int? userId;
  final int? productId;
  final bool? isQtyIncrease;
  final PaymentMethod? paymentMethod;
  final bool? addToWishlist;

  CommonRequestModel({
    this.categoryId,
    this.userId,
    this.productId,
    this.isQtyIncrease,
    this.paymentMethod,
    this.addToWishlist,
  });
}

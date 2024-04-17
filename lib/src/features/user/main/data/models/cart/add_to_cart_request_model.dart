class AddToCartRequestModel {
  final String? userId;
  final String? productId;
  final String? quantity;

  AddToCartRequestModel({
    this.userId,
    this.productId,
    this.quantity,
  });

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
      };
}

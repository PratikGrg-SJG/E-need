// To parse this JSON data, do
//
//     final wishlistResponseModel = wishlistResponseModelFromJson(jsonString);

import 'dart:convert';

List<WishlistResponseModel> wishlistResponseModelFromJson(String str) => List<WishlistResponseModel>.from(json.decode(str).map((x) => WishlistResponseModel.fromJson(x)));

String wishlistResponseModelToJson(List<WishlistResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishlistResponseModel {
    int? id;
    String? name;
    String? image;
    String? description;
    String? price;
    String? categoryId;
    DateTime? createdAt;
    DateTime? updatedAt;

    WishlistResponseModel({
        this.id,
        this.name,
        this.image,
        this.description,
        this.price,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
    });

    factory WishlistResponseModel.fromJson(Map<String, dynamic> json) => WishlistResponseModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        price: json["price"],
        categoryId: json["category_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "category_id": categoryId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

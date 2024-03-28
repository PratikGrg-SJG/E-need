// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromJson(jsonString);

import 'dart:convert';

List<CategoryResponseModel> categoryResponseModelFromJson(String str) => List<CategoryResponseModel>.from(json.decode(str).map((x) => CategoryResponseModel.fromJson(x)));

String categoryResponseModelToJson(List<CategoryResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryResponseModel {
    int? id;
    String? name;
    DateTime? createdAt;
    DateTime? updatedAt;

    CategoryResponseModel({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
    });

    factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => CategoryResponseModel(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

// To parse this JSON data, do
//
//     final userDetailsResponseModel = userDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

UserDetailsResponseModel userDetailsResponseModelFromJson(String str) => UserDetailsResponseModel.fromJson(json.decode(str));

String userDetailsResponseModelToJson(UserDetailsResponseModel data) => json.encode(data.toJson());

class UserDetailsResponseModel {
    int? id;
    String? name;
    dynamic image;
    String? email;
    String? location;
    String? contactNumber;
    dynamic emailVerifiedAt;
    int? role;
    DateTime? createdAt;
    DateTime? updatedAt;

    UserDetailsResponseModel({
        this.id,
        this.name,
        this.image,
        this.email,
        this.location,
        this.contactNumber,
        this.emailVerifiedAt,
        this.role,
        this.createdAt,
        this.updatedAt,
    });

    factory UserDetailsResponseModel.fromJson(Map<String, dynamic> json) => UserDetailsResponseModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        email: json["email"],
        location: json["location"],
        contactNumber: json["contact_number"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "email": email,
        "location": location,
        "contact_number": contactNumber,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

// To parse this JSON data, do
//
//     final registerUserResponseModel = registerUserResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterUserResponseModel registerUserResponseModelFromJson(String str) => RegisterUserResponseModel.fromJson(json.decode(str));

String registerUserResponseModelToJson(RegisterUserResponseModel data) => json.encode(data.toJson());

class RegisterUserResponseModel {
    bool? success;
    String? message;
    Data? data;

    RegisterUserResponseModel({
        this.success,
        this.message,
        this.data,
    });

    factory RegisterUserResponseModel.fromJson(Map<String, dynamic> json) => RegisterUserResponseModel(
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
    String? name;
    String? email;
    String? location;
    String? contactNumber;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.name,
        this.email,
        this.location,
        this.contactNumber,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        location: json["location"],
        contactNumber: json["contact_number"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "location": location,
        "contact_number": contactNumber,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}

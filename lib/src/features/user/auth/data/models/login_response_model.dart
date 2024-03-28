// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    bool? success;
    String? message;
    UserData? data;
    String? token;
    dynamic session;

    LoginResponseModel({
        this.success,
        this.message,
        this.data,
        this.token,
        this.session,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
        token: json["token"],
        session: json["session"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "token": token,
        "session": session,
    };
}

class UserData {
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

    UserData({
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

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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

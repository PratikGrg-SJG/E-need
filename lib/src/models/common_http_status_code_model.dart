import 'dart:convert';

CommonHttpStatusCodeModel commonHttpStatusCodeModelFromJson(String str) =>
    CommonHttpStatusCodeModel.fromJson(json.decode(str));

String commonHttpStatusCodeModelToJson(CommonHttpStatusCodeModel data) =>
    json.encode(data.toJson());

class CommonHttpStatusCodeModel {
  bool? success;
  String? message;
  int? customCode;

  CommonHttpStatusCodeModel({
    this.success,
    this.message,
    this.customCode,
  });

  factory CommonHttpStatusCodeModel.fromJson(Map<String, dynamic> json) =>
      CommonHttpStatusCodeModel(
        success: json["success"],
        message: json["message"],
        customCode: json["customCode"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "customCode": customCode,
      };
}

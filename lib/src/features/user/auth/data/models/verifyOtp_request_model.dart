class VerifyOtpRequestModel {
  final String? email;
  final String? otp;
  final String? type;

  VerifyOtpRequestModel({this.email, this.otp, this.type});

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
        "type": type,
      };
}

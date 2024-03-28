class RegisterUserRequestModel {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? password;
  String? confirmPassword;

  RegisterUserRequestModel({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic>toJson(){
    return{
      "name": name,
      "email": email,
      "contact_number": phone,
      "location": address,
      "password": password,
      "conform_password": confirmPassword
    };
  }
}

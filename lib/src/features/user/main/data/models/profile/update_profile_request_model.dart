class UpdateProfileRequestModel {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;

  UpdateProfileRequestModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if ((name ?? '').isNotEmpty) {
      map['name'] = name;
    }
    if ((email ?? '').isNotEmpty) {
      map['email'] = email;
    }
    if ((phoneNumber ?? '').isNotEmpty) {
      map['contact_number'] = phoneNumber;
    }
    if ((address ?? '').isNotEmpty) {
      map['location'] = address;
    }

    return map;
  }
}

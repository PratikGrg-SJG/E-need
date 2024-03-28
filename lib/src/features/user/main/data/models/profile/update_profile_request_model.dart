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
      map['name'] = name;
    }
    if ((phoneNumber ?? '').isNotEmpty) {
      map['name'] = name;
    }
    if ((address ?? '').isNotEmpty) {
      map['name'] = name;
    }

    return map;
  }
}

class UserModel {
  late String name;
  late String email;
  late String phone;
  late String uId;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    uId = json["uid"];
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'phone': phone, 'uId': uId};
  }
}

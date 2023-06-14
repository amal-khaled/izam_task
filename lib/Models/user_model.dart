import 'dart:convert';

class UserModel {
  int? id;
  String? email;
  String? password;
  int? numberOfLogins;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.numberOfLogins,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        numberOfLogins: json["logins"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "password": password,
        "logins": numberOfLogins ?? 1,
      };
}

UserModel userFromJson(String str) {
  final jsonData = json.decode(str);
  return UserModel.fromMap(jsonData);
}

String userToJson(UserModel data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

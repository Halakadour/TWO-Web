import 'dart:convert';

RegisterNewUserModel registerNewUserModelFromJson(String str) =>
    RegisterNewUserModel.fromJson(json.decode(str));

String registerNewUserModelToJson(RegisterNewUserModel data) =>
    json.encode(data.toJson());

class RegisterNewUserModel {
  final int status;
  final String msg;
  final Data data;

  RegisterNewUserModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory RegisterNewUserModel.fromJson(Map<String, dynamic> json) =>
      RegisterNewUserModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  final String token;
  final String name;
  final String email;

  Data({
    required this.token,
    required this.name,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "email": email,
      };
}

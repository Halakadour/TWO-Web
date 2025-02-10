import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  final int status;
  final String msg;
  final Data data;

  LoginUserModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
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

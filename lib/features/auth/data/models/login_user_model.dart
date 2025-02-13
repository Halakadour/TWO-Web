import 'dart:convert';

import 'package:two_website/features/auth/data/models/user_model.dart';

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  final int status;
  final String msg;
  final UserModel data;

  LoginUserModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        status: json["status"],
        msg: json["msg"],
        data: UserModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

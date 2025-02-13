import 'dart:convert';

import 'package:two_website/features/auth/data/models/user_model.dart';

RegisterNewUserModel registerNewUserModelFromJson(String str) =>
    RegisterNewUserModel.fromJson(json.decode(str));

String registerNewUserModelToJson(RegisterNewUserModel data) =>
    json.encode(data.toJson());

class RegisterNewUserModel {
  final int status;
  final String msg;
  final UserModel data;

  RegisterNewUserModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory RegisterNewUserModel.fromJson(Map<String, dynamic> json) =>
      RegisterNewUserModel(
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

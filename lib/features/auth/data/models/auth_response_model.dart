import 'dart:convert';

import 'package:two_website/core/models/user_model.dart';

AuthResponseModel authResponseModelFromJson(String str) =>
    AuthResponseModel.fromJson(json.decode(str));

String authResponseModelToJson(AuthResponseModel data) =>
    json.encode(data.toJson());

class AuthResponseModel {
  final int status;
  final String msg;
  final UserModel data;

  AuthResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
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

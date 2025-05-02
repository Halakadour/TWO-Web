import 'dart:convert';

SignOutResponseModel logoutUserModelFromJson(String str) =>
    SignOutResponseModel.fromJson(json.decode(str));

String logoutUserModelToJson(SignOutResponseModel data) =>
    json.encode(data.toJson());

class SignOutResponseModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  SignOutResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory SignOutResponseModel.fromJson(Map<String, dynamic> json) =>
      SignOutResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}

import 'dart:convert';

LogoutUserModel logoutUserModelFromJson(String str) =>
    LogoutUserModel.fromJson(json.decode(str));

String logoutUserModelToJson(LogoutUserModel data) =>
    json.encode(data.toJson());

class LogoutUserModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  LogoutUserModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory LogoutUserModel.fromJson(Map<String, dynamic> json) =>
      LogoutUserModel(
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

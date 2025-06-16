import 'dart:convert';

EmptyResponseModel emptyResponseModelFromJson(String str) =>
    EmptyResponseModel.fromJson(json.decode(str));

String emptyResponseModelToJson(EmptyResponseModel data) =>
    json.encode(data.toJson());

class EmptyResponseModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  EmptyResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory EmptyResponseModel.fromJson(Map<String, dynamic> json) =>
      EmptyResponseModel(
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

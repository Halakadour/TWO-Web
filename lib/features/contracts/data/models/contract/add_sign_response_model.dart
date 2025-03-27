import 'dart:convert';

AddSignResponseModel addSignResponseModelFromJson(String str) =>
    AddSignResponseModel.fromJson(json.decode(str));

String addSignResponseModelToJson(AddSignResponseModel data) =>
    json.encode(data.toJson());

class AddSignResponseModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  AddSignResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory AddSignResponseModel.fromJson(Map<String, dynamic> json) =>
      AddSignResponseModel(
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

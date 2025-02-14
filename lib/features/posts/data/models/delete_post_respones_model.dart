import 'dart:convert';

DeletePostResponesModel deletePostResponesModelFromJson(String str) =>
    DeletePostResponesModel.fromJson(json.decode(str));

String deletePostResponesModelToJson(DeletePostResponesModel data) =>
    json.encode(data.toJson());

class DeletePostResponesModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  DeletePostResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory DeletePostResponesModel.fromJson(Map<String, dynamic> json) =>
      DeletePostResponesModel(
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

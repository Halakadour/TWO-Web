import 'dart:convert';

DeleteServiceResponesModel deleteServiceResponesModelFromJson(String str) =>
    DeleteServiceResponesModel.fromJson(json.decode(str));

String deleteServiceResponesModelToJson(DeleteServiceResponesModel data) =>
    json.encode(data.toJson());

class DeleteServiceResponesModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  DeleteServiceResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory DeleteServiceResponesModel.fromJson(Map<String, dynamic> json) =>
      DeleteServiceResponesModel(
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

import 'dart:convert';

DeleteWhyUsResponesModel deleteWhyUsResponesModelFromJson(String str) =>
    DeleteWhyUsResponesModel.fromJson(json.decode(str));

String deleteWhyUsResponesModelToJson(DeleteWhyUsResponesModel data) =>
    json.encode(data.toJson());

class DeleteWhyUsResponesModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  DeleteWhyUsResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory DeleteWhyUsResponesModel.fromJson(Map<String, dynamic> json) =>
      DeleteWhyUsResponesModel(
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

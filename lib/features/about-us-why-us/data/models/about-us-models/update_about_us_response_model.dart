import 'dart:convert';

UpdateAboutUsResponesModel updateAboutUsResponesModelFromJson(String str) =>
    UpdateAboutUsResponesModel.fromJson(json.decode(str));

String updateAboutUsResponesModelToJson(UpdateAboutUsResponesModel data) =>
    json.encode(data.toJson());

class UpdateAboutUsResponesModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  UpdateAboutUsResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory UpdateAboutUsResponesModel.fromJson(Map<String, dynamic> json) =>
      UpdateAboutUsResponesModel(
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

import 'dart:convert';

UpdateServiceResponesModel updateServiceResponesModelFromJson(String str) =>
    UpdateServiceResponesModel.fromJson(json.decode(str));

String updateServiceResponesModelToJson(UpdateServiceResponesModel data) =>
    json.encode(data.toJson());

class UpdateServiceResponesModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  UpdateServiceResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory UpdateServiceResponesModel.fromJson(Map<String, dynamic> json) =>
      UpdateServiceResponesModel(
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

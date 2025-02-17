import 'dart:convert';

UpdateClientProfileResponesModel updateClientProfileResponesModelFromJson(
        String str) =>
    UpdateClientProfileResponesModel.fromJson(json.decode(str));

String updateClientProfileResponesModelToJson(
        UpdateClientProfileResponesModel data) =>
    json.encode(data.toJson());

class UpdateClientProfileResponesModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  UpdateClientProfileResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory UpdateClientProfileResponesModel.fromJson(
          Map<String, dynamic> json) =>
      UpdateClientProfileResponesModel(
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

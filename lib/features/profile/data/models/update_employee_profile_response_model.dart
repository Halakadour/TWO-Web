// To parse this JSON data, do
//
//     final updateEmployeeProfileResponesModel = updateEmployeeProfileResponesModelFromJson(jsonString);

import 'dart:convert';

UpdateEmployeeProfileResponesModel updateEmployeeProfileResponesModelFromJson(
        String str) =>
    UpdateEmployeeProfileResponesModel.fromJson(json.decode(str));

String updateEmployeeProfileResponesModelToJson(
        UpdateEmployeeProfileResponesModel data) =>
    json.encode(data.toJson());

class UpdateEmployeeProfileResponesModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  UpdateEmployeeProfileResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory UpdateEmployeeProfileResponesModel.fromJson(
          Map<String, dynamic> json) =>
      UpdateEmployeeProfileResponesModel(
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

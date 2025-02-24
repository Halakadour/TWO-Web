import 'dart:convert';

import 'package:two_website/features/services/data/models/service_model.dart';

CreateServiceResponesModel createServiceResponesModelFromJson(String str) =>
    CreateServiceResponesModel.fromJson(json.decode(str));

String createServiceResponesModelToJson(CreateServiceResponesModel data) =>
    json.encode(data.toJson());

class CreateServiceResponesModel {
  final int status;
  final String msg;
  final ServiceModel data;

  CreateServiceResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreateServiceResponesModel.fromJson(Map<String, dynamic> json) =>
      CreateServiceResponesModel(
        status: json["status"],
        msg: json["msg"],
        data: ServiceModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

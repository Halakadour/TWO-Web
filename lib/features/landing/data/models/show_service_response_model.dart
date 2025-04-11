import 'dart:convert';

import 'package:two_website/features/landing/data/models/service_model.dart';

ShowServiceResponesModel showServiceResponesModelFromJson(String str) =>
    ShowServiceResponesModel.fromJson(json.decode(str));

String showServiceResponesModelToJson(ShowServiceResponesModel data) =>
    json.encode(data.toJson());

class ShowServiceResponesModel {
  final int status;
  final String msg;
  final List<ServiceModel> data;

  ShowServiceResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowServiceResponesModel.fromJson(Map<String, dynamic> json) =>
      ShowServiceResponesModel(
        status: json["status"],
        msg: json["msg"],
        data: List<ServiceModel>.from(
            json["data"].map((x) => ServiceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

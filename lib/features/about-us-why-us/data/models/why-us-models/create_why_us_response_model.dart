import 'dart:convert';

import 'package:two_website/features/about-us-why-us/data/models/why-us-models/why_us_model.dart';

CreateWhyUsResponesModel createWhyUsResponesModelFromJson(String str) =>
    CreateWhyUsResponesModel.fromJson(json.decode(str));

String createWhyUsResponesModelToJson(CreateWhyUsResponesModel data) =>
    json.encode(data.toJson());

class CreateWhyUsResponesModel {
  final int status;
  final String msg;
  final WhyUsModel data;

  CreateWhyUsResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreateWhyUsResponesModel.fromJson(Map<String, dynamic> json) =>
      CreateWhyUsResponesModel(
        status: json["status"],
        msg: json["msg"],
        data: WhyUsModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

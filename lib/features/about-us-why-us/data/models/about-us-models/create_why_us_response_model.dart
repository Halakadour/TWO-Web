import 'dart:convert';

import 'package:two_website/features/about-us-why-us/data/models/about-us-models/about_us_model.dart';

CreateAboutUsResponesModel createAboutUsResponesModelFromJson(String str) =>
    CreateAboutUsResponesModel.fromJson(json.decode(str));

String createAboutUsResponesModelToJson(CreateAboutUsResponesModel data) =>
    json.encode(data.toJson());

class CreateAboutUsResponesModel {
  final int status;
  final String msg;
  final AboutUsModel data;

  CreateAboutUsResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreateAboutUsResponesModel.fromJson(Map<String, dynamic> json) =>
      CreateAboutUsResponesModel(
        status: json["status"],
        msg: json["msg"],
        data: AboutUsModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

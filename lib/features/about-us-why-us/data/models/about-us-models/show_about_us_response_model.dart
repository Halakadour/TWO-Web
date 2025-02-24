import 'dart:convert';

import 'package:two_website/features/about-us-why-us/data/models/about-us-models/about_us_model.dart';

ShowAboutUsResponesModel showAboutUsResponesModelFromJson(String str) =>
    ShowAboutUsResponesModel.fromJson(json.decode(str));

String showAboutUsResponesModelToJson(ShowAboutUsResponesModel data) =>
    json.encode(data.toJson());

class ShowAboutUsResponesModel {
  final int status;
  final String msg;
  final AboutUsModel data;

  ShowAboutUsResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowAboutUsResponesModel.fromJson(Map<String, dynamic> json) =>
      ShowAboutUsResponesModel(
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

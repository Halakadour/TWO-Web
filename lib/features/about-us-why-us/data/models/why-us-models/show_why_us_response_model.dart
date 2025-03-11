import 'dart:convert';

import 'package:two_website/features/about-us-why-us/data/models/why-us-models/why_us_model.dart';

ShowWhyUsResponesModel showWhyUsResponesModelFromJson(String str) =>
    ShowWhyUsResponesModel.fromJson(json.decode(str));

String showWhyUsResponesModelToJson(ShowWhyUsResponesModel data) =>
    json.encode(data.toJson());

class ShowWhyUsResponesModel {
  final int status;
  final String msg;
  final List<WhyUsModel> data;

  ShowWhyUsResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowWhyUsResponesModel.fromJson(Map<String, dynamic> json) =>
      ShowWhyUsResponesModel(
        status: json["status"],
        msg: json["msg"],
        data: List<WhyUsModel>.from(
            json["data"].map((x) => WhyUsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

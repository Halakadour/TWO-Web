import 'dart:convert';

import 'package:two_website/features/about-us-why-us/data/models/why-us-models/why_us_model.dart';

CreateWhyUsResponseModel createWhyUsResponseModelFromJson(String str) =>
    CreateWhyUsResponseModel.fromJson(json.decode(str));

String createWhyUsResponseModelToJson(CreateWhyUsResponseModel data) =>
    json.encode(data.toJson());

class CreateWhyUsResponseModel {
  final int status;
  final String msg;
  final WhyUsModel data;

  CreateWhyUsResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreateWhyUsResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateWhyUsResponseModel(
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

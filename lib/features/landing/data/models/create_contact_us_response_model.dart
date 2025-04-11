import 'dart:convert';

import 'package:two_website/features/landing/data/models/contact_us_model.dart';

CreateContactUsResponseModel createContactUsResponseModelFromJson(String str) =>
    CreateContactUsResponseModel.fromJson(json.decode(str));

String createContactUsResponseModelToJson(CreateContactUsResponseModel data) =>
    json.encode(data.toJson());

class CreateContactUsResponseModel {
  final int status;
  final String msg;
  final ContactUsModel data;

  CreateContactUsResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreateContactUsResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateContactUsResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: ContactUsModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

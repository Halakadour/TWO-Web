import 'dart:convert';

import 'package:two_website/features/contact-us/data/models/contact_us_model.dart';

ShowNotApprovedContactUsResponseModel
    showNotApprovedContactUsResponseModelFromJson(String str) =>
        ShowNotApprovedContactUsResponseModel.fromJson(json.decode(str));

String showNotApprovedContactUsResponseModelToJson(
        ShowNotApprovedContactUsResponseModel data) =>
    json.encode(data.toJson());

class ShowNotApprovedContactUsResponseModel {
  final int status;
  final String msg;
  final List<ContactUsModel> data;

  ShowNotApprovedContactUsResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowNotApprovedContactUsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ShowNotApprovedContactUsResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<ContactUsModel>.from(
            json["data"].map((x) => ContactUsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

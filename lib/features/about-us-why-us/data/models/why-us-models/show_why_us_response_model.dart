import 'dart:convert';
import 'package:two_website/features/about-us-why-us/data/models/why-us-models/why_us_model.dart';

ShowWhyUsResponesModel showWhyUsResponesModelFromJson(String str) =>
    ShowWhyUsResponesModel.fromJson(json.decode(str));

String showWhyUsResponesModelToJson(ShowWhyUsResponesModel data) =>
    json.encode(data.toJson());

class ShowWhyUsResponesModel {
  final int status;
  final String msg;
  final WhyUsModel? data;

  ShowWhyUsResponesModel({
    required this.status,
    required this.msg,
    this.data, // Data can be null
  });

  factory ShowWhyUsResponesModel.fromJson(Map<String, dynamic> json) {
    return ShowWhyUsResponesModel(
      status: json["status"],
      msg: json["msg"],
      data: json["data"] is List
          ? null
          : WhyUsModel.fromJson(json["data"]), // Check if data is a list
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data?.toJson(), // Use null-aware operator
      };
}

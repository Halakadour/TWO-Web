import 'dart:convert';

import 'package:two_website/core/models/profile_model.dart';

GetUserProfileResponseModel getUserProfileResponseModelFromJson(String str) =>
    GetUserProfileResponseModel.fromJson(json.decode(str));

String getUserProfileResponseModelToJson(GetUserProfileResponseModel data) =>
    json.encode(data.toJson());

class GetUserProfileResponseModel {
  final int status;
  final String msg;
  final ProfileModel data;

  GetUserProfileResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory GetUserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      GetUserProfileResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: ProfileModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

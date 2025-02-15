import 'dart:convert';

import 'package:two_website/features/posts/data/models/post_model.dart';

ShowPostResponesModel showPostResponesModelFromJson(String str) =>
    ShowPostResponesModel.fromJson(json.decode(str));

String showPostResponesModelToJson(ShowPostResponesModel data) =>
    json.encode(data.toJson());

class ShowPostResponesModel {
  final int status;
  final String msg;
  final List<PostModel> data;

  ShowPostResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowPostResponesModel.fromJson(Map<String, dynamic> json) =>
      ShowPostResponesModel(
        status: json["status"],
        msg: json["msg"],
        data: List<PostModel>.from(
            json["data"].map((x) => PostModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

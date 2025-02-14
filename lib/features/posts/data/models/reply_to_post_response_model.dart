import 'dart:convert';

import 'package:two_website/features/posts/data/models/replay_model.dart';

ReplyToPostResponesModel replyToPostResponesModelFromJson(String str) =>
    ReplyToPostResponesModel.fromJson(json.decode(str));

String replyToPostResponesModelToJson(ReplyToPostResponesModel data) =>
    json.encode(data.toJson());

class ReplyToPostResponesModel {
  final int status;
  final String msg;
  final ReplyModel data;

  ReplyToPostResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ReplyToPostResponesModel.fromJson(Map<String, dynamic> json) =>
      ReplyToPostResponesModel(
        status: json["status"],
        msg: json["msg"],
        data: ReplyModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

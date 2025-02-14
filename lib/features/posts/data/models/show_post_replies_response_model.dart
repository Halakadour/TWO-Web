import 'dart:convert';

import 'package:two_website/features/posts/data/models/replay_model.dart';

ShowPostRepliesResponesModel showPostRepliesResponesModelFromJson(String str) =>
    ShowPostRepliesResponesModel.fromJson(json.decode(str));

String showPostRepliesResponesModelToJson(ShowPostRepliesResponesModel data) =>
    json.encode(data.toJson());

class ShowPostRepliesResponesModel {
  final int status;
  final String msg;
  final List<ReplyModel> data;

  ShowPostRepliesResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowPostRepliesResponesModel.fromJson(Map<String, dynamic> json) =>
      ShowPostRepliesResponesModel(
        status: json["status"],
        msg: json["msg"],
        data: List<ReplyModel>.from(
            json["data"].map((x) => ReplyModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

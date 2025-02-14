import 'dart:convert';

import 'package:two_website/features/posts/data/models/post_model.dart';

CreatePostResponseModel createPostResponseModelFromJson(String str) =>
    CreatePostResponseModel.fromJson(json.decode(str));

String createPostResponseModelToJson(CreatePostResponseModel data) =>
    json.encode(data.toJson());

class CreatePostResponseModel {
  final int status;
  final String msg;
  final PostModel data;

  CreatePostResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreatePostResponseModel.fromJson(Map<String, dynamic> json) =>
      CreatePostResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: PostModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

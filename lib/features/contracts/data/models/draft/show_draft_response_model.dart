import 'dart:convert';

import 'package:two_website/features/contracts/data/models/draft/draft_model.dart';

ShowDraftResponseModel showDraftResponseModelFromJson(String str) =>
    ShowDraftResponseModel.fromJson(json.decode(str));

String showDraftResponseModelToJson(ShowDraftResponseModel data) =>
    json.encode(data.toJson());

class ShowDraftResponseModel {
  final int status;
  final String msg;
  final List<DraftModel> data;

  ShowDraftResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowDraftResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowDraftResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<DraftModel>.from(
            json["data"].map((x) => DraftModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

import 'dart:convert';

AcceptReplyResponesModel acceptReplyResponesModelFromJson(String str) =>
    AcceptReplyResponesModel.fromJson(json.decode(str));

String acceptReplyResponesModelToJson(AcceptReplyResponesModel data) =>
    json.encode(data.toJson());

class AcceptReplyResponesModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  AcceptReplyResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory AcceptReplyResponesModel.fromJson(Map<String, dynamic> json) =>
      AcceptReplyResponesModel(
        status: json["status"],
        msg: json["msg"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}

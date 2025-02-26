import 'dart:convert';

MarkContactUsAsSeenResponseModel markContactUsAsSeenResponseModelFromJson(
        String str) =>
    MarkContactUsAsSeenResponseModel.fromJson(json.decode(str));

String markContactUsAsSeenResponseModelToJson(
        MarkContactUsAsSeenResponseModel data) =>
    json.encode(data.toJson());

class MarkContactUsAsSeenResponseModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  MarkContactUsAsSeenResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory MarkContactUsAsSeenResponseModel.fromJson(
          Map<String, dynamic> json) =>
      MarkContactUsAsSeenResponseModel(
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

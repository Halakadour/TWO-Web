import 'dart:convert';

MarkContactUsAsApprovedResponseModel markContactUsAsApprovedModelFromJson(
        String str) =>
    MarkContactUsAsApprovedResponseModel.fromJson(json.decode(str));

String markContactUsAsApprovedModelToJson(
        MarkContactUsAsApprovedResponseModel data) =>
    json.encode(data.toJson());

class MarkContactUsAsApprovedResponseModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  MarkContactUsAsApprovedResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory MarkContactUsAsApprovedResponseModel.fromJson(
          Map<String, dynamic> json) =>
      MarkContactUsAsApprovedResponseModel(
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

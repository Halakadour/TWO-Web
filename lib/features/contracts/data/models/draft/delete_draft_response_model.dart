import 'dart:convert';

DeleteDraftResponseModel deleteDraftResponseModelFromJson(String str) =>
    DeleteDraftResponseModel.fromJson(json.decode(str));

String deleteDraftResponseModelToJson(DeleteDraftResponseModel data) =>
    json.encode(data.toJson());

class DeleteDraftResponseModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  DeleteDraftResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory DeleteDraftResponseModel.fromJson(Map<String, dynamic> json) =>
      DeleteDraftResponseModel(
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

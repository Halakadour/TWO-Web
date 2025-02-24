import 'dart:convert';

UpdateWhyUsResponesModel updateWhyUsResponesModelFromJson(String str) =>
    UpdateWhyUsResponesModel.fromJson(json.decode(str));

String updateWhyUsResponesModelToJson(UpdateWhyUsResponesModel data) =>
    json.encode(data.toJson());

class UpdateWhyUsResponesModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  UpdateWhyUsResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory UpdateWhyUsResponesModel.fromJson(Map<String, dynamic> json) =>
      UpdateWhyUsResponesModel(
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

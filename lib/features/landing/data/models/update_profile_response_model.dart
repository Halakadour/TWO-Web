import 'dart:convert';

UpdateProfileResponesModel updateProfileResponesModelFromJson(String str) =>
    UpdateProfileResponesModel.fromJson(json.decode(str));

String updateProfileResponesModelToJson(UpdateProfileResponesModel data) =>
    json.encode(data.toJson());

class UpdateProfileResponesModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  UpdateProfileResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory UpdateProfileResponesModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponesModel(
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

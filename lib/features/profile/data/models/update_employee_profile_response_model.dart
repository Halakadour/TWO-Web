import 'dart:convert';

UpdateEmployeeProfileResponesModel updateEmployeeProfileResponesModelFromJson(
        String str) =>
    UpdateEmployeeProfileResponesModel.fromJson(json.decode(str));

String updateEmployeeProfileResponesModelToJson(
        UpdateEmployeeProfileResponesModel data) =>
    json.encode(data.toJson());

class UpdateEmployeeProfileResponesModel {
  final int status;
  final String msg;
  final EmployeeProfileModel data;

  UpdateEmployeeProfileResponesModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory UpdateEmployeeProfileResponesModel.fromJson(
          Map<String, dynamic> json) =>
      UpdateEmployeeProfileResponesModel(
        status: json["status"],
        msg: json["msg"],
        data: EmployeeProfileModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class EmployeeProfileModel {
  final int id;
  final String name;
  final String email;
  final String image;
  final String role;
  final String cv;

  EmployeeProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.role,
    required this.cv,
  });

  factory EmployeeProfileModel.fromJson(Map<String, dynamic> json) =>
      EmployeeProfileModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        role: json["role"],
        cv: json["cv"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "role": role,
        "cv": cv,
      };
}

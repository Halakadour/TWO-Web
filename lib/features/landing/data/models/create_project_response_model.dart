import 'dart:convert';

CreateProjectResponseModel createProjectResponseModelFromJson(String str) =>
    CreateProjectResponseModel.fromJson(json.decode(str));

String createProjectResponseModelToJson(CreateProjectResponseModel data) =>
    json.encode(data.toJson());

class CreateProjectResponseModel {
  final int status;
  final String msg;
  final ProjectModel data;

  CreateProjectResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreateProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateProjectResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: ProjectModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class ProjectModel {
  final int id;
  final String projectType;
  final String projectDescription;
  final List<String> requirements;
  final String document;
  final String cooperationType;
  final String contactTime;
  final String private;
  final dynamic contract;
  final dynamic status;
  final dynamic team;

  ProjectModel({
    required this.id,
    required this.projectType,
    required this.projectDescription,
    required this.requirements,
    required this.document,
    required this.cooperationType,
    required this.contactTime,
    required this.private,
    required this.contract,
    required this.status,
    required this.team,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json["id"],
        projectType: json["project_type"],
        projectDescription: json["project_description"],
        requirements: List<String>.from(json["requirements"].map((x) => x)),
        document: json["document"],
        cooperationType: json["cooperation_type"],
        contactTime: json["contact_time"],
        private: json["private"],
        contract: json["contract"],
        status: json["status"],
        team: json["team"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project_type": projectType,
        "project_description": projectDescription,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "document": document,
        "cooperation_type": cooperationType,
        "contact_time": contactTime,
        "private": private,
        "contract": contract,
        "status": status,
        "team": team,
      };
}

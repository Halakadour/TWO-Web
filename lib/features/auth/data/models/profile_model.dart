import 'package:two_website/features/auth/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  final int id;
  final String name;
  final String email;
  final String? image;
  final String role;
  final String? cv;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.role,
    required this.cv,
  }) : super(
          pId: id,
          pName: name,
          pEmail: email,
          pImage: image,
          pRole: role,
          pCv: cv,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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

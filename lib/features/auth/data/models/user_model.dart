import 'package:two_website/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String token;
  final String name;
  final String email;

  const UserModel({
    required this.token,
    required this.name,
    required this.email,
  }) : super(token: token, fullName: name, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "email": email,
      };
}

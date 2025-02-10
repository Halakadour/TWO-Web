import 'dart:io';

class UserEntity {
  final String token;
  final String fullName;
  final String email;
  final String password;
  final File? image;
  final String? role;
  final File? cv;
  UserEntity({
    required this.token,
    required this.fullName,
    required this.email,
    required this.password,
    this.image,
    this.role,
    this.cv,
  });
}

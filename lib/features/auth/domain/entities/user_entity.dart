import 'dart:io';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? token;
  final String? fullName;
  final String? email;
  final String? password;
  final File? image;
  final String? role;
  final File? cv;
  const UserEntity({
    this.token,
    this.fullName,
    this.email,
    this.password,
    this.image,
    this.role,
    this.cv,
  });

  @override
  List<Object?> get props =>
      [token, fullName, email, password, image, role, cv];
}

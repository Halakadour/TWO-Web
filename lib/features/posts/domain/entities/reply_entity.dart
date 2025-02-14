import 'dart:io';

class ReplyEntity {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final File cv;
  ReplyEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.cv,
  });
}

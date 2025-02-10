import 'package:dartz/dartz.dart';
import 'package:two_website/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> registNewUser(
      String name, String email, String password, String confirmPassword);
  Future<UserEntity> loginUser(String token, String email, String password);
  Future<Unit> logoutUser(String token);
}

import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo with HandlingExceptionManager {
  Future<Either<Failure, UserEntity>> registNewUser(
      String name, String email, String password, String confirmPassword);
  Future<Either<Failure, UserEntity>> loginUser(
      String token, String email, String password);
  Future<Either<Failure, Unit>> logoutUser(String token);
}

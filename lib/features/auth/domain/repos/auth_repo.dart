import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/auth/data/models/login_user_model.dart';
import 'package:two_website/features/auth/data/models/register_new_user_model.dart';

abstract class AuthRepo with HandlingExceptionManager {
  Future<Either<Failure, RegisterNewUserModel>> registNewUser(
      String name, String email, String password, String confirmPassword);
  Future<Either<Failure, RegisterNewUserModel>> registLoginWithGoogle();
  Future<Either<Failure, RegisterNewUserModel>> registLoginWithGithup();
  Future<Either<Failure, LoginUserModel>> loginUser(
      String token, String email, String password);
  Future<Either<Failure, Unit>> logoutUser(String token);
}

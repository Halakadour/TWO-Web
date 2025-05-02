import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/auth/data/models/auth_response_model.dart';
import 'package:two_website/features/auth/domain/entity/profile_entity.dart';

abstract class AuthRepo with HandlingExceptionManager {
  Future<Either<Failure, AuthResponseModel>> signUp(
      String name, String email, String password, String confirmPassword);
  Future<Either<Failure, AuthResponseModel>> registLoginWithGoogle();
  Future<Either<Failure, AuthResponseModel>> registLoginWithGithup();
  Future<Either<Failure, AuthResponseModel>> signIn(
      String token, String email, String password);
  Future<Either<Failure, Unit>> signOut(String token);
  Future<Either<Failure, ProfileEntity>> getUserPorfile(String token);
}

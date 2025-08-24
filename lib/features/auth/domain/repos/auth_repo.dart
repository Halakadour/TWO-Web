import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/core/param/auth_param.dart';
import 'package:two_website/features/auth/data/models/role_response_model.dart';
import 'package:two_website/core/models/user_model.dart';
import 'package:two_website/features/auth/domain/entity/profile_entity.dart';

abstract class AuthRepo with HandlingExceptionManager {
  // Auth //
  Future<Either<Failure, UserModel>> signUp(RegisterParams params);
  Future<Either<Failure, UserModel>> registLoginWithGoogle();
  Future<Either<Failure, UserModel>> registLoginWithGithup();
  Future<Either<Failure, UserModel>> signIn(LoginParams parama);
  Future<Either<Failure, Unit>> signOut(String token);

  // Role //
  Future<Either<Failure, List<RoleModel>>> showRoles();

  // Profile //
  Future<Either<Failure, ProfileEntity>> getUserPorfile(String token);
  Future<Either<Failure, Unit>> updateFreelancerProfile(
      UpdateProfileParam param);
  Future<Either<Failure, Unit>> updateGuestProfile(UpdateProfileParam param);
  Future<Either<Failure, Unit>> updateClientProfile(UpdateProfileParam param);
}

import 'package:dartz/dartz.dart';

import 'package:two_website/core/error/failures.dart';
import 'package:two_website/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_website/features/auth/data/models/login_user_model.dart';
import 'package:two_website/features/auth/data/models/register_new_user_model.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({
    required this.authRemoteDataSource,
  });
  @override
  Future<Either<Failure, LoginUserModel>> loginUser(
      String token, String email, String password) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDataSource.login(token, email, password);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, Unit>> logoutUser(String token) {
    return wrapHandling(tryCall: () async {
      await authRemoteDataSource.logout(token);
      return const Right(unit);
    });
  }

  @override
  Future<Either<Failure, RegisterNewUserModel>> registNewUser(
      String name, String email, String password, String confirmPassword) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDataSource.regist(
          name, email, password, confirmPassword);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, RegisterNewUserModel>> registLoginWithGithup() {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDataSource.registLoginWithGithup();
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, RegisterNewUserModel>> registLoginWithGoogle() {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDataSource.registLoginWithGoogle();
        return Right(result);
      },
    );
  }
}

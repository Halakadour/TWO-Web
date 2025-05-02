import 'package:dartz/dartz.dart';

import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/network/network_connection_checker.dart';
import 'package:two_website/features/auth/data/datasources/auth_locale_data_source.dart';
import 'package:two_website/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_website/features/auth/data/models/auth_response_model.dart';
import 'package:two_website/features/auth/domain/entity/profile_entity.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocaleDataSource authLocaleDataSource;
  final NetworkInfoImpl networkInfo;

  AuthRepoImpl(
      {required this.authRemoteDataSource,
      required this.authLocaleDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, AuthResponseModel>> signIn(
      String token, String email, String password) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDataSource.signIn(token, email, password);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, Unit>> signOut(String token) {
    return wrapHandling(tryCall: () async {
      await authRemoteDataSource.signOut(token);
      return const Right(unit);
    });
  }

  @override
  Future<Either<Failure, AuthResponseModel>> signUp(
      String name, String email, String password, String confirmPassword) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDataSource.signUp(
          name, email, password, confirmPassword);
      return Right(result);
    });
  }

  @override
  Future<Either<Failure, AuthResponseModel>> registLoginWithGithup() {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDataSource.registLoginWithGithup();
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, AuthResponseModel>> registLoginWithGoogle() {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDataSource.registLoginWithGoogle();
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, ProfileEntity>> getUserPorfile(String token) {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remoteProfile = await authRemoteDataSource.getUserProfile(
            token,
          );
          authLocaleDataSource.cacheUserProfile(remoteProfile.data);
          return Right(remoteProfile.data);
        } else {
          final localProfile = await authLocaleDataSource.getUserProfile();
          return Right(localProfile);
        }
      },
    );
  }
}

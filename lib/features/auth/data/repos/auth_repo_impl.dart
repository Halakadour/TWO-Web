import 'package:dartz/dartz.dart';

import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/models/user_model.dart';
import 'package:two_website/core/network/network_connection_checker.dart';
import 'package:two_website/features/auth/data/datasources/auth_locale_data_source.dart';
import 'package:two_website/features/auth/data/datasources/auth_param.dart';
import 'package:two_website/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_website/features/auth/data/models/role_response_model.dart';
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
  Future<Either<Failure, UserModel>> signIn(LoginParams param) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDataSource.signIn(param);
      return Right(result.data);
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
  Future<Either<Failure, UserModel>> signUp(RegisterParams param) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDataSource.signUp(param);
      return Right(result.data);
    });
  }

  @override
  Future<Either<Failure, UserModel>> registLoginWithGithup() {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDataSource.registLoginWithGithup();
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> registLoginWithGoogle() {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDataSource.registLoginWithGoogle();
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<RoleModel>>> showRoles() {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remoteRoles = await authRemoteDataSource.showRoles();
          authLocaleDataSource.cacheRoles(remoteRoles.data);
          return Right(remoteRoles.data);
        } else {
          final localRoles = await authLocaleDataSource.getCachedRoles();
          return Right(localRoles);
        }
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

  @override
  Future<Either<Failure, Unit>> updateClientProfile(
      UpdateClientProfileParam param) {
    return wrapHandling(
      tryCall: () async {
        await authRemoteDataSource.updateClientProfile(param);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateFreelancerProfile(
      UpdateFreeLanceAndGesutProfileParam param) {
    return wrapHandling(
      tryCall: () async {
        await authRemoteDataSource.updateFreeLanceProfile(param);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateGuestProfile(
      UpdateFreeLanceAndGesutProfileParam param) {
    return wrapHandling(
      tryCall: () async {
        await authRemoteDataSource.updateGuestProfile(param);
        return const Right(unit);
      },
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_website/core/error/failures.dart';
import 'package:two_website/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_website/features/auth/domain/entities/user_entity.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({
    required this.authRemoteDataSource,
  });
  @override
  Future<Either<Failure, UserEntity>> loginUser(
      String token, String email, String password) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDataSource.login(token, email, password);
      return Right(result.data);
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
  Future<Either<Failure, UserEntity>> registNewUser(
      String name, String email, String password, String confirmPassword) {
    return wrapHandling(tryCall: () async {
      final result = await authRemoteDataSource.regist(
          name, email, password, confirmPassword);
      return Right(result.data);
    });
  }
}

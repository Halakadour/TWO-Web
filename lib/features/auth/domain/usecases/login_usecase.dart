import 'package:dartz/dartz.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/auth/domain/entities/user_entity.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/error/failures.dart';

class LoginUsecase
    extends UseCase<Future<Either<Failure, UserEntity>>, UserEntity> {
  final AuthRepo authRepo;
  LoginUsecase(this.authRepo);

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity param) async {
    return await authRepo.loginUser(
        param.fullName!, param.email!, param.password!);
  }
}

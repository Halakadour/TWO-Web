import 'package:dartz/dartz.dart';
import 'package:two_website/core/models/user_model.dart';

import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/auth/data/datasources/auth_param.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/error/failures.dart';

class SignInUsecase
    extends UseCase<Future<Either<Failure, UserModel>>, LoginParams> {
  final AuthRepo authRepo;
  SignInUsecase(this.authRepo);

  @override
  Future<Either<Failure, UserModel>> call(LoginParams param) async {
    return await authRepo
        .signIn(LoginParams(email: param.email, password: param.password));
  }
}

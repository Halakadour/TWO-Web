import 'package:dartz/dartz.dart';

import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/auth/data/models/login_user_model.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/error/failures.dart';

class LoginUsecase
    extends UseCase<Future<Either<Failure, LoginUserModel>>, LoginParams> {
  final AuthRepo authRepo;
  LoginUsecase(this.authRepo);

  @override
  Future<Either<Failure, LoginUserModel>> call(LoginParams param) async {
    return await authRepo.loginUser(param.token, param.email, param.password);
  }
}

class LoginParams {
  final String token;
  final String email;
  final String password;
  LoginParams({
    required this.token,
    required this.email,
    required this.password,
  });
}

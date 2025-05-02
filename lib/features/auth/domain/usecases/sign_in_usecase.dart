import 'package:dartz/dartz.dart';

import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/auth/data/models/auth_response_model.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/error/failures.dart';

class SignInUsecase
    extends UseCase<Future<Either<Failure, AuthResponseModel>>, LoginParams> {
  final AuthRepo authRepo;
  SignInUsecase(this.authRepo);

  @override
  Future<Either<Failure, AuthResponseModel>> call(LoginParams param) async {
    return await authRepo.signIn(param.token, param.email, param.password);
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

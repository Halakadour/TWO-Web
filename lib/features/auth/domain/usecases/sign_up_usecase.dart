import 'package:dartz/dartz.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/auth/data/models/auth_response_model.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/error/failures.dart';

class SignUpUsecase extends UseCase<Future<Either<Failure, AuthResponseModel>>,
    RegisterParams> {
  final AuthRepo authRepo;
  SignUpUsecase(this.authRepo);

  @override
  Future<Either<Failure, AuthResponseModel>> call(RegisterParams param) async {
    return await authRepo.signUp(
        param.name, param.email, param.password, param.password);
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });
}

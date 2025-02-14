import 'package:dartz/dartz.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/auth/data/models/register_new_user_model.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/error/failures.dart';

class RegisterUsecase extends UseCase<
    Future<Either<Failure, RegisterNewUserModel>>, RegisterParams> {
  final AuthRepo authRepo;
  RegisterUsecase(this.authRepo);

  @override
  Future<Either<Failure, RegisterNewUserModel>> call(
      RegisterParams param) async {
    return await authRepo.registNewUser(
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

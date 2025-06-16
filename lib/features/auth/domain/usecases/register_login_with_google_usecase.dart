import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/models/user_model.dart';
import 'package:two_website/core/usecases/no_param_use_case.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

class RegisterLoginWithGoogleUsecase
    extends NoParamUseCase<Future<Either<Failure, UserModel>>> {
  final AuthRepo authRepo;

  RegisterLoginWithGoogleUsecase(this.authRepo);

  @override
  Future<Either<Failure, UserModel>> call() {
    return authRepo.registLoginWithGoogle();
  }
}

import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/no_param_use_case.dart';
import 'package:two_website/features/auth/data/models/auth_response_model.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

class RegisterLoginWithGoogleUsecase
    extends NoParamUseCase<Future<Either<Failure, AuthResponseModel>>> {
  final AuthRepo authRepo;

  RegisterLoginWithGoogleUsecase(this.authRepo);

  @override
  Future<Either<Failure, AuthResponseModel>> call() {
    return authRepo.registLoginWithGoogle();
  }
}

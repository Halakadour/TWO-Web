import 'package:dartz/dartz.dart';
import 'package:two_website/core/models/user_model.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/core/param/auth_param.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/error/failures.dart';

class SignUpUsecase
    extends UseCase<Future<Either<Failure, UserModel>>, RegisterParams> {
  final AuthRepo authRepo;
  SignUpUsecase(this.authRepo);

  @override
  Future<Either<Failure, UserModel>> call(RegisterParams param) async {
    return await authRepo.signUp(param);
  }
}

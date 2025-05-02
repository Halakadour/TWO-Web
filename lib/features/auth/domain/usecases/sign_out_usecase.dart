import 'package:dartz/dartz.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/error/failures.dart';

class SignOutUsecase extends UseCase<Future<Either<Failure, Unit>>, String> {
  final AuthRepo authRepo;
  SignOutUsecase(this.authRepo);

  @override
  Future<Either<Failure, Unit>> call(String param) async {
    return await authRepo.signOut(param);
  }
}

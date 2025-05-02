import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/auth/domain/entity/profile_entity.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

class GetUserProfileUsecase
    extends UseCase<Future<Either<Failure, ProfileEntity>>, String> {
  final AuthRepo authRepo;

  GetUserProfileUsecase(this.authRepo);
  @override
  Future<Either<Failure, ProfileEntity>> call(String param) {
    return authRepo.getUserPorfile(param);
  }
}

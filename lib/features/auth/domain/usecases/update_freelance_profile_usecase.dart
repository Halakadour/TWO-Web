import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/auth/data/datasources/auth_param.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

class UpdateFreelanceProfileUsecase extends UseCase<
    Future<Either<Failure, Unit>>, UpdateFreeLanceAndGesutProfileParam> {
  final AuthRepo profileRepo;

  UpdateFreelanceProfileUsecase(this.profileRepo);

  @override
  Future<Either<Failure, Unit>> call(
      UpdateFreeLanceAndGesutProfileParam param) {
    return profileRepo.updateFreelancerProfile(param);
  }
}

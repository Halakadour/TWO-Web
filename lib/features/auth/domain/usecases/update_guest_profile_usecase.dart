import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/core/param/auth_param.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';

class UpdateGuestProfileUsecase
    extends UseCase<Future<Either<Failure, Unit>>, UpdateProfileParam> {
  final AuthRepo profileRepo;

  UpdateGuestProfileUsecase(this.profileRepo);

  @override
  Future<Either<Failure, Unit>> call(UpdateProfileParam param) {
    return profileRepo.updateGuestProfile(param);
  }
}

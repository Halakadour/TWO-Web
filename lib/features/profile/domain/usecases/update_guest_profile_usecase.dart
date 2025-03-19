import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/profile/data/models/update_profile_response_model.dart';
import 'package:two_website/features/profile/domain/repos/profile_repo.dart';
import 'package:two_website/features/profile/domain/usecases/update_freelance_profile_usecase.dart';

class UpdateGuestProfileUsecase extends UseCase<
    Future<Either<Failure, UpdateProfileResponesModel>>,
    FreeLanceAndGesutProfileParam> {
  final ProfileRepo profileRepo;

  UpdateGuestProfileUsecase(this.profileRepo);

  @override
  Future<Either<Failure, UpdateProfileResponesModel>> call(
      FreeLanceAndGesutProfileParam param) {
    return profileRepo.updateGuestProfile(
        param.token, param.image, param.roleId);
  }
}

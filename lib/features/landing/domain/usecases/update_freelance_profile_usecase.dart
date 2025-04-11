import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';
import 'package:two_website/features/landing/data/models/update_profile_response_model.dart';

class UpdateFreelanceProfileUsecase extends UseCase<
    Future<Either<Failure, UpdateProfileResponesModel>>,
    FreeLanceAndGesutProfileParam> {
  final LandingRepo profileRepo;

  UpdateFreelanceProfileUsecase(this.profileRepo);

  @override
  Future<Either<Failure, UpdateProfileResponesModel>> call(
      FreeLanceAndGesutProfileParam param) {
    return profileRepo.updateFreelancerProfile(
        param.token, param.image, param.roleId);
  }
}

class FreeLanceAndGesutProfileParam {
  final String token;
  final String image;
  final int roleId;

  FreeLanceAndGesutProfileParam(
      {required this.token, required this.image, required this.roleId});
}

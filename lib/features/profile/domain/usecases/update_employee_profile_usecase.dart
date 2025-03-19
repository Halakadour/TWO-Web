import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/profile/data/models/update_profile_response_model.dart';
import 'package:two_website/features/profile/domain/repos/profile_repo.dart';

class UpdateEmployeeProfileUsecase extends UseCase<
    Future<Either<Failure, UpdateProfileResponesModel>>, EmployeeProfileParam> {
  final ProfileRepo profileRepo;

  UpdateEmployeeProfileUsecase(this.profileRepo);

  @override
  Future<Either<Failure, UpdateProfileResponesModel>> call(
      EmployeeProfileParam param) {
    return profileRepo.updateEmployeeProfile(
        param.token, param.image, param.cv, param.roleId);
  }
}

class EmployeeProfileParam {
  final String token;
  final String image;
  final String cv;
  final int roleId;

  EmployeeProfileParam(
      {required this.token,
      required this.image,
      required this.cv,
      required this.roleId});
}

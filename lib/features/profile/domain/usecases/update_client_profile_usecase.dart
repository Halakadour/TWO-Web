import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/profile/data/models/update_profile_response_model.dart';
import 'package:two_website/features/profile/domain/repos/profile_repo.dart';

class UpdateClientProfileUsecase extends UseCase<
    Future<Either<Failure, UpdateProfileResponesModel>>, ClientProfileParam> {
  final ProfileRepo profileRepo;

  UpdateClientProfileUsecase(this.profileRepo);

  @override
  Future<Either<Failure, UpdateProfileResponesModel>> call(
      ClientProfileParam param) {
    return profileRepo.updateClientProfile(param.token, param.image,
        param.roleId, param.subject, param.description, param.phone);
  }
}

class ClientProfileParam {
  final String token;
  final String image;
  final int roleId;
  final String subject;
  final String description;
  final String phone;

  ClientProfileParam(
      {required this.token,
      required this.image,
      required this.roleId,
      required this.subject,
      required this.description,
      required this.phone});
}

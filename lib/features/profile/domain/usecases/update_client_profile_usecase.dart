import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/profile/data/models/update_client_profile_response_model.dart';
import 'package:two_website/features/profile/domain/repos/profile_repo.dart';

class UpdateClientProfileUsecase extends UseCase<
    Future<Either<Failure, UpdateClientProfileResponesModel>>,
    ClientProfileParam> {
  final ProfileRepo profileRepo;

  UpdateClientProfileUsecase(this.profileRepo);

  @override
  Future<Either<Failure, UpdateClientProfileResponesModel>> call(
      ClientProfileParam param) {
    return profileRepo.updateClientProfile(
        param.token, param.image, param.roleId);
  }
}

class ClientProfileParam {
  final String token;
  final PlatformFile image;
  final int roleId;

  ClientProfileParam(
      {required this.token, required this.image, required this.roleId});
}

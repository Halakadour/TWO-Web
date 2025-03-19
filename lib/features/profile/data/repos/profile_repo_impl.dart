import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/features/profile/data/datasources/profile_remote_datasourse.dart';
import 'package:two_website/features/profile/data/models/update_profile_response_model.dart';
import 'package:two_website/features/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDatasourse profileRemoteDatasourse;

  ProfileRepoImpl(this.profileRemoteDatasourse);

  @override
  Future<Either<Failure, UpdateProfileResponesModel>> updateClientProfile(
      String token,
      String image,
      int roleId,
      String subject,
      String description,
      String phone) {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasourse.updateClientProfile(
            token, image, roleId, subject, description, phone);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, UpdateProfileResponesModel>> updateEmployeeProfile(
      String token, String image, String cv, int roleId) {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasourse.updateEmployeeProfile(
            token, image, cv, roleId);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, UpdateProfileResponesModel>> updateFreelancerProfile(
      String token, String image, int roleId) {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasourse.updateFreeLanceProfile(
            token, image, roleId);
        return Right(result);
      },
    );
  }

  @override
  updateGuestProfile(String token, String image, int roleId) {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasourse.updateGuestProfile(
            token, image, roleId);
        return Right(result);
      },
    );
  }
}

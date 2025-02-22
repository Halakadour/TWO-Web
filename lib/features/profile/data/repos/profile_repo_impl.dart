import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/features/profile/data/datasources/profile_remote_datasourse.dart';
import 'package:two_website/features/profile/data/models/update_client_profile_response_model.dart';
import 'package:two_website/features/profile/data/models/update_employee_profile_response_model.dart';
import 'package:two_website/features/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDatasourse profileRemoteDatasourse;

  ProfileRepoImpl(this.profileRemoteDatasourse);
  @override
  Future<Either<Failure, UpdateClientProfileResponesModel>> updateClientProfile(
      String token, Uint8List image, int roleId) {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasourse.updateClientProfile(
            token, image, roleId);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<Failure, UpdateEmployeeProfileResponesModel>>
      updateEmployeeProfile(
          String token, Uint8List image, Uint8List cv, int roleId) {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasourse.updateEmployeeProfile(
            token, image, cv, roleId);
        return Right(result);
      },
    );
  }
}

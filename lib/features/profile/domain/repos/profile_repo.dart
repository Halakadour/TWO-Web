import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/profile/data/models/update_profile_response_model.dart';

abstract class ProfileRepo with HandlingExceptionManager {
  Future<Either<Failure, UpdateProfileResponesModel>> updateEmployeeProfile(
      String token, String image, String cv, int roleId);
  Future<Either<Failure, UpdateProfileResponesModel>> updateFreelancerProfile(
      String token, String image, int roleId);
  updateGuestProfile(String token, String image, int roleId);
  Future<Either<Failure, UpdateProfileResponesModel>> updateClientProfile(
      String token,
      String image,
      int roleId,
      String subject,
      String description,
      String phone);
}

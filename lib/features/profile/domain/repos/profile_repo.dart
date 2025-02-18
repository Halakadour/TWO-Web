import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/profile/data/models/update_client_profile_response_model.dart';
import 'package:two_website/features/profile/data/models/update_employee_profile_response_model.dart';

abstract class ProfileRepo with HandlingExceptionManager {
  Future<Either<Failure, UpdateEmployeeProfileResponesModel>>
      updateEmployeeProfile(
          String token, PlatformFile image, PlatformFile cv, int roleId);
  Future<Either<Failure, UpdateClientProfileResponesModel>> updateClientProfile(
      String token, PlatformFile image, int roleId);
}

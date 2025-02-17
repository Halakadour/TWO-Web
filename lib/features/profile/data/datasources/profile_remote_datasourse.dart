import 'dart:io';

import 'package:two_website/core/api/multi_post_api.dart';
import 'package:two_website/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_website/features/profile/data/models/update_client_profile_response_model.dart';
import 'package:two_website/features/profile/data/models/update_employee_profile_response_model.dart';

abstract class ProfileRemoteDatasourse {
  Future<UpdateEmployeeProfileResponesModel> updateEmployeeProfile(
      String token, File image, File cv, int roleId);
  Future<UpdateClientProfileResponesModel> updateClientProfile(
      String token, File image, int roleId);
}

class ProfileRemoteDatasourseImpl extends ProfileRemoteDatasourse {
  @override
  Future<UpdateClientProfileResponesModel> updateClientProfile(
      String token, File image, int roleId) async {
    final result = MultiPostApi(
        uri: Uri.parse("$baseUri/api/update/client/profile"),
        body: ({'role_id': roleId.toString()}),
        images: {
          'image': image,
        },
        fromJson: updateClientProfileResponesModelFromJson,
        token: token);
    return await result.callRequest();
  }

  @override
  Future<UpdateEmployeeProfileResponesModel> updateEmployeeProfile(
      String token, File image, File cv, int roleId) async {
    final result = MultiPostApi(
        uri: Uri.parse("$baseUri/api/update/programmer/profile"),
        body: ({'role_id': roleId.toString()}),
        images: {'image': image, 'cv': cv},
        fromJson: updateEmployeeProfileResponesModelFromJson,
        token: token);
    return await result.callRequest();
  }
}

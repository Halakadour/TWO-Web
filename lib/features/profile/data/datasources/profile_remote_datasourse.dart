import 'dart:typed_data';

import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/core/api/post_api_with_token.dart';
import 'package:two_website/features/profile/data/models/update_client_profile_response_model.dart';
import 'package:two_website/features/profile/data/models/update_employee_profile_response_model.dart';

abstract class ProfileRemoteDatasourse {
  Future<UpdateEmployeeProfileResponesModel> updateEmployeeProfile(
      String token, Uint8List image, Uint8List cv, int roleId);
  Future<UpdateClientProfileResponesModel> updateClientProfile(
      String token, Uint8List image, int roleId);
}

class ProfileRemoteDatasourseImpl extends ProfileRemoteDatasourse {
  @override
  Future<UpdateClientProfileResponesModel> updateClientProfile(
      String token, Uint8List image, int roleId) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/client/profile"),
        body: ({'role_id': roleId.toString(), 'image': '$imageBase64$image'}),
        fromJson: updateClientProfileResponesModelFromJson,
        token: token);
    return await result.call();
  }

  @override
  Future<UpdateEmployeeProfileResponesModel> updateEmployeeProfile(
      String token, Uint8List image, Uint8List cv, int roleId) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/programmer/profile"),
        body: ({
          'image': '$imageBase64$image',
          'cv': '$imageBase64$cv',
          'role_id': roleId.toString()
        }),
        fromJson: updateEmployeeProfileResponesModelFromJson,
        token: token);
    return await result.call();
  }
}

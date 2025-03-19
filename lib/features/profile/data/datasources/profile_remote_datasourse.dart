import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/core/api/post_api_with_token.dart';
import 'package:two_website/features/profile/data/models/update_profile_response_model.dart';

abstract class ProfileRemoteDatasourse {
  Future<UpdateProfileResponesModel> updateEmployeeProfile(
      String token, String image, String cv, int roleId);
  Future<UpdateProfileResponesModel> updateFreeLanceProfile(
      String token, String image, int roleId);
  Future<UpdateProfileResponesModel> updateGuestProfile(
      String token, String image, int roleId);
  Future<UpdateProfileResponesModel> updateClientProfile(
      String token,
      String image,
      int roleId,
      String subject,
      String description,
      String phone);
}

class ProfileRemoteDatasourseImpl extends ProfileRemoteDatasourse {
  @override
  Future<UpdateProfileResponesModel> updateClientProfile(
      String token,
      String image,
      int roleId,
      String subject,
      String description,
      String phone) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/client/profile"),
        body: ({
          'role_id': roleId.toString(),
          'image': '$imageBase64$image',
          'subject': subject,
          'description': description,
          'phone': phone
        }),
        fromJson: updateProfileResponesModelFromJson,
        token: token);
    return await result.call();
  }

  @override
  Future<UpdateProfileResponesModel> updateEmployeeProfile(
      String token, String image, String cv, int roleId) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/employee/profile"),
        body: ({
          'image': '$imageBase64$image',
          'cv': '$pdfBase64$cv',
          'role_id': roleId.toString()
        }),
        fromJson: updateProfileResponesModelFromJson,
        token: token);
    return await result.call();
  }

  @override
  Future<UpdateProfileResponesModel> updateFreeLanceProfile(
      String token, String image, int roleId) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/freelancer/profile"),
        body: ({
          'role_id': roleId.toString(),
          'image': '$imageBase64$image',
        }),
        fromJson: updateProfileResponesModelFromJson,
        token: token);
    return await result.call();
  }

  @override
  Future<UpdateProfileResponesModel> updateGuestProfile(
      String token, String image, int roleId) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/user/profile"),
        body: ({
          'role_id': roleId.toString(),
          'image': '$imageBase64$image',
        }),
        fromJson: updateProfileResponesModelFromJson,
        token: token);
    return await result.call();
  }
}

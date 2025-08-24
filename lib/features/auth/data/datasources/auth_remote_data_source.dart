import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/core/api/get_api.dart';
import 'package:two_website/core/api/get_with_token_api.dart';
import 'package:two_website/core/models/empty_response_model.dart';
import 'package:two_website/core/param/auth_param.dart';
import 'package:two_website/features/auth/data/models/get_user_profile_response_model.dart';
import 'package:two_website/features/auth/data/models/auth_response_model.dart';
import 'package:two_website/features/auth/data/models/role_response_model.dart';

import '../../../../core/api/post_api.dart';
import '../../../../core/api/post_api_with_token.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> signUp(RegisterParams param);
  Future<AuthResponseModel> signIn(LoginParams param);
  Future<EmptyResponseModel> signOut(String token);
  Future<AuthResponseModel> registLoginWithGoogle();
  Future<AuthResponseModel> registLoginWithGithup();
  Future<GetUserProfileResponseModel> getUserProfile(String token);
  Future<EmptyResponseModel> updateFreeLanceProfile(UpdateProfileParam param);
  Future<EmptyResponseModel> updateGuestProfile(UpdateProfileParam param);
  Future<EmptyResponseModel> updateClientProfile(UpdateProfileParam param);
  Future<RoleResponesModel> showRoles();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<AuthResponseModel> signUp(RegisterParams param) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/register"),
      body: ({
        'name': param.name,
        'email': param.email,
        'password': param.password,
        'password_confirmation': param.password
      }),
      fromJson: authResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<AuthResponseModel> signIn(LoginParams param) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/login"),
      body: ({
        'email': param.email,
        'password': param.password,
      }),
      fromJson: authResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> signOut(String token) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/logout"),
        token: token,
        body: ({}),
        fromJson: emptyResponseModelFromJson);
    return await result.call();
  }

  @override
  Future<AuthResponseModel> registLoginWithGithup() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/auth/github/callback"),
        fromJson: authResponseModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<AuthResponseModel> registLoginWithGoogle() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/auth/google/callback"),
        fromJson: authResponseModelFromJson);
    return await result.callRequest();
  }

  @override
  Future<GetUserProfileResponseModel> getUserProfile(String token) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/user/profile"),
      token: token,
      fromJson: getUserProfileResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> updateClientProfile(
      UpdateProfileParam param) async {
    // uri: Uri.parse("$baseUri/api/update/client/profile"),
    // body: ({
    //   'role_id': param.roleId,
    //   'image': '$imageBase64${param.image}',
    //   'full_name': param.fullName,
    //   'company_name': param.companyName,
    //   'email': param.workEmail,
    //   'phone': param.phoneNumber,
    //   'project_type': param.projectType,
    //   'project_description': param.projectDescription,
    //   'cost': 'Not yet determinted',
    //   'duration': 'Not yet determinted',
    //   'requirements': param.projectRequirements,
    //   'document': '$pdfBase64${param.documents}',
    //   'cooperation_type': param.cooperationType,
    //   'contact_time': param.contractTime,
    //   'private': "1"
    // }),
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/freelancer/profile"),
        body: ({
          'role_id': param.roleId,
          'image': '$imageBase64${param.image}',
          'phone': param.phoneNumber
        }),
        fromJson: emptyResponseModelFromJson,
        token: param.token);
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> updateFreeLanceProfile(
      UpdateProfileParam param) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/freelancer/profile"),
        body: ({
          'role_id': param.roleId,
          'image': '$imageBase64${param.image}',
          'phone': param.phoneNumber
        }),
        fromJson: emptyResponseModelFromJson,
        token: param.token);
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> updateGuestProfile(
      UpdateProfileParam param) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/update/user/profile"),
        body: ({
          'role_id': param.roleId,
          'image': '$imageBase64${param.image}',
          'phone': param.phoneNumber
        }),
        fromJson: emptyResponseModelFromJson,
        token: param.token);
    return await result.call();
  }

  @override
  Future<RoleResponesModel> showRoles() async {
    final result = GetApi(
        uri: Uri.parse("$baseUri/api/show/role/client"),
        fromJson: roleResponesModelFromJson);
    return await result.callRequest();
  }
}

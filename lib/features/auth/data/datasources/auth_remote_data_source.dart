import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/core/api/get_api.dart';
import 'package:two_website/core/api/get_with_token_api.dart';
import 'package:two_website/features/auth/data/models/get_user_profile_response_model.dart';
import 'package:two_website/features/auth/data/models/auth_response_model.dart';
import 'package:two_website/features/auth/data/models/sign_out_response_model.dart';

import '../../../../core/api/post_api.dart';
import '../../../../core/api/post_api_with_token.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> signUp(
      String name, String email, String password, String confirmPassword);
  Future<AuthResponseModel> signIn(String token, String email, String password);
  Future<SignOutResponseModel> signOut(String token);
  Future<AuthResponseModel> registLoginWithGoogle();
  Future<AuthResponseModel> registLoginWithGithup();
  Future<GetUserProfileResponseModel> getUserProfile(String token);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<AuthResponseModel> signUp(String name, String email, String password,
      String confirmPassword) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/register"),
      body: ({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword
      }),
      fromJson: authResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<AuthResponseModel> signIn(
      String token, String email, String password) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/login"),
      body: ({
        'email': email,
        'password': password,
      }),
      fromJson: authResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<SignOutResponseModel> signOut(String token) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/logout"),
        token: token,
        body: ({}),
        fromJson: logoutUserModelFromJson);
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
}

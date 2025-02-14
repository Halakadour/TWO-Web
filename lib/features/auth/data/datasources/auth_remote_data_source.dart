import 'package:two_website/features/auth/data/models/login_user_model.dart';
import 'package:two_website/features/auth/data/models/logout_user_model.dart';
import 'package:two_website/features/auth/data/models/register_new_user_model.dart';

import '../../../../core/api/post_api.dart';
import '../../../../core/api/post_api_with_token.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterNewUserModel> regist(
      String name, String email, String password, String confirmPassword);
  Future<LoginUserModel> login(String token, String email, String password);
  Future<LogoutUserModel> logout(String token);
  // Future<Unit> registLoginWithGoogle();
}

String baseUri = "http://ruhajaghel-001-site1.qtempurl.com";

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<RegisterNewUserModel> regist(String name, String email,
      String password, String confirmPassword) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/register"),
      body: ({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword
      }),
      fromJson: registerNewUserModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<LoginUserModel> login(
      String token, String email, String password) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/login"),
      body: ({
        'email': email,
        'password': password,
      }),
      token: token,
      fromJson: loginUserModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<LogoutUserModel> logout(String token) async {
    final result = PostApiWithToken(
        uri: Uri.parse("$baseUri/api/logout"),
        token: token,
        body: ({}),
        fromJson: logoutUserModelFromJson);
    return await result.call();
  }
}

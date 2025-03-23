import 'package:oauth2_client/github_oauth2_client.dart';
import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() => _instance;

  AuthService._internal();

  // Google OAuth Config
  final OAuth2Helper _googleAuth = OAuth2Helper(
    GoogleOAuth2Client(
      redirectUri: "$baseUri/auth/google/callback",
      customUriScheme: "$baseUri/",
    ),
    grantType: OAuth2Helper.authorizationCode,
    clientId:
        "464070922557-l1rb5b94p56m2hl7jv6r2n0jpekkl9k8.apps.googleusercontent.com",
    clientSecret: "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",
    scopes: ["email", "profile", "openid"],
  );

  // GitHub OAuth Config
  final OAuth2Helper _githubAuth = OAuth2Helper(
    GitHubOAuth2Client(
      redirectUri: "$baseUri/auth/github/callback",
      customUriScheme: "$baseUri/",
    ),
    grantType: OAuth2Helper.authorizationCode,
    clientId: "Ov23lim8swDSxiUrcs0z",
    clientSecret: "7e0c02ca265023af4a8aeef58f26ba61fc280f22",
    scopes: ["user"],
  );

  // Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      final token = await _googleAuth.fetchToken();
      await SharedPreferencesServices.setUserToken(token.accessToken!);
      print("Google Sign-In Successful: ${token.accessToken}");
    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }

  // GitHub Sign-In
  Future<void> signInWithGitHub() async {
    try {
      final token = await _githubAuth.fetchToken();
      print("GitHub Sign-In Successful: ${token.accessToken}");
    } catch (e) {
      print("GitHub Sign-In Error: $e");
    }
  }

  // Sign Out (Clears Tokens)
  Future<void> signOut() async {
    await _googleAuth.disconnect();
    await _githubAuth.disconnect();
    print("User signed out");
  }
}

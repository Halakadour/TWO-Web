import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        "464070922557-l1rb5b94p56m2hl7jv6r2n0jpekkl9k8.apps.googleusercontent.com",
    scopes: ['email', 'profile'],
  );

  // Sign in with Google
  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled sign-in
      print("User signed in: ${googleUser.email}");
      return googleUser;
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  // Sign Out with Google
  Future<GoogleSignInAccount?> signOutWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signOut();
      if (googleUser == null) return null; // User canceled sign-in
      print("User signed in: ${googleUser.email}");
      return googleUser;
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  // Sign out from Google
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    print("User signed out");
  }
}

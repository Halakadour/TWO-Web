// AUTH //
class RegisterParams {
  final String name;
  final String email;
  final String password;
  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });
}

// PROFILE //
class UpdateProfileParam {
  final String token;
  final String roleId;
  final String image;
  final String phoneNumber;

  UpdateProfileParam({
    required this.token,
    required this.roleId,
    required this.image,
    required this.phoneNumber,
  });
}

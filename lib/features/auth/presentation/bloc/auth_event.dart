part of 'auth_bloc.dart';

abstract class AuthRoleProfileEvent {
  const AuthRoleProfileEvent();
}

// Auth Events //
class CheckAuthEvent extends AuthRoleProfileEvent {}

class RegisteNewUserEvent extends AuthRoleProfileEvent {
  final String name;
  final String email;
  final String password;
  const RegisteNewUserEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class LoginUserEvent extends AuthRoleProfileEvent {
  final String email;
  final String password;
  const LoginUserEvent({
    required this.email,
    required this.password,
  });
}

class LogoutUserEvent extends AuthRoleProfileEvent {}

// Role Events //

class GetRolesWithoutClientEvent extends AuthRoleProfileEvent {}

class GetRolesEvent extends AuthRoleProfileEvent {}

// Profile Events //

class UpdateEmployeeProfileEvent extends AuthRoleProfileEvent {
  final File image;
  final File cv;
  final int roleId;
  UpdateEmployeeProfileEvent({
    required this.image,
    required this.cv,
    required this.roleId,
  });
}

class UpdateClientProfileEvent extends AuthRoleProfileEvent {
  final File image;
  final int roleId;
  UpdateClientProfileEvent({
    required this.image,
    required this.roleId,
  });
}

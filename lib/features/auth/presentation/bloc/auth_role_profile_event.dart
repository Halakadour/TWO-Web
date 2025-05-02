part of 'auth_role_profile_bloc.dart';

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
class UpdateClientProfileEvent extends AuthRoleProfileEvent {
  final String image;
  final int roleId;
  final String subject;
  final String description;
  final String phone;

  UpdateClientProfileEvent(
      {required this.image,
      required this.roleId,
      required this.subject,
      required this.description,
      required this.phone});
}

class UpdateFreelancerProfileEvent extends AuthRoleProfileEvent {
  final String image;
  final int roleId;

  UpdateFreelancerProfileEvent({required this.image, required this.roleId});
}

class UpdateGuestProfileEvent extends AuthRoleProfileEvent {
  final String image;
  final int roleId;

  UpdateGuestProfileEvent({required this.image, required this.roleId});
}

class GetUserProfileEvent extends AuthRoleProfileEvent {}

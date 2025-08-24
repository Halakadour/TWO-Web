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

  RegisteNewUserEvent(
      {required this.name, required this.email, required this.password});
}

class LoginUserEvent extends AuthRoleProfileEvent {
  final String email;
  final String password;

  LoginUserEvent({required this.email, required this.password});
}

class LogoutUserEvent extends AuthRoleProfileEvent {}

// Role Events //

class GetRolesEvent extends AuthRoleProfileEvent {}

// Profile Events //
class UpdateClientProfileEvent extends AuthRoleProfileEvent {
  final String roleId;
  final String image;
  final String phoneNumber;

  UpdateClientProfileEvent(
      {required this.roleId, required this.image, required this.phoneNumber});
}

class UpdateFreelancerProfileEvent extends AuthRoleProfileEvent {
  final String roleId;
  final String image;
  final String phoneNumber;

  UpdateFreelancerProfileEvent(
      {required this.roleId, required this.image, required this.phoneNumber});
}

class UpdateGuestProfileEvent extends AuthRoleProfileEvent {
  final String roleId;
  final String image;
  final String phoneNumber;

  UpdateGuestProfileEvent(
      {required this.roleId, required this.image, required this.phoneNumber});
}

class GetUserProfileEvent extends AuthRoleProfileEvent {}

part of 'auth_role_profile_bloc.dart';

abstract class AuthRoleProfileEvent {
  const AuthRoleProfileEvent();
}

// Auth Events //
class CheckAuthEvent extends AuthRoleProfileEvent {}

class RegisteNewUserEvent extends AuthRoleProfileEvent {
  final RegisterParams param;

  const RegisteNewUserEvent({
    required this.param,
  });
}

class LoginUserEvent extends AuthRoleProfileEvent {
  final LoginParams param;
  const LoginUserEvent({
    required this.param,
  });
}

class LogoutUserEvent extends AuthRoleProfileEvent {}

// Role Events //

class GetRolesEvent extends AuthRoleProfileEvent {}

// Profile Events //
class UpdateClientProfileEvent extends AuthRoleProfileEvent {
  final UpdateClientProfileParam param;
  UpdateClientProfileEvent({
    required this.param,
  });
}

class UpdateFreelancerProfileEvent extends AuthRoleProfileEvent {
  final UpdateFreeLanceAndGesutProfileParam param;

  UpdateFreelancerProfileEvent({required this.param});
}

class UpdateGuestProfileEvent extends AuthRoleProfileEvent {
  final UpdateFreeLanceAndGesutProfileParam param;

  UpdateGuestProfileEvent({required this.param});
}

class GetUserProfileEvent extends AuthRoleProfileEvent {}

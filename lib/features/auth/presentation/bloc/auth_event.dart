part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthEvent extends AuthEvent {}

class RegisteNewUserEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const RegisteNewUserEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class LoginUserEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginUserEvent({
    required this.email,
    required this.password,
  });
}

class LogoutUserEvent extends AuthEvent {}

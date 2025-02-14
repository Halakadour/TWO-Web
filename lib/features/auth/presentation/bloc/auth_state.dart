part of 'auth_bloc.dart';

// ignore: must_be_immutable
class AuthState extends Equatable {
  CasualStatus authModelStatus;
  UserModel? authModel;
  AuthState({
    this.authModelStatus = CasualStatus.initial,
    this.authModel,
  });
  @override
  List<Object> get props => [];

  AuthState copyWith({
    CasualStatus? authModelStatus,
    UserModel? authModel,
  }) {
    return AuthState(
      authModelStatus: authModelStatus ?? this.authModelStatus,
      authModel: authModel ?? this.authModel,
    );
  }
}

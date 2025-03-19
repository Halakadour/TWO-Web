part of 'auth_role_profile_bloc.dart';

// ignore: must_be_immutable
class AuthRoleProfileState {
  String message;
  //Auth States //
  CasualStatus authModelStatus;
  UserModel? authModel;
  CasualStatus logoutStatusStatus;
  //Role States //
  List<RoleModel> roleWithoutClientList;
  CasualStatus roleWithoutClientListStatus;
  List<RoleModel> roleList;
  CasualStatus roleListStatus;
  //Profile States //
  CasualStatus updateEmployeeProfileStatus;
  CasualStatus updateClientProfileStatus;
  CasualStatus updateFreeLancerProfileStatus;
  CasualStatus updateGuestProfileStatus;

  AuthRoleProfileState({
    this.message = "",
    this.authModelStatus = CasualStatus.initial,
    this.authModel,
    this.logoutStatusStatus = CasualStatus.initial,
    this.roleWithoutClientList = const [],
    this.roleWithoutClientListStatus = CasualStatus.initial,
    this.roleList = const [],
    this.roleListStatus = CasualStatus.initial,
    this.updateEmployeeProfileStatus = CasualStatus.initial,
    this.updateClientProfileStatus = CasualStatus.initial,
    this.updateFreeLancerProfileStatus = CasualStatus.initial,
    this.updateGuestProfileStatus = CasualStatus.initial,
  });

  AuthRoleProfileState copyWith({
    String? message,
    CasualStatus? authModelStatus,
    UserModel? authModel,
    CasualStatus? logoutStatusStatus,
    List<RoleModel>? roleWithoutClientList,
    CasualStatus? roleWithoutClientListStatus,
    List<RoleModel>? roleList,
    CasualStatus? roleListStatus,
    CasualStatus? updateEmployeeProfileStatus,
    CasualStatus? updateClientProfileStatus,
    CasualStatus? updateFreeLancerProfileStatus,
    CasualStatus? updateGuestProfileStatus,
  }) {
    return AuthRoleProfileState(
      message: message ?? this.message,
      authModelStatus: authModelStatus ?? this.authModelStatus,
      logoutStatusStatus: logoutStatusStatus ?? this.logoutStatusStatus,
      authModel: authModel ?? this.authModel,
      roleWithoutClientList:
          roleWithoutClientList ?? this.roleWithoutClientList,
      roleWithoutClientListStatus:
          roleWithoutClientListStatus ?? this.roleWithoutClientListStatus,
      roleList: roleList ?? this.roleList,
      roleListStatus: roleListStatus ?? this.roleListStatus,
      updateEmployeeProfileStatus:
          updateEmployeeProfileStatus ?? this.updateEmployeeProfileStatus,
      updateClientProfileStatus:
          updateClientProfileStatus ?? this.updateClientProfileStatus,
      updateFreeLancerProfileStatus:
          updateFreeLancerProfileStatus ?? this.updateFreeLancerProfileStatus,
      updateGuestProfileStatus:
          updateGuestProfileStatus ?? this.updateGuestProfileStatus,
    );
  }
}

part of 'auth_role_profile_bloc.dart';

// ignore: must_be_immutable
class AuthRoleProfileState {
  String message;
  //Auth States //
  CasualStatus authorizedStatus;
  CasualStatus authModelStatus;
  UserModel? authModel;
  CasualStatus logoutStatus;
  //Role States //
  List<RoleModel> roleWithoutClientList;
  CasualStatus roleWithoutClientListStatus;
  List<RoleModel> roleList;
  CasualStatus roleListStatus;
  //Profile States //
  CasualStatus updateClientProfileStatus;
  CasualStatus updateFreeLancerProfileStatus;
  CasualStatus updateGuestProfileStatus;
  CasualStatus profileEntityStatus;
  ProfileEntity? profileEntity;

  AuthRoleProfileState({
    this.message = "",
    this.authorizedStatus = CasualStatus.initial,
    this.authModelStatus = CasualStatus.initial,
    this.authModel,
    this.logoutStatus = CasualStatus.initial,
    this.roleWithoutClientList = const [],
    this.roleWithoutClientListStatus = CasualStatus.initial,
    this.roleList = const [],
    this.roleListStatus = CasualStatus.initial,
    this.updateClientProfileStatus = CasualStatus.initial,
    this.updateFreeLancerProfileStatus = CasualStatus.initial,
    this.updateGuestProfileStatus = CasualStatus.initial,
    this.profileEntityStatus = CasualStatus.initial,
    this.profileEntity,
  });

  AuthRoleProfileState copyWith({
    String? message,
    CasualStatus? authorizedStatus,
    CasualStatus? authModelStatus,
    UserModel? authModel,
    CasualStatus? logoutStatus,
    List<RoleModel>? roleWithoutClientList,
    CasualStatus? roleWithoutClientListStatus,
    List<RoleModel>? roleList,
    CasualStatus? roleListStatus,
    CasualStatus? updateClientProfileStatus,
    CasualStatus? updateFreeLancerProfileStatus,
    CasualStatus? updateGuestProfileStatus,
    CasualStatus? profileEntityStatus,
    ProfileEntity? profileEntity,
  }) {
    return AuthRoleProfileState(
      message: message ?? this.message,
      authorizedStatus: authorizedStatus ?? this.authorizedStatus,
      authModelStatus: authModelStatus ?? this.authModelStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      authModel: authModel ?? this.authModel,
      roleWithoutClientList:
          roleWithoutClientList ?? this.roleWithoutClientList,
      roleWithoutClientListStatus:
          roleWithoutClientListStatus ?? this.roleWithoutClientListStatus,
      roleList: roleList ?? this.roleList,
      roleListStatus: roleListStatus ?? this.roleListStatus,
      updateClientProfileStatus:
          updateClientProfileStatus ?? this.updateClientProfileStatus,
      updateFreeLancerProfileStatus:
          updateFreeLancerProfileStatus ?? this.updateFreeLancerProfileStatus,
      updateGuestProfileStatus:
          updateGuestProfileStatus ?? this.updateGuestProfileStatus,
      profileEntityStatus: profileEntityStatus ?? this.profileEntityStatus,
      profileEntity: profileEntity ?? this.profileEntity,
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/models/user_model.dart';
import 'package:two_website/features/auth/data/datasources/auth_param.dart';
import 'package:two_website/features/auth/domain/entity/profile_entity.dart';
import 'package:two_website/features/auth/domain/usecases/get_user_profile_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/update_client_profile_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/update_freelance_profile_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/update_guest_profile_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/show_roles_usecase.dart';

import '../../data/models/role_response_model.dart';

part 'auth_role_profile_event.dart';
part 'auth_role_profile_state.dart';

class AuthRoleProfileBloc
    extends Bloc<AuthRoleProfileEvent, AuthRoleProfileState> {
  // Auth Usecases //
  final SignUpUsecase registerUsecase;
  final SignInUsecase loginUsecase;
  final SignOutUsecase logoutUsecase;
  // Role Usecases //
  final ShowRolesUsecase showRolesUsecase;
  // Profile Usecases //
  final UpdateClientProfileUsecase updateClientProfileUsecase;
  final UpdateFreelanceProfileUsecase updateFreelanceProfileUsecase;
  final UpdateGuestProfileUsecase updateGuestProfileUsecase;
  final GetUserProfileUsecase getUserProfileUsecase;
  AuthRoleProfileBloc(
      {required this.registerUsecase,
      required this.loginUsecase,
      required this.logoutUsecase,
      required this.showRolesUsecase,
      required this.updateClientProfileUsecase,
      required this.updateFreelanceProfileUsecase,
      required this.updateGuestProfileUsecase,
      required this.getUserProfileUsecase})
      : super(AuthRoleProfileState()) {
    // Auth Bloc //
    on<RegisteNewUserEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: CasualStatus.loading));
      final result = await registerUsecase.call(RegisterParams(
          name: event.param.name,
          email: event.param.email,
          password: event.param.password));
      result.fold(
          (l) => emit(state.copyWith(authModelStatus: CasualStatus.failure)),
          (r) => emit(state.copyWith(
              authModel: r,
              authModelStatus: CasualStatus.success,
              authorizedStatus: CasualStatus.authorized)));
    });
    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: CasualStatus.loading));
      final result = await loginUsecase.call(LoginParams(
          email: event.param.email, password: event.param.password));
      result.fold(
          (l) => emit(state.copyWith(authModelStatus: CasualStatus.failure)),
          (r) => emit(state.copyWith(
              authModelStatus: CasualStatus.success,
              authModel: r,
              authorizedStatus: CasualStatus.authorized)));
    });
    on<LogoutUserEvent>((event, emit) async {
      emit(state.copyWith(logoutStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await logoutUsecase.call(token);
        result.fold(
            (l) => emit(state.copyWith(
                logoutStatus: CasualStatus.failure, message: l.message)),
            (r) => emit(state.copyWith(logoutStatus: CasualStatus.success)));
      } else {
        emit(state.copyWith(
            logoutStatus: CasualStatus.notAuthorized, message: "No Token"));
      }
    });
    on<CheckAuthEvent>((event, emit) async {
      bool token = await SharedPreferencesServices.checkIsVisitor();
      if (token) {
        emit(state.copyWith(authorizedStatus: CasualStatus.notAuthorized));
      } else {
        emit(state.copyWith(authorizedStatus: CasualStatus.authorized));
      }
    });
    // Role Bloc //
    on<GetRolesEvent>((event, emit) async {
      emit(state.copyWith(roleListStatus: CasualStatus.loading));
      final result = await showRolesUsecase.call();
      result.fold(
        (l) => emit(state.copyWith(
            roleListStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(
            state.copyWith(roleListStatus: CasualStatus.success, roleList: r)),
      );
    });
    // Profile Bloc //
    on<UpdateClientProfileEvent>((event, emit) async {
      emit(state.copyWith(updateClientProfileStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateClientProfileUsecase.call(
            UpdateClientProfileParam(
                token: token,
                roleId: event.param.roleId,
                image: event.param.image,
                fullName: event.param.fullName,
                companyName: event.param.companyName,
                workEmail: event.param.workEmail,
                phoneNumber: event.param.phoneNumber,
                projectType: event.param.projectType,
                projectDescription: event.param.projectDescription,
                projectCost: event.param.projectCost,
                projectDuration: event.param.projectDuration,
                projectRequirements: event.param.projectRequirements,
                documents: event.param.documents,
                cooperationType: event.param.cooperationType,
                contractTime: event.param.contractTime,
                visibilit: event.param.visibilit));
        result.fold(
          (l) => emit(state.copyWith(
              updateClientProfileStatus: CasualStatus.failure,
              message: l.message)),
          (r) => emit(
              state.copyWith(updateClientProfileStatus: CasualStatus.success)),
        );
      } else {
        state.copyWith(
            updateClientProfileStatus: CasualStatus.failure,
            message: "no token");
      }
    });
    on<UpdateFreelancerProfileEvent>((event, emit) async {
      emit(state.copyWith(updateFreeLancerProfileStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateFreelanceProfileUsecase.call(
            UpdateFreeLanceAndGesutProfileParam(
                token: token,
                image: event.param.image,
                roleId: event.param.roleId));
        result.fold(
          (l) => emit(state.copyWith(
              updateFreeLancerProfileStatus: CasualStatus.failure,
              message: l.message)),
          (r) => emit(state.copyWith(
              updateFreeLancerProfileStatus: CasualStatus.success)),
        );
      }
    });
    on<UpdateGuestProfileEvent>((event, emit) async {
      emit(state.copyWith(updateGuestProfileStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateGuestProfileUsecase.call(
            UpdateFreeLanceAndGesutProfileParam(
                token: token,
                image: event.param.image,
                roleId: event.param.roleId));
        result.fold(
          (l) => emit(state.copyWith(
              updateFreeLancerProfileStatus: CasualStatus.failure,
              message: l.message)),
          (r) => emit(state.copyWith(
              updateFreeLancerProfileStatus: CasualStatus.success)),
        );
      }
    });
    on<GetUserProfileEvent>((event, emit) async {
      emit(state.copyWith(profileEntityStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await getUserProfileUsecase.call(token);
        result.fold(
          (l) => emit(state.copyWith(
              profileEntityStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(
              profileEntityStatus: CasualStatus.success, profileEntity: r)),
        );
      }
    });
  }
}

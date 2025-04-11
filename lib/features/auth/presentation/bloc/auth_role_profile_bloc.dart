import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/features/auth/data/models/user_model.dart';
import 'package:two_website/features/auth/domain/usecases/login_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/logout_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/register_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/update_client_profile_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/update_freelance_profile_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/update_guest_profile_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_role_client_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_roles_without_client_usecase.dart';

import '../../../landing/data/models/role_response_model.dart';

part 'auth_role_profile_event.dart';
part 'auth_role_profile_state.dart';

class AuthRoleProfileBloc
    extends Bloc<AuthRoleProfileEvent, AuthRoleProfileState> {
  // Auth Usecases //
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  // Role Usecases //
  final ShowRolesWithoutClientUsecase showRolesWithoutClientUsecase;
  final ShowRoleClientUsecase showRoleClientUsecase;
  // Profile Usecases //
  final UpdateClientProfileUsecase updateClientProfileUsecase;
  final UpdateFreelanceProfileUsecase updateFreelanceProfileUsecase;
  final UpdateGuestProfileUsecase updateGuestProfileUsecase;
  AuthRoleProfileBloc(
      {required this.registerUsecase,
      required this.loginUsecase,
      required this.logoutUsecase,
      required this.showRolesWithoutClientUsecase,
      required this.showRoleClientUsecase,
      required this.updateClientProfileUsecase,
      required this.updateFreelanceProfileUsecase,
      required this.updateGuestProfileUsecase})
      : super(AuthRoleProfileState()) {
    // Auth Bloc //
    on<RegisteNewUserEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: CasualStatus.loading));
      final result = await registerUsecase.call(RegisterParams(
          name: event.name, email: event.email, password: event.password));
      result.fold(
          (l) => emit(state.copyWith(authModelStatus: CasualStatus.failure)),
          (r) => emit(state.copyWith(
              authModel: r.data, authModelStatus: CasualStatus.success)));
    });
    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: CasualStatus.loading));
      final result = await loginUsecase.call(LoginParams(
          token: "token", email: event.email, password: event.password));
      result.fold(
          (l) => emit(state.copyWith(authModelStatus: CasualStatus.failure)),
          (r) => emit(state.copyWith(
              authModelStatus: CasualStatus.success, authModel: r.data)));
    });
    on<LogoutUserEvent>((event, emit) async {
      emit(state.copyWith(logoutStatusStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await logoutUsecase.call(token);
        result.fold(
            (l) => emit(state.copyWith(
                logoutStatusStatus: CasualStatus.failure, message: l.message)),
            (r) =>
                emit(state.copyWith(logoutStatusStatus: CasualStatus.success)));
      } else {
        emit(state.copyWith(
            logoutStatusStatus: CasualStatus.noToken, message: "No Token"));
      }
    });
    on<CheckAuthEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        emit(state.copyWith(authModelStatus: CasualStatus.success));
      } else {
        emit(state.copyWith(
            message: "No Token", authModelStatus: CasualStatus.failure));
      }
    });
    // Role Bloc //
    on<GetRolesWithoutClientEvent>((event, emit) async {
      emit(state.copyWith(roleWithoutClientListStatus: CasualStatus.loading));
      final result = await showRolesWithoutClientUsecase.call();
      result.fold(
        (l) => emit(
            state.copyWith(roleWithoutClientListStatus: CasualStatus.failure)),
        (r) => emit(state.copyWith(
            roleWithoutClientListStatus: CasualStatus.success,
            roleWithoutClientList: r.data)),
      );
    });
    on<GetRolesEvent>((event, emit) async {
      emit(state.copyWith(roleListStatus: CasualStatus.loading));
      final result = await showRoleClientUsecase.call();
      result.fold(
        (l) => emit(state.copyWith(
            roleListStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
            roleListStatus: CasualStatus.success, roleList: r.data)),
      );
    });
    // Profile Bloc //
    on<UpdateClientProfileEvent>((event, emit) async {
      emit(state.copyWith(updateClientProfileStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateClientProfileUsecase.call(ClientProfileParam(
            token: token,
            image: event.image,
            roleId: event.roleId,
            subject: event.subject,
            description: event.description,
            phone: event.phone));
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
            FreeLanceAndGesutProfileParam(
                token: token, image: event.image, roleId: event.roleId));
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
            FreeLanceAndGesutProfileParam(
                token: token, image: event.image, roleId: event.roleId));
        result.fold(
          (l) => emit(state.copyWith(
              updateFreeLancerProfileStatus: CasualStatus.failure,
              message: l.message)),
          (r) => emit(state.copyWith(
              updateFreeLancerProfileStatus: CasualStatus.success)),
        );
      }
    });
  }
}

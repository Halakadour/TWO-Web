import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_website/core/network/enum_status.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/features/auth/data/models/user_model.dart';
import 'package:two_website/features/auth/domain/usecases/login_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/logout_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  AuthBloc(
      {required this.registerUsecase,
      required this.loginUsecase,
      required this.logoutUsecase})
      : super(AuthState()) {
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
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await loginUsecase.call(LoginParams(
            token: token, email: event.email, password: event.password));
        result.fold((l) => {},
            (r) => emit(state.copyWith(authModelStatus: CasualStatus.failure)));
      } else {
        emit(state.copyWith(authModelStatus: CasualStatus.noToken));
      }
    });
    on<LogoutUserEvent>((event, emit) async {
      emit(state.copyWith(authModelStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await logoutUsecase.call(token);
        result.fold((l) => {},
            (r) => emit(state.copyWith(authModelStatus: CasualStatus.failure)));
      } else {
        emit(state.copyWith(authModelStatus: CasualStatus.noToken));
      }
    });
    on<CheckAuthEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final isFirst = prefs.getBool('firstTime');
      if (isFirst != null) {
        final token = prefs.getString('token');
        if (token != null) {
          emit(state.copyWith(authModelStatus: CasualStatus.success));
        } else {
          emit(state.copyWith(authModelStatus: CasualStatus.noToken));
        }
      } else {
        emit(state.copyWith(authModelStatus: CasualStatus.initial));
      }
    });
  }
}

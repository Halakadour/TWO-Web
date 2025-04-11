import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_website/core/network/network_connection_checker.dart';
import 'package:two_website/features/landing/data/datasources/landing_remote_datasource.dart';
import 'package:two_website/features/landing/data/repos/landing_repo_impl.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';
import 'package:two_website/features/landing/domain/usecases/show_about_us_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_why_us_usecase.dart';
import 'package:two_website/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_website/features/auth/data/repos/auth_repo_impl.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';
import 'package:two_website/features/auth/domain/usecases/login_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/logout_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/register_usecase.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/landing/domain/usecases/create_contact_us_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/update_client_profile_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/update_freelance_profile_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/update_guest_profile_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_role_client_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_roles_without_client_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_service_usecase.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';

import 'features/landing/domain/usecases/reply_to_post_usecase.dart';
import 'features/landing/domain/usecases/show_active_posts_usecase.dart';
import 'features/landing/domain/usecases/show_un_active_posts_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /**----------------- AUTH FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
    () => AuthRoleProfileBloc(
        registerUsecase: sl(),
        loginUsecase: sl(),
        logoutUsecase: sl(),
        showRoleClientUsecase: sl(),
        showRolesWithoutClientUsecase: sl(),
        updateClientProfileUsecase: sl(),
        updateFreelanceProfileUsecase: sl(),
        updateGuestProfileUsecase: sl()),
  );
  // Usecases
  sl.registerLazySingleton(
    () => RegisterUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => LoginUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => LogoutUsecase(sl()),
  );
  // Repos
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authRemoteDataSource: sl()),
  );

  // Datasources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  /**----------------- Landing FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
    () => LandingBloc(
        showAboutUsUsecase: sl(),
        showWhyUsUsecase: sl(),
        createContactUsUsecase: sl(),
        showActivePostsUsecase: sl(),
        showUnActivePostsUsecase: sl(),
        replyToPostUsecase: sl(),
        showServiceUsecase: sl()),
  );
  // Repos
  sl.registerLazySingleton<LandingRepo>(
    () => LandingRepoImpl(sl()),
  );

  // Datasources
  sl.registerLazySingleton<LandingRemoteDatasource>(
    () => LandingRemoteDatasourceImpl(),
  );

  /**----------------- ROLE FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(
    () => ShowRoleClientUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowRolesWithoutClientUsecase(sl()),
  );
  /**----------------- PROFILE FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(
    () => UpdateClientProfileUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => UpdateFreelanceProfileUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => UpdateGuestProfileUsecase(sl()),
  );
  /**----------------- POST FEATURE -----------------------**/
  // Usecases
  sl.registerLazySingleton(
    () => ReplyToPostUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowActivePostsUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowUnActivePostsUsecase(sl()),
  );
  /**----------------- SERVICES FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(
    () => ShowServiceUsecase(sl()),
  );
  /**----------------- ABOUT-US-WHY-US FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(
    () => ShowAboutUsUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowWhyUsUsecase(sl()),
  );

  /**----------------- CONTACT-US FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(
    () => CreateContactUsUsecase(sl()),
  );
  ///////////////////////////////////////////////////////////////////////////////////////

  /* CORE */
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  /* External */

  final sharedPreferences = await SharedPreferences.getInstance();
  final internetConnectionChecker = InternetConnectionChecker.createInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => internetConnectionChecker);
}

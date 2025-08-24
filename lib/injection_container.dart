import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_website/core/network/network_connection_checker.dart';
import 'package:two_website/features/auth/data/datasources/auth_locale_data_source.dart';
import 'package:two_website/features/auth/domain/usecases/get_user_profile_usecase.dart';
import 'package:two_website/features/landing/data/datasources/landing_locale_datasource.dart';
import 'package:two_website/features/landing/data/datasources/landing_remote_datasource.dart';
import 'package:two_website/features/landing/data/repos/landing_repo_impl.dart';
import 'package:two_website/features/landing/domain/repos/landing_repo.dart';
import 'package:two_website/features/landing/domain/usecases/create_project_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_about_us_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_why_us_usecase.dart';
import 'package:two_website/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_website/features/auth/data/repos/auth_repo_impl.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';
import 'package:two_website/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/landing/domain/usecases/create_contact_us_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/update_client_profile_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/update_freelance_profile_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/update_guest_profile_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/show_roles_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_service_usecase.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';

import 'features/landing/domain/usecases/reply_to_post_usecase.dart';
import 'features/landing/domain/usecases/show_active_posts_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /**----------------- AUTH FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
    () => AuthRoleProfileBloc(
        registerUsecase: sl(),
        loginUsecase: sl(),
        logoutUsecase: sl(),
        showRolesUsecase: sl(),
        updateClientProfileUsecase: sl(),
        updateFreelanceProfileUsecase: sl(),
        updateGuestProfileUsecase: sl(),
        getUserProfileUsecase: sl()),
  );
  // Usecases
  sl.registerLazySingleton(
    () => SignUpUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => SignInUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => SignOutUsecase(sl()),
  );
  // Repos
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
        authRemoteDataSource: sl(),
        authLocaleDataSource: sl(),
        networkInfo: sl()),
  );

  // Datasources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthLocaleDataSource>(
    () => AuthLocaleDataSourceImpl(sl()),
  );

  /**----------------- Landing FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
    () => LandingBloc(
        showAboutUsUsecase: sl(),
        showWhyUsUsecase: sl(),
        createContactUsUsecase: sl(),
        showActivePostsUsecase: sl(),
        replyToPostUsecase: sl(),
        showServiceUsecase: sl(),
        createProjectUsecase: sl()),
  );
  // Repos
  sl.registerLazySingleton<LandingRepo>(
    () => LandingRepoImpl(sl(), sl(), sl()),
  );

  // Datasources
  sl.registerLazySingleton<LandingRemoteDatasource>(
    () => LandingRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<LandingLocaleDatasource>(
    () => LandingLocaleDatasourceImpl(sl()),
  );

  /**----------------- PROJECT FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(
    () => CreateProjectUsecase(sl()),
  );

  /**----------------- ROLE FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(
    () => ShowRolesUsecase(sl()),
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
  sl.registerLazySingleton(
    () => GetUserProfileUsecase(sl()),
  );
  /**----------------- POST FEATURE -----------------------**/
  // Usecases
  sl.registerLazySingleton(
    () => ReplyToPostUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowActivePostsUsecase(sl()),
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
  final networkInfo = NetworkInfoImpl(internetConnectionChecker);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => internetConnectionChecker);
  sl.registerLazySingleton(() => networkInfo);
}

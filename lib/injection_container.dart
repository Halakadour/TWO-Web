import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_website/core/network/network_connection_checker.dart';
import 'package:two_website/features/about-us-why-us/data/datasources/about_us_remote_datasource.dart';
import 'package:two_website/features/about-us-why-us/data/datasources/why_us_remote_datesource.dart';
import 'package:two_website/features/about-us-why-us/data/repos/about_us_repo_impl.dart';
import 'package:two_website/features/about-us-why-us/data/repos/why_us_repo_impl.dart';
import 'package:two_website/features/about-us-why-us/domain/repos/about_us_repo.dart';
import 'package:two_website/features/about-us-why-us/domain/repos/why_us_repo.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/about-us-usecase/create_about_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/about-us-usecase/show_about_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/about-us-usecase/update_about_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/why-us-usecase/create_why_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/why-us-usecase/delete_why_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/why-us-usecase/show_why_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/domain/usecases/why-us-usecase/update_why_us_usecase.dart';
import 'package:two_website/features/about-us-why-us/presentation/bloc/about_us_why_us_bloc.dart';
import 'package:two_website/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_website/features/auth/data/repos/auth_repo_impl.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';
import 'package:two_website/features/auth/domain/usecases/login_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/logout_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/register_usecase.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/contact-us/data/datasources/contact_us_remote_datasource.dart';
import 'package:two_website/features/contact-us/data/repos/contact_us_repo_impl.dart';
import 'package:two_website/features/contact-us/domain/repos/contact_us_repo.dart';
import 'package:two_website/features/contact-us/domain/usecases/create_contact_us_usecase.dart';
import 'package:two_website/features/contact-us/domain/usecases/mark_contact_us_as_approved_uscase.dart';
import 'package:two_website/features/contact-us/domain/usecases/mark_contact_us_as_seen_usecase.dart';
import 'package:two_website/features/contact-us/domain/usecases/show_contact_us_with_seen_and_approved_usecase.dart';
import 'package:two_website/features/contact-us/presentation/bloc/contact_us_bloc.dart';
import 'package:two_website/features/posts/data/datasources/posts_local_datasource.dart';
import 'package:two_website/features/posts/data/datasources/posts_remote_datasource.dart';
import 'package:two_website/features/posts/data/repos/post_repo_impl.dart';
import 'package:two_website/features/posts/domain/repos/post_repo.dart';
import 'package:two_website/features/posts/domain/usecases/accept_reply_usecase.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_website/features/profile/data/datasources/profile_remote_datasourse.dart';
import 'package:two_website/features/profile/data/repos/profile_repo_impl.dart';
import 'package:two_website/features/profile/domain/repos/profile_repo.dart';
import 'package:two_website/features/profile/domain/usecases/update_client_profile_usecase.dart';
import 'package:two_website/features/profile/domain/usecases/update_employee_profile_usecase.dart';
import 'package:two_website/features/profile/domain/usecases/update_freelance_profile_usecase.dart';
import 'package:two_website/features/profile/domain/usecases/update_guest_profile_usecase.dart';
import 'package:two_website/features/roles/data/datasources/role_local_datasource.dart';
import 'package:two_website/features/roles/data/datasources/role_remote_datasource.dart';
import 'package:two_website/features/roles/data/repos/role_repo_impl.dart';
import 'package:two_website/features/roles/domain/repos/role_repo.dart';
import 'package:two_website/features/roles/domain/usecases/show_role_client_usecase.dart';
import 'package:two_website/features/roles/domain/usecases/show_roles_without_client_usecase.dart';
import 'package:two_website/features/services/data/datasources/service_remote_datasource.dart';
import 'package:two_website/features/services/data/repos/service_repo_impl.dart';
import 'package:two_website/features/services/domain/repos/service_repo.dart';
import 'package:two_website/features/services/domain/usecases/create_service_usecase.dart';
import 'package:two_website/features/services/domain/usecases/delete_service_usecase.dart';
import 'package:two_website/features/services/domain/usecases/show_service_usecase.dart';
import 'package:two_website/features/services/domain/usecases/update_service_usecase.dart';
import 'package:two_website/features/services/presentation/bloc/service_bloc.dart';

import 'features/posts/domain/usecases/create_post_usecase.dart';
import 'features/posts/domain/usecases/delete_post_usecase.dart';
import 'features/posts/domain/usecases/reply_to_post_usecase.dart';
import 'features/posts/domain/usecases/show_active_posts_usecase.dart';
import 'features/posts/domain/usecases/show_post_accepted_replies_usecase.dart';
import 'features/posts/domain/usecases/show_post_replies_usecase.dart';
import 'features/posts/domain/usecases/show_un_active_posts_usecase.dart';
import 'features/posts/domain/usecases/un_active_post_usecase.dart';

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
        updateEmployeeProfileUsecase: sl(),
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

  /**----------------- ROLE FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(
    () => ShowRoleClientUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowRolesWithoutClientUsecase(sl()),
  );
  // Repo
  sl.registerLazySingleton<RoleRepo>(
    () => RoleRepoImpl(sl(), sl(), sl()),
  );
  // Datasource
  sl.registerLazySingleton<RoleRemoteDatasource>(
    () => RoleRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<RoleLocalDatasource>(
    () => RoleLocalDatasourceImpl(),
  );

  /**----------------- PROFILE FEATURE -----------------------**/
  // Usecase
  sl.registerLazySingleton(
    () => UpdateEmployeeProfileUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => UpdateClientProfileUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => UpdateFreelanceProfileUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => UpdateGuestProfileUsecase(sl()),
  );
  // Repo
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(sl()),
  );
  // Datasource
  sl.registerLazySingleton<ProfileRemoteDatasourse>(
    () => ProfileRemoteDatasourseImpl(),
  );

  /**----------------- POST FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
    () => PostBloc(
        acceptReplyUsecase: sl(),
        createPostUsecase: sl(),
        deletePostUsecase: sl(),
        replyToPostUsecase: sl(),
        showActivePostsUsecase: sl(),
        showPostAcceptedRepliesUsecase: sl(),
        showPostRepliesUsecase: sl(),
        showUnActivePostsUsecase: sl(),
        unActivePostUsecase: sl()),
  );
  // Usecases
  sl.registerLazySingleton(
    () => AcceptReplyUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => CreatePostUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => DeletePostUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ReplyToPostUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowActivePostsUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowPostAcceptedRepliesUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowPostRepliesUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowUnActivePostsUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => UnActivePostUsecase(sl()),
  );
  // Repos
  sl.registerLazySingleton<PostRepo>(
    () => PostRepoImpl(sl(), sl(), sl()),
  );

  // Datasources
  sl.registerLazySingleton<PostRemoteDatasource>(
    () => PostsRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<PostsLocalDatasource>(
    () => PostsLocalDatasourceImpl(sl()),
  );

  /**----------------- SERVICES FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
    () => ServiceBloc(sl(), sl(), sl(), sl()),
  );
  // Usecase
  sl.registerLazySingleton(
    () => CreateServiceUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => DeleteServiceUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowServiceUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => UpdateServiceUsecase(sl()),
  );
  //Repo
  sl.registerLazySingleton<ServiceRepo>(
    () => ServiceRepoImpl(sl()),
  );

  // Datasource
  sl.registerLazySingleton<ServiceRemoteDatasource>(
    () => ServiceRemoteDatasourceImpl(),
  );

  /**----------------- ABOUT-US-WHY-US FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(
      () => AboutUsWhyUsBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  // About Us Usecase
  sl.registerLazySingleton(
    () => CreateAboutUsUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowAboutUsUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => UpdateAboutUsUsecase(sl()),
  );
  // Why Us Usecase
  sl.registerLazySingleton(
    () => CreateWhyUsUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => DeleteWhyUsUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowWhyUsUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => UpdateWhyUsUsecase(sl()),
  );
  // Repo
  sl.registerLazySingleton<AboutUsRepo>(
    () => AboutUsRepoImpl(sl()),
  );
  sl.registerLazySingleton<WhyUsRepo>(
    () => WhyUsRepoImpl(sl()),
  );
  // Datasource
  sl.registerLazySingleton<AboutUsRemoteDatasource>(
    () => AboutUsRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<WhyUsRemoteDatesource>(
    () => WhyUsRemoteDatesourceImpl(),
  );

  /**----------------- CONTACT-US FEATURE -----------------------**/
  // Bloc
  sl.registerFactory(() => ContactUsBloc(sl(), sl(), sl(), sl()));
  // Usecase
  sl.registerLazySingleton(
    () => CreateContactUsUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => MarkContactUsAsApprovedUscase(sl()),
  );
  sl.registerLazySingleton(
    () => MarkContactUsAsSeenUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => ShowContactUsWithSeenAndApprovedUsecase(sl()),
  );
  // Repo
  sl.registerLazySingleton<ContactUsRepo>(
    () => ContactUsRepoImpl(sl()),
  );
  // Datasource
  sl.registerLazySingleton<ContactUsRemoteDatasource>(
    () => ContactUsRemoteDatasourceImpl(),
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

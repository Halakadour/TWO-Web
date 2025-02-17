import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_website/core/network/network_connection_checker.dart';
import 'package:two_website/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_website/features/auth/data/repos/auth_repo_impl.dart';
import 'package:two_website/features/auth/domain/repos/auth_repo.dart';
import 'package:two_website/features/auth/domain/usecases/login_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/logout_usecase.dart';
import 'package:two_website/features/auth/domain/usecases/register_usecase.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_bloc.dart';
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
import 'package:two_website/features/roles/data/datasources/role_local_datasource.dart';
import 'package:two_website/features/roles/data/datasources/role_remote_datasource.dart';
import 'package:two_website/features/roles/data/repos/role_repo_impl.dart';
import 'package:two_website/features/roles/domain/repos/role_repo.dart';
import 'package:two_website/features/roles/domain/usecases/show_role_client_usecase.dart';
import 'package:two_website/features/roles/domain/usecases/show_roles_without_client_usecase.dart';

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
  /**  AUTH FEATURE **/
  // Bloc
  sl.registerFactory(
    () => AuthRoleProfileBloc(
        registerUsecase: sl(),
        loginUsecase: sl(),
        logoutUsecase: sl(),
        showRoleClientUsecase: sl(),
        showRolesWithoutClientUsecase: sl(),
        updateEmployeeProfileUsecase: sl(),
        updateClientProfileUsecase: sl()),
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

  /** ROLE FEATURE **/
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

  /** PROFILE FEATURE **/
  // Usecase
  sl.registerLazySingleton(
    () => UpdateEmployeeProfileUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => UpdateClientProfileUsecase(sl()),
  );
  // Repo
  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(sl()),
  );
  // Datasource
  sl.registerLazySingleton<ProfileRemoteDatasourse>(
    () => ProfileRemoteDatasourseImpl(),
  );

  /**  POST FEATURE **/
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

  /////////////////////////////////////////////////////////////////

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

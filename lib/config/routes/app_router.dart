import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/features/auth/presentation/pages/choose-user-type/choose_user_type_page.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/fill_client_profile_page.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/fill_employee_profile_page.dart';
import 'package:two_website/features/auth/presentation/pages/login/login_page.dart';
import 'package:two_website/features/auth/presentation/pages/sign-up/sign_up_page.dart';
import 'package:two_website/features/landing/presentation/pages/landing_page.dart';
import 'package:two_website/features/main/presentation/pages/main_page.dart';
import 'package:two_website/features/posts/presentation/pages/create-post/create_post_page.dart';
import 'package:two_website/features/posts/presentation/pages/post_replies_page.dart';
import 'package:two_website/features/posts/presentation/pages/reply_to_post_page.dart';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: '/main', routes: [
    GoRoute(
      name: AppRouteConfig.landing,
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(child: LandingPage()),
    ),
    GoRoute(
      name: AppRouteConfig.login,
      path: '/login',
      pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
    ),
    GoRoute(
      name: AppRouteConfig.signup,
      path: '/signup',
      pageBuilder: (context, state) => const MaterialPage(child: SignUpPage()),
    ),
    GoRoute(
      name: AppRouteConfig.chooseUserType,
      path: '/chooseUserType',
      pageBuilder: (context, state) =>
          const MaterialPage(child: ChooseUserTypePage()),
    ),
    GoRoute(
      name: AppRouteConfig.fillClientProfile,
      path: '/fillClientProfile',
      pageBuilder: (context, state) =>
          const MaterialPage(child: FillClientProfilePage()),
    ),
    GoRoute(
      name: AppRouteConfig.fillEmployeeProfile,
      path: '/fillEmployeeProfile',
      pageBuilder: (context, state) =>
          const MaterialPage(child: FillEmployeeProfilePage()),
    ),
    GoRoute(
      name: AppRouteConfig.main,
      path: '/main',
      pageBuilder: (context, state) => const MaterialPage(child: MainPage()),
    ),
    GoRoute(
      name: AppRouteConfig.createPost,
      path: '/createPost',
      pageBuilder: (context, state) =>
          const MaterialPage(child: CreatePostPage()),
    ),
    GoRoute(
      name: AppRouteConfig.replyToPost,
      path: '/replyToPost/:id/:image/:body',
      pageBuilder: (context, state) => MaterialPage(
          child: ReplyToPostPage(
              postId: state.pathParameters['id'] ?? '',
              postPoster: state.pathParameters['image'] ?? '',
              postbody: state.pathParameters['body'] ?? '')),
    ),
    GoRoute(
      name: AppRouteConfig.postReplies,
      path: '/postReplies/:id',
      pageBuilder: (context, state) => MaterialPage(
          child: PostRepliesPage(
        postId: state.pathParameters['id'] ?? '',
      )),
    ),
  ]);
}

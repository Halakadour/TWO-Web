import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/features/auth/presentation/pages/fill_client_profile_page.dart';
import 'package:two_website/features/auth/presentation/pages/fill_employee_profile_page.dart';
import 'package:two_website/features/auth/presentation/pages/login/login_page.dart';
import 'package:two_website/features/auth/presentation/pages/sign-up/sign_up.dart';
import 'package:two_website/features/landing/presentation/pages/landing_page.dart';
import 'package:two_website/features/main/presentation/pages/main_page.dart';
import 'package:two_website/features/posts/presentation/pages/reply_to_post_page.dart';

// import '../../features/auth/presentation/pages/signup_page.dart';

class AppRouter {
  GoRouter router = GoRouter(initialLocation: '/signup', routes: [
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
      pageBuilder: (context, state) => const MaterialPage(child: SignUp()),
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
      name: AppRouteConfig.replyToPost,
      path: '/replyToPost/:id/:image/:body',
      pageBuilder: (context, state) => MaterialPage(
          child: ReplyToPostPage(
              postId: state.pathParameters['id'] ?? '',
              postPoster: state.pathParameters['image'] ?? '',
              postbody: state.pathParameters['body'] ?? '')),
    ),
  ]);
}

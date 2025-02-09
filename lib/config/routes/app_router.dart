import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/main_page.dart';

import '../../sections/auth/presentation/pages/login_page.dart';
import '../../sections/auth/presentation/pages/signup_page.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: AppRouteConfig.main,
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(child: MainPage()),
    ),
    GoRoute(
      name: AppRouteConfig.login,
      path: '/login',
      pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
    ),
    GoRoute(
      name: AppRouteConfig.signup,
      path: '/signup',
      pageBuilder: (context, state) => const MaterialPage(child: SignupPage()),
    ),
  ]);
}

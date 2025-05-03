import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/features/auth/presentation/pages/choose-user-type/success_auth_page.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/fill_profile_page.dart';
import 'package:two_website/features/auth/presentation/pages/login/login_page.dart';
import 'package:two_website/features/auth/presentation/pages/sign-up/sign_up_page.dart';
import 'package:two_website/features/landing/presentation/pages/landing_page.dart';
import 'package:two_website/features/landing/presentation/pages/reply_to_post_page.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AppRouteConfig.landing,
        path: '/',
        builder: (context, state) => const LandingPage(),
      ),
      // AUTH PAGES
      GoRoute(
        name: AppRouteConfig.login,
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: AppRouteConfig.signup,
        path: '/signup',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: AppRouteConfig.chooseUserType,
        path: '/chooseUserType',
        builder: (context, state) => const SuccessAuthPage(),
      ),
      GoRoute(
        name: AppRouteConfig.fillProfile,
        path: '/fillProfile',
        builder: (context, state) => const FillProfilePage(),
      ),
      GoRoute(
          name: AppRouteConfig.replyToPost,
          path: '/replyToPost/:id/:image/:body',
          builder: (context, state) => ReplyToPostPage(
              postId: state.pathParameters['id'] ?? '',
              postPoster: state.pathParameters['image'] ?? '',
              postbody: state.pathParameters['body'] ?? '')),
    ],
  );
}

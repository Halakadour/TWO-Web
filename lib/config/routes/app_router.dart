import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/features/auth/presentation/pages/choose-user-type/choose_user_type_page.dart';
import 'package:two_website/features/auth/presentation/pages/fill-client-profile/fill__client_profile_page.dart';
import 'package:two_website/features/auth/presentation/pages/fill-freelancer-profile/fill__freelancer_profile_page.dart';
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
        builder: (context, state) => const ChooseUserTypePage(),
      ),
      GoRoute(
        name: AppRouteConfig.fillClientProfile,
        path: '/fillClientProfile/:id',
        builder: (context, state) => FillClientProfilePage(
          id: state.pathParameters['id'] ?? '',
        ),
      ),
      GoRoute(
        name: AppRouteConfig.fillFreelancerProfile,
        path: '/fillFreelancerProfile/:id',
        builder: (context, state) => FillFreelancerProfilePage(
          id: state.pathParameters['id'] ?? '',
        ),
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

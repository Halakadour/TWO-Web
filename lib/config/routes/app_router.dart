import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/features/about-us-why-us/presentation/pages/about_us_why_us_page.dart';
import 'package:two_website/features/auth/presentation/pages/choose-user-type/choose_user_type_page.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/fill_client_profile_page.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/fill_employee_profile_page.dart';
import 'package:two_website/features/auth/presentation/pages/login/login_page.dart';
import 'package:two_website/features/auth/presentation/pages/sign-up/sign_up_page.dart';
import 'package:two_website/features/contact-us/presentation/pages/contact_us_page.dart';
import 'package:two_website/features/landing/presentation/pages/landing_page.dart';
import 'package:two_website/features/main/presentation/pages/dashboard_page.dart';
import 'package:two_website/features/main/presentation/pages/main_page.dart';
import 'package:two_website/features/posts/presentation/pages/create-post/create_post_page.dart';
import 'package:two_website/features/posts/presentation/pages/post_replies_page.dart';
import 'package:two_website/features/posts/presentation/pages/posts_page.dart';
import 'package:two_website/features/posts/presentation/pages/reply_to_post_page.dart';
import 'package:two_website/features/profile/presentation/pages/accounts_page.dart';
import 'package:two_website/features/profile/presentation/pages/setting_page.dart';
import 'package:two_website/features/services/presentation/pages/services_page.dart';
import 'package:two_website/features/services/presentation/pages/update_service_page.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/dashboard',
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
        path: '/fillClientProfile',
        builder: (context, state) => const FillClientProfilePage(),
      ),
      GoRoute(
        name: AppRouteConfig.fillEmployeeProfile,
        path: '/fillEmployeeProfile',
        builder: (context, state) => const FillEmployeeProfilePage(),
      ),
      // MAIN WEB APP PAGES
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => RootPage(shell: shell),
        branches: [
          // Dashboard Branch
          StatefulShellBranch(routes: [
            GoRoute(
              name: AppRouteConfig.dashboard,
              path: '/dashboard',
              builder: (context, state) => const DashboardPage(),
            ),
          ]),
          // Acounts Branch
          StatefulShellBranch(routes: [
            GoRoute(
              name: AppRouteConfig.acounts,
              path: '/acounts',
              builder: (context, state) => const AccountsPage(),
            ),
          ]),
          // About Us Why Us Branch
          StatefulShellBranch(routes: [
            GoRoute(
              name: AppRouteConfig.aboutUsWhyUs,
              path: '/aboutUsWhyUs',
              builder: (context, state) => const AboutUsWhyUsPage(),
            ),
          ]),
          // Service Branch
          StatefulShellBranch(routes: [
            // services page
            GoRoute(
              name: AppRouteConfig.services,
              path: '/services',
              builder: (context, state) => const ServicesPage(),
            ),
            // create service page
            GoRoute(
              name: AppRouteConfig.createService,
              path: '/services/createService',
              builder: (context, state) => const CreatePostPage(),
            ),
            // update service page
            GoRoute(
                name: AppRouteConfig.updateService,
                path: '/services/updateServices',
                builder: (context, state) => const UpdateServicePage()),
          ]),

          // Posts Branch
          StatefulShellBranch(routes: [
            // posts page
            GoRoute(
              name: AppRouteConfig.post,
              path: '/posts',
              builder: (context, state) => const PostsPage(),
            ),
            // create post page
            GoRoute(
              name: AppRouteConfig.createPost,
              path: '/posts/createPost',
              builder: (context, state) => const CreatePostPage(),
            ),
            // post replies page
            GoRoute(
              name: AppRouteConfig.postReplies,
              path: '/posts/postReplies/:id',
              builder: (context, state) => PostRepliesPage(
                postId: state.pathParameters['id'] ?? '',
              ),
            ),
          ]),
          // Contact Us Branch
          StatefulShellBranch(routes: [
            GoRoute(
              name: AppRouteConfig.contactUs,
              path: '/contactUs',
              builder: (context, state) => const ContactUsPage(),
            ),
          ]),
          // Setting Branch
          StatefulShellBranch(routes: [
            GoRoute(
              name: AppRouteConfig.settings,
              path: '/settings',
              builder: (context, state) => const SettingPage(),
            ),
          ]),
        ],
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

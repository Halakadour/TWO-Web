import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/presentation/pages/login/responsive-pages/login_desktop_tablet.dart';
import 'package:two_website/features/auth/presentation/pages/login/responsive-pages/login_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
      listener: (context, state) async {
        if (state.authModelStatus == CasualStatus.loading) {
          CustomQuickAlert().loadingAlert(context);
        } else if (state.authModelStatus == CasualStatus.success) {
          await SharedPreferencesServices.setUserToken(state.authModel!.token);
          context.pop();
          context.pushReplacementNamed(AppRouteConfig.main);
        } else if (state.authModelStatus == CasualStatus.failure ||
            state.authModelStatus == CasualStatus.noToken) {
          context.pop();
          CustomQuickAlert().failureAlert(context, state.message);
          print(state.message);
        } else {
          const SizedBox();
        }
      },
      listenWhen: (previous, current) =>
          previous.authModelStatus != current.authModelStatus,
      child: CustomSiteTemplate(
        currentPageIndex: 0,
        onItemSelected: (p0) {},
        useLayout: false,
        desktop: const LoginDesktopTablet(),
        tablet: const LoginDesktopTablet(),
        mobile: const LoginMobile(),
      ),
    );
  }
}

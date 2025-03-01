// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/responsive-pages/fill_client_profile_desktop_tablet.dart';

import '../../../../../core/network/enums.dart';

class FillClientProfilePage extends StatelessWidget {
  const FillClientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
      listener: (context, state) {
        if (state.updateClientProfileStatus == CasualStatus.loading) {
          CustomQuickAlert().loadingAlert(context);
        } else if (state.updateClientProfileStatus == CasualStatus.success) {
          context.pop();
          context.pushReplacementNamed(AppRouteConfig.landing);
        } else if (state.updateClientProfileStatus == CasualStatus.failure) {
          context.pop();
          print(state.message);
          CustomQuickAlert().failureAlert(context, state.message);
        }
      },
      listenWhen: (previous, current) {
        return (previous.updateClientProfileStatus !=
            current.updateClientProfileStatus);
      },
      child: CustomSiteTemplate(
        currentPageIndex: 0,
        onItemSelected: (p0) {},
        useLayout: false,
        desktop: const FillClientProfileDesktopTablet(),
        tablet: const FillClientProfileDesktopTablet(),
      ),
    );
  }
}

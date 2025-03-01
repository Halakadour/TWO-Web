// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/responsive-pages/fill_employee_profile.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/responsive-pages/fill_employee_profile_desktop_tablet.dart';

class FillEmployeeProfilePage extends StatefulWidget {
  const FillEmployeeProfilePage({super.key});

  @override
  State<FillEmployeeProfilePage> createState() => _FillProfilePageState();
}

class _FillProfilePageState extends State<FillEmployeeProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
      listener: (context, state) {
        if (state.updateEmployeeProfileStatus == CasualStatus.loading) {
          CustomQuickAlert().loadingAlert(context);
        } else if (state.updateEmployeeProfileStatus == CasualStatus.success) {
          context.pop();
          context.pushReplacementNamed(AppRouteConfig.main);
        } else if (state.updateEmployeeProfileStatus == CasualStatus.failure) {
          context.pop();

          CustomQuickAlert().failureAlert(context, state.message);
        }
      },
      listenWhen: (previous, current) {
        return (previous.updateEmployeeProfileStatus !=
            current.updateEmployeeProfileStatus);
      },
      child: CustomSiteTemplate(
        currentPageIndex: 0,
        onItemSelected: (p0) {},
        useLayout: false,
        desktop: const FillEmployeeProfileDesktopTablet(),
        tablet: const FillEmployeeProfileDesktopTablet(),
        mobile: const FillEmployeeProfileMobile(),
      ),
    );
  }
}

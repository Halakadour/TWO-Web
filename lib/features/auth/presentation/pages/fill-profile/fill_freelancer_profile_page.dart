// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/core/functions/bloc-state-handling/auth_state_handling.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/responsive-pages/fill_freelancer_profile.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/responsive-pages/fill_freelancer_profile_desktop_tablet.dart';

class FillFreelancerProfilePage extends StatefulWidget {
  const FillFreelancerProfilePage({super.key});

  @override
  State<FillFreelancerProfilePage> createState() => _FillProfilePageState();
}

class _FillProfilePageState extends State<FillFreelancerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
      listener: (context, state) {
        AuthStateHandling().fillFreelancerProfileListener(state, context);
      },
      listenWhen: (previous, current) {
        return (previous.updateFreeLancerProfileStatus !=
            current.updateFreeLancerProfileStatus);
      },
      child: CustomSiteTemplate(
        currentPageIndex: 0,
        onItemSelected: (p0) {},
        desktop: const FillEmployeeProfileDesktopTablet(),
        tablet: const FillEmployeeProfileDesktopTablet(),
        mobile: const FillEmployeeProfileMobile(),
      ),
    );
  }
}

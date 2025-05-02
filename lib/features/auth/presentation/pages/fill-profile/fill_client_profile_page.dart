// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/core/functions/bloc-state-handling/auth_state_handling.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/presentation/pages/fill-profile/responsive-pages/fill_client_profile_desktop_tablet.dart';

class FillClientProfilePage extends StatelessWidget {
  const FillClientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
      listener: (context, state) {
        AuthStateHandling().fillClientProfileListener(state, context);
      },
      listenWhen: (previous, current) {
        return (previous.updateClientProfileStatus !=
            current.updateClientProfileStatus);
      },
      child: CustomSiteTemplate(
        currentPageIndex: 0,
        onItemSelected: (p0) {},
        desktop: const FillClientProfileDesktopTablet(),
        tablet: const FillClientProfileDesktopTablet(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/core/functions/bloc-state-handling/auth_state_handling.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/presentation/pages/sign-up/responsive-pages/sign_up_desktop_tablet.dart';
import 'package:two_website/features/auth/presentation/pages/sign-up/responsive-pages/sign_up_mobile.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
      listener: (context, state) async {
        await AuthStateHandling().signUpListener(state, context);
      },
      listenWhen: (previous, current) =>
          previous.authModelStatus != current.authModelStatus,
      child: const CustomSiteTemplate(
        desktop: SignUpDesktopTablet(),
        tablet: SignUpDesktopTablet(),
        mobile: SignUpMobile(),
      ),
    );
  }
}

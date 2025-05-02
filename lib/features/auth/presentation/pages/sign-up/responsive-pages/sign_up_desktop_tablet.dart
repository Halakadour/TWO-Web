import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/login_template.dart';
import 'package:two_website/features/auth/presentation/widgets/sign-up/sign_up_form.dart';
import 'package:two_website/features/auth/presentation/widgets/sign-up/sign_up_header.dart';

class SignUpDesktopTablet extends StatelessWidget {
  const SignUpDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollTemplate(
      child: Column(
        children: [
          // Header
          SignUpHeader(),
          // Form
          SignUpForm()
        ],
      ),
    );
  }
}

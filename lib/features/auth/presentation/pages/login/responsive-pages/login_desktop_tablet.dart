import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/login_template.dart';
import 'package:two_website/features/auth/presentation/widgets/login/login_form.dart';
import 'package:two_website/features/auth/presentation/widgets/login/login_header.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginTemplate(
      child: Column(
        children: [
          // Header
          LoginHeader(),
          // Form
          LoginForm()
        ],
      ),
    );
  }
}

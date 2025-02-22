import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/login_template.dart';
import 'package:two_website/features/auth/presentation/widgets/choose-user-type/choose_use_type_body.dart';

class ChooseUserTypeDesktopTablet extends StatelessWidget {
  const ChooseUserTypeDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginTemplate(
      child: Column(
        children: [
          // Body
          ChooseUseTypeBody()
        ],
      ),
    );
  }
}

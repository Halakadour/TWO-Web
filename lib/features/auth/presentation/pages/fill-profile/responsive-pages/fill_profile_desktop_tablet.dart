import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/login_template.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/fill_profile_body.dart';

class FillProfileDesktopTablet extends StatelessWidget {
  const FillProfileDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollTemplate(
        child: Column(
      children: [
        // Body
        FillProfileBody()
      ],
    ));
  }
}

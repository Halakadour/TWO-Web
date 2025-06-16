import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/login_template.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/fill__client_profile_body.dart';

class FillClientProfileDesktopTablet extends StatelessWidget {
  const FillClientProfileDesktopTablet({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return ScrollTemplate(
        child: Column(
      children: [
        // Body
        FillClientProfileBody(
          id: id,
        )
      ],
    ));
  }
}

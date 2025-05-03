import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/features/auth/presentation/pages/choose-user-type/responsive-pages/success_auth_desktop_tablet.dart';
import 'package:two_website/features/auth/presentation/pages/choose-user-type/responsive-pages/success_auth_mobile.dart';

class SuccessAuthPage extends StatelessWidget {
  const SuccessAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSiteTemplate(
      desktop: SuccessAuthDesktopTablet(),
      tablet: SuccessAuthDesktopTablet(),
      mobile: SuccessAuthMobile(),
    );
  }
}

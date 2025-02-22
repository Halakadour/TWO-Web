import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/features/auth/presentation/pages/choose-user-type/responsive-pages/choose_user_type_desktop_tablet.dart';
import 'package:two_website/features/auth/presentation/pages/choose-user-type/responsive-pages/choose_user_type_mobile.dart';

class ChooseUserTypePage extends StatelessWidget {
  const ChooseUserTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSiteTemplate(
      currentPageIndex: 0,
      onItemSelected: (p0) {},
      desktop: const ChooseUserTypeDesktopTablet(),
      tablet: const ChooseUserTypeDesktopTablet(),
      mobile: const ChooseUserTypeMobile(),
      useLayout: false,
    );
  }
}

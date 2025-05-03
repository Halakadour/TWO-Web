import 'package:flutter/material.dart';
import 'package:two_website/core/functions/device_utility.dart';
import 'package:two_website/core/widgets/layouts/footer/footer_desktop_tablet.dart';
import 'package:two_website/core/widgets/layouts/footer/footer_mobile.dart';

class CustomAppFooter extends StatelessWidget {
  const CustomAppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return !DeviceUtility.isMobileScreen(context)
        ? const FooterDesktopTablet()
        : const FooterMobile();
  }
}

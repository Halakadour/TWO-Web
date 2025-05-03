import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/functions/device_utility.dart';
import 'package:two_website/core/widgets/responsive/responsive_design.dart';

// ignore: must_be_immutable
class CustomSiteTemplate extends StatelessWidget {
  const CustomSiteTemplate({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
    this.backgroundColor,
  });
  // Widget for desktop layout
  final Widget? desktop;

  // Widget for tablet layout
  final Widget? tablet;

  // Widget for mobile layout
  final Widget? mobile;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (backgroundColor == null)
          ? DeviceUtility.isMobileScreen(context)
              ? AppColors.white
              : AppColors.bgColor
          : backgroundColor,
      body: CustomResponsiveDesign(
          desktop: desktop ?? Container(),
          tablet: tablet ?? desktop ?? Container(),
          mobile: mobile ?? desktop ?? Container()),
    );
  }
}

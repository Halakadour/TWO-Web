import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/functions/device_utility.dart';
import 'package:two_website/core/widgets/responsive/responsive_design.dart';

// ignore: must_be_immutable
class CustomSiteTemplate extends StatelessWidget {
  CustomSiteTemplate(
      {super.key,
      this.desktop,
      this.tablet,
      this.mobile,
      required this.currentPageIndex,
      required this.onItemSelected});
  // Widget for desktop layout
  final Widget? desktop;

  // Widget for tablet layout
  final Widget? tablet;

  // Widget for mobile layout
  final Widget? mobile;

  // Flag to determine whether to use the layout
  int currentPageIndex;
  dynamic Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeviceUtility.isMobileScreen(context)
          ? AppColors.white
          : AppColors.bgColor,
      body: CustomResponsiveDesign(
          desktop: desktop ?? Container(),
          tablet: desktop ?? Container(),
          mobile: desktop ?? Container()),
    );
  }
}

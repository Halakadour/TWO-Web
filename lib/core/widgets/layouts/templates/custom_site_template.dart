import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/functions/device_utility.dart';
import 'package:two_website/core/widgets/responsive/responsive_design.dart';
import 'package:two_website/core/widgets/responsive/screens/desktop_layout.dart';
import 'package:two_website/core/widgets/responsive/screens/mobile_layout.dart';
import 'package:two_website/core/widgets/responsive/screens/tablet_layout.dart';

// ignore: must_be_immutable
class CustomSiteTemplate extends StatelessWidget {
  CustomSiteTemplate(
      {super.key,
      this.desktop,
      this.tablet,
      this.mobile,
      this.useLayout = true,
      required this.currentPageIndex,
      required this.onItemSelected});
  // Widget for desktop layout
  final Widget? desktop;

  // Widget for tablet layout
  final Widget? tablet;

  // Widget for mobile layout
  final Widget? mobile;

  // Flag to determine whether to use the layout
  final bool useLayout;
  int currentPageIndex;
  dynamic Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeviceUtility.isMobileScreen(context)
          ? AppColors.whiteColor
          : AppColors.bgColor,
      body: CustomResponsiveDesign(
          desktop: useLayout
              ? DesktopLayout(
                  body: desktop,
                  currentPageIndex: currentPageIndex,
                  onItemSelected: onItemSelected,
                )
              : desktop ?? Container(),
          tablet: useLayout
              ? TabletLayout(
                  body: tablet ?? desktop,
                  currentPageIndex: currentPageIndex,
                  onItemSelected: onItemSelected,
                )
              : desktop ?? Container(),
          mobile: useLayout
              ? MobileLayout(
                  body: mobile ?? desktop,
                  currentPageIndex: currentPageIndex,
                  onItemSelected: onItemSelected,
                )
              : desktop ?? Container()),
    );
  }
}

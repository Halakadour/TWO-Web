import 'package:flutter/material.dart';

class CustomResponsiveDesign extends StatelessWidget {
  const CustomResponsiveDesign(
      {super.key,
      required this.desktop,
      required this.tablet,
      required this.mobile});
  // Widget for desktop layout
  final Widget desktop;

  // Widget for tablet layout
  final Widget tablet;

  // Widget for mobile layout
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= 1300) {
          return desktop;
        } else if (constraints.maxWidth < 1300 && constraints.maxWidth >= 760) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}

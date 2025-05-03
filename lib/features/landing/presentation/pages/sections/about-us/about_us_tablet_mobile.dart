import 'package:flutter/material.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/about_us_column.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/why_us_column.dart';

class AboutUsTabletMobile extends StatelessWidget {
  const AboutUsTabletMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // About Us Part
        AboutUsColumn(),
        // Why Us Part
        WhyUsColumn()
      ],
    );
  }
}

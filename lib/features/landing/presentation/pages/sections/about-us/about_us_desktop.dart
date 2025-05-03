import 'package:flutter/material.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/about_us_column.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/why_us_column.dart';

class AboutUsDesktop extends StatelessWidget {
  const AboutUsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // About Us Part
        const AboutUsColumn(),
        Image.asset(
          ImagesPath.builder,
        ),
        // Why Us Part
        const WhyUsColumn()
      ],
    );
  }
}

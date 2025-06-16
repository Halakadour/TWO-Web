import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/about_us_column.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/why_us_column.dart';

class AboutUsDesktop extends StatelessWidget {
  const AboutUsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // About Us Part
        const Expanded(child: AboutUsColumn()),
        PaddingConfig.w24,
        Expanded(
          child: Image.asset(
            ImagesPath.builder,
          ),
        ),
        PaddingConfig.w24,
        // Why Us Part
        const Expanded(child: WhyUsColumn())
      ],
    );
  }
}

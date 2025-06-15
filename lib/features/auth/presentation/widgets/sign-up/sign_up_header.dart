import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/text_style.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            ImagesPath.webLogo,
            width: 40,
            height: 40,
          ),
          const SizedBox(
            height: SizesConfig.spaceBtwSections,
          ),
          Text(
            TextStrings.signupTitle,
            style: AppTextStyle.headerSm(),
          ),
        ],
      ),
    );
  }
}

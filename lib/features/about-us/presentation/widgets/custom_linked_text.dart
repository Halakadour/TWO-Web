import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/paths/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class CustomLinkedText extends StatelessWidget {
  const CustomLinkedText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyle.buttonStyle(color: AppColors.greenColor),
        ),
        w5,
        SvgPicture.asset(
          IconsPath.arrowRight,
          // ignore: deprecated_member_use
          color: AppColors.greenColor,
        )
      ],
    );
  }
}

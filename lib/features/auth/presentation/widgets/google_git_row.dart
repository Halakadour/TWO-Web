import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/paths/assets_path.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';

class GoogleGitRow extends StatelessWidget {
  const GoogleGitRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child:
                OpenAcountButton(iconPath: IconsPath.google, title: "Google")),
        w10,
        Expanded(
            child:
                OpenAcountButton(iconPath: IconsPath.githup, title: "GitHup")),
      ],
    );
  }
}

class OpenAcountButton extends StatelessWidget {
  const OpenAcountButton({
    super.key,
    required this.iconPath,
    required this.title,
  });
  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: rectPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayColor, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20,
          ),
          w5,
          Text(
            title,
            style: AppTextStyle.buttonStyle(),
          ),
        ],
      ),
    );
  }
}

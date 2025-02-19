import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/paths/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class BlackBox extends StatelessWidget {
  const BlackBox({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        SvgPicture.asset(
          IconsPath.blackBox,
          width: 225,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Column(
            children: [
              Text(
                text1,
                style: AppTextStyle.buttonStyle(color: AppColors.whiteColor),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: AppColors.whiteColor,
                  ),
                  w5,
                  Text(
                    text2,
                    style:
                        AppTextStyle.buttonStyle(color: AppColors.whiteColor),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

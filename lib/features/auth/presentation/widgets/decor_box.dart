import 'package:flutter/material.dart';
import 'package:two_website/config/theme/text_style.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/strings/assets_path.dart';
import '../../../../config/theme/color.dart';

class DecorBox extends StatelessWidget {
  const DecorBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingConfig.containerPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.fieldColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagesPath.diagram,
            width: 350,
          ),
          PaddingConfig.h20,
          Text(
            "Organize Your Team Work",
            style: AppTextStyle.heading03(color: AppColors.fontDarkColor),
          ),
          PaddingConfig.h10,
          Text(
            "this website is just for you dude\ndon't thihk about it just use it.",
            textAlign: TextAlign.center,
            style: AppTextStyle.subtitle02(color: AppColors.fontLightColor),
          )
        ],
      ),
    );
  }
}

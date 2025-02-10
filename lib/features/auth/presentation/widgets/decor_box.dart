import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/paths/assets_path.dart';
import '../../../../config/theme/color.dart';

class DecorBox extends StatelessWidget {
  const DecorBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: containerPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.blueColor.withOpacity(.5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                IconsPath.idea,
                width: 500,
              )
            ],
          )
        ],
      ),
    );
  }
}

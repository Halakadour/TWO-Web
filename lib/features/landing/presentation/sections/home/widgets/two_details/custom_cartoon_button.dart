import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../config/constants/padding_config.dart';
import '../../../../../../../config/paths/assets_path.dart';
import '../../../../../../../config/theme/color.dart';
import '../../../../../../../config/theme/text_style.dart';

class CustomCartoonButton extends StatelessWidget {
  const CustomCartoonButton({
    super.key,
    required bool isHovered,
    required this.title,
    this.width,
  }) : _isHovered = isHovered;

  final bool _isHovered;
  final String title;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width ?? 190,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: AppColors.greenColor,
            borderRadius: BorderRadius.circular(7),
            boxShadow: _isHovered
                ? const [
                    BoxShadow(
                        blurRadius: 0,
                        color: AppColors.darkGreenColor,
                        blurStyle: BlurStyle.normal,
                        offset: Offset(0, 5),
                        spreadRadius: 1)
                  ]
                : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            SvgPicture.asset(IconsPath.arrowLeft, color: AppColors.whiteColor),
            w10,
            Text(
              title,
              style: AppTextStyle.buttonStyle(color: AppColors.whiteColor),
            ),
          ],
        ));
  }
}

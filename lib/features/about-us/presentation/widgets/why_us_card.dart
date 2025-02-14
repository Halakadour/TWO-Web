import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_website/core/widgets/custom_mouse_Region.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';

class WhyUsCard extends StatelessWidget {
  const WhyUsCard(
      {super.key,
      required this.icon,
      required this.text,
      required this.isHoverd});

  final String icon;
  final String text;
  final bool isHoverd;

  @override
  Widget build(BuildContext context) {
    return CustomMouseRegion(
      isHovered: isHoverd,
      child: Container(
        margin: marginBottom16,
        padding: containerPadding,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            boxShadow: isHoverd
                ? const [
                    BoxShadow(
                        blurRadius: 0,
                        color: AppColors.darkGreenColor,
                        blurStyle: BlurStyle.normal,
                        offset: Offset(0, 5),
                        spreadRadius: 1)
                  ]
                : const [
                    BoxShadow(
                      color: AppColors.fontLightColor,
                      offset: Offset(2, 2),
                    ),
                    BoxShadow(
                      color: AppColors.grayColor,
                      offset: Offset(-2, -2),
                    ),
                  ]),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            w20,
            Text(
              text,
              style: AppTextStyle.buttonStyle(color: AppColors.fontDarkColor),
            )
          ],
        ),
      ),
    );
  }
}

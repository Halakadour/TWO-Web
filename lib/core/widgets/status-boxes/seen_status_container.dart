import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class SeenStatusContainer extends StatelessWidget {
  const SeenStatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray, width: 1.1),
          color: AppColors.blueShade1,
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
            child: CircleAvatar(
              backgroundColor: AppColors.blueShade2,
            ),
          ),
          PaddingConfig.w8,
          Text(
            "Seen",
            style: AppTextStyle.subtitle03(color: AppColors.blueShade2),
          )
        ],
      ),
    );
  }
}

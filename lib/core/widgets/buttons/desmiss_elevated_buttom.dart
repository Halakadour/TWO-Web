import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class DesmissElevatedButtom extends StatelessWidget {
  const DesmissElevatedButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize:
                const Size(SizesConfig.buttonWidth, SizesConfig.buttonHeight),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: AppColors.navy,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(SizesConfig.borderRadiusMd))),
        onPressed: () => context.pop(),
        child: Text(
          "Dismiss",
          style: AppTextStyle.buttonStyle(color: AppColors.white),
        ));
  }
}

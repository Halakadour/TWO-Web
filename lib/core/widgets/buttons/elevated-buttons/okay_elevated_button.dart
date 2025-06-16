import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class OkayElevatedButton extends StatelessWidget {
  const OkayElevatedButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        backgroundColor: AppColors.greenShade2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizesConfig.buttonRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        TextStrings.okay,
        style: AppTextStyle.buttonStyle(color: AppColors.white),
      ),
    );
  }
}

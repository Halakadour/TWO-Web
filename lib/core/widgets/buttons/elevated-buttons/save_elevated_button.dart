import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class SaveElevatedButton extends StatelessWidget {
  const SaveElevatedButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize:
                const Size(SizesConfig.buttonWidth, SizesConfig.buttonHeight),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: AppColors.greenShade2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizesConfig.buttonRadius))),
        onPressed: onPressed,
        child: Text(
          TextStrings.save,
          style: AppTextStyle.buttonStyle(color: AppColors.white),
        ));
  }
}

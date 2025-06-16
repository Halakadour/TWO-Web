import 'package:flutter/material.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class YesTextBotton extends StatelessWidget {
  const YesTextBotton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          TextStrings.yes,
          style: AppTextStyle.buttonStyle(color: AppColors.greenShade2),
        ));
  }
}

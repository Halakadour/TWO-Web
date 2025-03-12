import 'package:flutter/material.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class SaveTextButton extends StatelessWidget {
  const SaveTextButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          TextStrings.save,
          style: AppTextStyle.buttonStyle(color: AppColors.greenShade2),
        ));
  }
}

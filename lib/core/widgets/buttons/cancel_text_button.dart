import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class CancelTextButton extends StatelessWidget {
  const CancelTextButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed ??
            () {
              context.pop();
            },
        child: Text(
          "Back",
          style: AppTextStyle.buttonStyle(color: AppColors.fontLightColor),
        ));
  }
}

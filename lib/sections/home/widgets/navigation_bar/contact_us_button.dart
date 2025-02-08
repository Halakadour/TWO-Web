import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/theme/text_style.dart';

import '../../../../config/constants/radius_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../lang/locale_keys.g.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(borderRadius: buttonRadius),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        ),
        child: Text(
          LocaleKeys.contactUs.tr(),
          style: AppTextStyle.buttonStyle(color: AppColors.whiteColor),
        ));
  }
}

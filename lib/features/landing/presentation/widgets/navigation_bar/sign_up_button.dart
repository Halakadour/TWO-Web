import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/text_style.dart';

import '../../../../../config/constants/radius_config.dart';
import '../../../../../config/theme/color.dart';
import '../../../../../lang/locale_keys.g.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => context.pushNamed(AppRouteConfig.signup),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(borderRadius: buttonRadius),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        ),
        child: Text(
          LocaleKeys.signup.tr(),
          style: AppTextStyle.buttonStyle(color: AppColors.whiteColor),
        ));
  }
}

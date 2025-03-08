import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';

import '../../../../../config/theme/color.dart';
import '../../../../../config/theme/text_style.dart';

class DontHaveCountRow extends StatelessWidget {
  const DontHaveCountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          TextStrings.dontHaveAccount,
          style: AppTextStyle.subtitle03(color: AppColors.fontLightColor),
        ),
        TextButton(
            onPressed: () =>
                context.pushReplacementNamed(AppRouteConfig.signup),
            child: Text(
              TextStrings.signup,
              style: AppTextStyle.subtitle01(color: AppColors.greenShade2),
            ))
      ],
    );
  }
}

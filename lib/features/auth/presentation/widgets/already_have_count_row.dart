import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';

import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../lang/locale_keys.g.dart';

class AlreadyHaveCountRow extends StatelessWidget {
  const AlreadyHaveCountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "Already Have An Acount?   ",
          style: AppTextStyle.subtitle03(color: AppColors.fontLightColor),
        ),
        TextButton(
            onPressed: () => context.pushNamed(AppRouteConfig.login),
            child: Text(
              LocaleKeys.signin.tr(),
              style: AppTextStyle.subtitle01(color: AppColors.greenColor),
            ))
      ],
    );
  }
}

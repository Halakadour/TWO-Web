import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';

import '../../../../../config/constants/radius_config.dart';
import '../../../../../config/theme/color.dart';
import '../../../../../lang/locale_keys.g.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          final String? token = await SharedPreferencesServices.getUserToken();
          if (token == null) {
            print("Noo Token Here");
            context.pushNamed(AppRouteConfig.signup);
          } else {
            CustomQuickAlert().userTypeAlert(context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: RadiusConfig.buttonRadius),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        ),
        child: Text(
          LocaleKeys.signup.tr(),
          style: AppTextStyle.buttonStyle(color: AppColors.whiteColor),
        ));
  }
}

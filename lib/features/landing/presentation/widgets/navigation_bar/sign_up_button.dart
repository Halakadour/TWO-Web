import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';

import '../../../../../config/constants/radius_config.dart';
import '../../../../../config/theme/color.dart';
import '../../../../../lang/locale_keys.g.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({super.key});

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  ValueNotifier<bool> isVisiter = ValueNotifier(true);
  // @override
  // void initState() async {
  //   isVisiter.value = await SharedPreferencesServices.checkIsVisitor();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          await signInHandling(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: RadiusConfig.buttonRadius),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        ),
        child: Text(
          LocaleKeys.signin.tr(),
          style: AppTextStyle.buttonStyle(color: AppColors.white),
        ));
  }

  Future<void> signInHandling(BuildContext context) async {
    bool isVisiter = await SharedPreferencesServices.checkIsVisitor();
    if (isVisiter) {
      context.pushNamed(AppRouteConfig.login);
    } else {
      context.pushNamed(AppRouteConfig.main);
    }
  }
}

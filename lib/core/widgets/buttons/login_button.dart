import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => context.pushNamed(AppRouteConfig.login),
        child: Text(
          TextStrings.login,
          style: AppTextStyle.buttonStyle(color: AppColors.greenShade2),
        ));
  }
}

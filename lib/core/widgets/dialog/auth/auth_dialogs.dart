import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/buttons/cancel_text_button.dart';
import 'package:two_website/core/widgets/buttons/yes_text_botton.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/landing/presentation/widgets/navigation_bar/sign_up_button.dart';

class AuthDialogs {
  Future<dynamic> logoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Want to logout ? ",
          style: AppTextStyle.bodyMd(),
        ),
        actions: [
          const CancelTextButton(),
          YesTextBotton(onPressed: () {
            context.read<AuthRoleProfileBloc>().add(LogoutUserEvent());
            context.pop();
          }),
        ],
      ),
    );
  }

  Future<dynamic> makeAccountDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizesConfig.borderRadiusLg),
              color: AppColors.white),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(JsonPath.fingerPrint),
              ),
              Text(
                TextStrings.dontHaveAccount,
                style: AppTextStyle.bodyMd(),
              ),
              Text(TextStrings.plaeseMakeAccount,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodySm(color: AppColors.fontLightColor)),
              const SizedBox(width: double.infinity, child: SignUpButton()),
              const CancelTextButton()
            ],
          ),
        ),
      ),
    );
  }
}

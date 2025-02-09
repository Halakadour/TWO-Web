import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/centerd_view.dart';
import 'package:two_website/lang/locale_keys.g.dart';
import 'package:two_website/sections/auth/presentation/widgets/already_have_count_row.dart';
import 'package:two_website/sections/auth/presentation/widgets/decor_box.dart';
import 'package:two_website/sections/auth/presentation/widgets/google_git_row.dart';

import '../../../../config/constants/padding_config.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenterdView(
          child: Row(
        children: [
          const Expanded(flex: 2, child: DecorBox()),
          w50,
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  const AlreadyHaveCountRow(),
                  h30,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.signup.tr(),
                        style: AppTextStyle.heading00(),
                      ),
                      h30,
                      Text(
                        "Sign up with open account",
                        style: AppTextStyle.subtitle02(
                            color: AppColors.fontDarkColor),
                      ),
                      h10,
                      const GoogleGitRow(),
                      h20,
                      const SizedBox(
                        width: 330,
                        child: Divider(
                          color: AppColors.grayColor,
                          thickness: 1,
                        ),
                      ),
                      h20,
                      Text(
                        "Or continue with email address",
                        style: AppTextStyle.subtitle02(
                            color: AppColors.fontDarkColor),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      )),
    );
  }
}

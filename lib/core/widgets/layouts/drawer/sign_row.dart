import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/core/widgets/buttons/text-buttons/login__text_button.dart';
import 'package:two_website/features/landing/presentation/widgets/navigation_bar/custom_vertical_divider.dart';
import 'package:two_website/features/landing/presentation/widgets/navigation_bar/sign_up_button.dart';

class SignRow extends StatelessWidget {
  const SignRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignUpButton(),
        PaddingConfig.w8,
        CustomVerticalDivider(),
        LoginButton()
      ],
    );
  }
}

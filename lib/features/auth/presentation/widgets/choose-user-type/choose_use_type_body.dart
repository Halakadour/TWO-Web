import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/animation/success_status_animation.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';

class ChooseUseTypeBody extends StatefulWidget {
  const ChooseUseTypeBody({super.key});

  @override
  State<ChooseUseTypeBody> createState() => _ChooseUseTypeBodyState();
}

class _ChooseUseTypeBodyState extends State<ChooseUseTypeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Header
        const SuccessStatusAnimation(),
        PaddingConfig.h8,
        Text(
          TextStrings.signUpSuccessfully,
          style: AppTextStyle.subtitle01(color: AppColors.greenShade2),
        ),
        const SizedBox(
          height: SizesConfig.md,
        ),
        Text(TextStrings.continueYourProfile,
            style: AppTextStyle.subtitle02(color: AppColors.fontLightColor)),
        const SizedBox(
          height: SizesConfig.spaceBtwSections,
        ),
        CustomCartoonButton(
          title: "Next",
          width: double.infinity,
          onTap: () {
            context.pushNamed(AppRouteConfig.fillProfile);
          },
        )
      ],
    );
  }
}

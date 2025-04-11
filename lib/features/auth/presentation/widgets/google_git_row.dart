import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/functions/auth_services.dart';
import 'package:two_website/core/widgets/divider/divider_with_text.dart';

class GoogleGitRow extends StatelessWidget {
  const GoogleGitRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DividerWithText(text: "Or Containe With"),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                AuthService().signInWithGoogle();
              },
              child: Expanded(
                child: Container(
                  height: SizesConfig.boxSm,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray, width: .9),
                      borderRadius:
                          BorderRadius.circular(SizesConfig.borderRadiusSm)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        IconsPath.google,
                        width: SizesConfig.iconsMd,
                      ),
                      PaddingConfig.w8,
                      Text(
                        "Google",
                        style: AppTextStyle.buttonStyle(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            PaddingConfig.w16,
            InkWell(
              onTap: () {
                AuthService().signInWithGitHub();
              },
              child: Expanded(
                child: Container(
                  height: SizesConfig.boxSm,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray, width: .9),
                      borderRadius:
                          BorderRadius.circular(SizesConfig.borderRadiusSm)),
                  child: Row(
                    children: [
                      SvgPicture.asset(IconsPath.githup),
                      PaddingConfig.w8,
                      Text(
                        "Githup",
                        style: AppTextStyle.buttonStyle(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class ChooseUseTypeBody extends StatelessWidget {
  const ChooseUseTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Header
        Text(
          TextStrings.signUpSuccessfully,
          style: AppTextStyle.subtitle01(color: AppColors.greenColor),
        ),
        const SizedBox(
          height: SizesConfig.md,
        ),
        // choose you type
        Text(TextStrings.chooseType,
            style: AppTextStyle.subtitle02(color: AppColors.fontLightColor)),
        const SizedBox(
          height: SizesConfig.spaceBtwSections,
        ),
        // Type buttons
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizesConfig.buttonRadius))),
                  fixedSize: const Size(
                      SizesConfig.buttonWidth, SizesConfig.buttonHeight)),
              onPressed: () {
                context.pushReplacementNamed(AppRouteConfig.fillClientProfile);
              },
              child: Text(TextStrings.client,
                  style: AppTextStyle.subtitle02(color: AppColors.whiteColor)),
            ),
            const SizedBox(
              width: SizesConfig.md,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizesConfig.buttonRadius))),
                  fixedSize: const Size(
                      SizesConfig.buttonWidth, SizesConfig.buttonHeight)),
              onPressed: () {
                context
                    .pushReplacementNamed(AppRouteConfig.fillEmployeeProfile);
              },
              child: Text(TextStrings.employee,
                  style: AppTextStyle.subtitle02(color: AppColors.whiteColor)),
            ),
          ],
        ),
        const SizedBox(
          height: SizesConfig.lg,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class WorkingTimeCard extends StatelessWidget {
  const WorkingTimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(SizesConfig.md),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
            color: AppColors.whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Iconsax.clock),
                PaddingConfig.w8,
                Text(
                  "Compony woking time",
                  style:
                      AppTextStyle.subtitle03(color: AppColors.fontDarkColor),
                ),
              ],
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "From :",
                      style:
                          AppTextStyle.subtitle03(color: AppColors.blackColor),
                    ),
                    PaddingConfig.w8,
                    Text(
                      "10:00 AM",
                      style: AppTextStyle.subtitle02(
                          color: AppColors.fontLightColor),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.edit,
                    color: AppColors.greenColor,
                  ),
                )
              ],
            ),
            PaddingConfig.h8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("To :",
                        style: AppTextStyle.subtitle03(
                            color: AppColors.blackColor)),
                    PaddingConfig.w8,
                    Text(
                      "03:00 PM",
                      style: AppTextStyle.subtitle02(
                          color: AppColors.fontLightColor),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.edit,
                    color: AppColors.greenColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

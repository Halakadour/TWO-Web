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
        height: 130,
        padding: const EdgeInsets.all(SizesConfig.md),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
            color: const Color(0xFFC3D8F5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Compony woking time",
                  style: AppTextStyle.subtitle01(color: AppColors.blueShade3),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.edit,
                    color: AppColors.blueShade2,
                  ),
                )
              ],
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Iconsax.calendar,
                      color: AppColors.blueShade2,
                    ),
                    PaddingConfig.w8,
                    Text(
                      "Sanday - Thursday",
                      style:
                          AppTextStyle.subtitle03(color: AppColors.blueShade2),
                    ),
                    PaddingConfig.w8,
                    Text(
                      "10:00 AM - 03:00 PM",
                      style:
                          AppTextStyle.subtitle02(color: AppColors.blueShade2),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class LoadingWorkingTimeCard extends StatelessWidget {
  const LoadingWorkingTimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: SizesConfig.cardHeight,
        padding: const EdgeInsets.all(SizesConfig.md),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
            color: const Color(0xFFC3D8F5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Compony woking time",
                  style: AppTextStyle.subtitle01(color: AppColors.blueShade3),
                ),
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
                    Shimmer.fromColors(
                      baseColor: AppColors.blueShade1,
                      highlightColor: AppColors.white,
                      child: Container(
                        height: 20,
                        width: 60,
                        color: Colors.white,
                      ),
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

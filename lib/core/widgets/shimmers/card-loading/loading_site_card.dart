import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class LoadingSiteCard extends StatelessWidget {
  const LoadingSiteCard({
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
            color: AppColors.greenShade1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Compony woking site",
                  style: AppTextStyle.subtitle01(color: AppColors.greenShade3),
                ),
              ],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                const Icon(
                  Iconsax.building_3,
                  color: AppColors.greenShade2,
                ),
                PaddingConfig.w8,
                Shimmer.fromColors(
                  baseColor: AppColors.greenShade1,
                  highlightColor: AppColors.white,
                  child: Container(
                    height: 20,
                    width: 50,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class SiteCard extends StatelessWidget {
  const SiteCard({
    super.key,
    required this.site,
  });
  final String site;

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
                Text(
                  site,
                  style: AppTextStyle.subtitle03(color: AppColors.greenShade2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

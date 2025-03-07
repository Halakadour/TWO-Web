import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class SiteCard extends StatelessWidget {
  const SiteCard({
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
                const Icon(Iconsax.location),
                PaddingConfig.w8,
                Text(
                  "Compony woking site",
                  style:
                      AppTextStyle.subtitle03(color: AppColors.fontDarkColor),
                ),
              ],
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Aleppo"),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.edit,
                    color: AppColors.greenColor,
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

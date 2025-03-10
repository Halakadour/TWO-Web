import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.black,
                  width: .2,
                ),
                borderRadius:
                    BorderRadius.circular(SizesConfig.borderRadiusSm))),
        onPressed: onPressed,
        icon: Row(
          children: [
            const Icon(
              Iconsax.setting_4,
              size: SizesConfig.iconsSm,
            ),
            PaddingConfig.w8,
            Text(
              "filter",
              style: AppTextStyle.buttonStyle(),
            ),
          ],
        ));
  }
}

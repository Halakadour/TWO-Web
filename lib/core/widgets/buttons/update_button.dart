import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton(
      {super.key, required this.updateType, required this.onPressed});
  final String updateType;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              backgroundColor: AppColors.blueShade2,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(SizesConfig.buttonRadius))),
          onPressed: onPressed,
          child: Row(
            children: [
              const Icon(
                Iconsax.edit,
                color: AppColors.white,
              ),
              PaddingConfig.w8,
              Text(
                "update $updateType",
                style: AppTextStyle.buttonStyle(color: AppColors.white),
              ),
            ],
          )),
    );
  }
}

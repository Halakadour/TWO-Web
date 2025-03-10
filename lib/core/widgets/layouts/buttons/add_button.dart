import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class CreateButton extends StatelessWidget {
  const CreateButton(
      {super.key, required this.addingType, required this.onPressed});
  final String addingType;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              backgroundColor: AppColors.greenShade2,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(SizesConfig.buttonRadius))),
          onPressed: onPressed,
          child: Row(
            children: [
              const Icon(
                Iconsax.add_square,
                color: AppColors.white,
              ),
              PaddingConfig.w8,
              Text(
                "create $addingType",
                style: AppTextStyle.buttonStyle(color: AppColors.white),
              ),
            ],
          )),
    );
  }
}

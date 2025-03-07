import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class AddWhyUsButton extends StatelessWidget {
  const AddWhyUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.greenColor,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(SizesConfig.buttonRadius))),
          onPressed: () {},
          child: Row(
            children: [
              const Icon(
                Iconsax.add,
                color: AppColors.whiteColor,
              ),
              PaddingConfig.w8,
              Text(
                "Add Why Us",
                style: AppTextStyle.buttonStyle(color: AppColors.whiteColor),
              ),
            ],
          )),
    );
  }
}

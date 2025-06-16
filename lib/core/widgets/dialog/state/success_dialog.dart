import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/buttons/elevated-buttons/okay_elevated_button.dart';

void showSuccessDialog(BuildContext context, void Function()? onPressed) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: SizesConfig.dialogWidthMd,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                JsonPath.success,
                width: 150,
                height: 150,
                repeat: true,
              ),
              PaddingConfig.h16,
              Text(
                TextStrings.success,
                style: AppTextStyle.headerSm(color: AppColors.greenShade2),
              ),
              PaddingConfig.h24,
              OkayElevatedButton(onPressed: onPressed),
            ],
          ),
        ),
      );
    },
  );
}

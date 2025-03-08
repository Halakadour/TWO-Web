import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/theme/color.dart';

Widget togglePassword(bool isSecurePassword, Function() onTap) {
  return GestureDetector(
      onTap: onTap,
      child: isSecurePassword
          ? const Icon(
              Iconsax.eye,
              color: AppColors.greenShade2,
            )
          : const Icon(
              Iconsax.eye_slash,
              color: AppColors.greenShade2,
            ));
}

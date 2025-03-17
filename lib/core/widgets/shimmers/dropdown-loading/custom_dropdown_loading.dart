import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';

class CustomDropdownLoading extends StatelessWidget {
  const CustomDropdownLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.fieldColor,
      highlightColor: AppColors.white,
      child: Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.symmetric(
            vertical: SizesConfig.sm, horizontal: SizesConfig.md),
        decoration: BoxDecoration(
            color: AppColors.fieldColor,
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd)),
      ),
    );
  }
}

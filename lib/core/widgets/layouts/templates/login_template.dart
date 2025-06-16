import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';

class ScrollTemplate extends StatelessWidget {
  const ScrollTemplate(
      {super.key, required this.child, this.width, this.height});
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        height: height,
        child: SingleChildScrollView(
          child: Container(
              padding: PaddingConfig.pagePadding,
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(SizesConfig.cardRadiusLg),
                  border: Border.all(color: AppColors.gray, width: .5)),
              child: child),
        ),
      ),
    );
  }
}

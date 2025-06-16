import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class BlackBox extends StatelessWidget {
  const BlackBox({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(SizesConfig.cardRadiusMd)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: AppTextStyle.buttonStyle(color: AppColors.white),
          ),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                color: AppColors.white,
              ),
              PaddingConfig.w8,
              Text(
                text2,
                style: AppTextStyle.buttonStyle(color: AppColors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}

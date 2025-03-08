import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {super.key, required this.imagePath, required this.serviceTitlel});
  final String imagePath;
  final String serviceTitlel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          border: Border.all(
        color: AppColors.fieldColor,
      )),
      child: Column(
        children: [
          Image.asset(imagePath),
          PaddingConfig.h8,
          Text(
            serviceTitlel,
            textAlign: TextAlign.center,
            style: AppTextStyle.subtitle02(color: AppColors.white),
          )
        ],
      ),
    );
  }
}

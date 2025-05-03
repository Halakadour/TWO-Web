import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/soial_media_group.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      color: AppColors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            IconsPath.two,
            width: 100,
          ),
          PaddingConfig.h16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aleppo".toUpperCase(),
                style: AppTextStyle.subtitle02(color: AppColors.white),
              ),
              Text(
                "Al Tilal, Hamra street\nfirst intersection",
                style: AppTextStyle.subtitle04(color: AppColors.white),
              )
            ],
          ),
          PaddingConfig.h8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Working".toUpperCase(),
                style: AppTextStyle.subtitle02(color: AppColors.white),
              ),
              Text(
                "Sunday-Thursday\n10:00 AM- 03:00 PM",
                style: AppTextStyle.subtitle04(color: AppColors.white),
              ),
              PaddingConfig.h16,
              Text(
                "towCompany@gmail.com",
                style: AppTextStyle.subtitle04(
                    color: AppColors.white,
                    decoration: TextDecoration.underline),
              ),
              Text(
                "+9631234567",
                style: AppTextStyle.subtitle04(
                    color: AppColors.white,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          PaddingConfig.h16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "follow us".toUpperCase(),
                style: AppTextStyle.subtitle04(color: AppColors.white),
              ),
              PaddingConfig.h8,
              const Row(
                children: [
                  SoialMediaGroup(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

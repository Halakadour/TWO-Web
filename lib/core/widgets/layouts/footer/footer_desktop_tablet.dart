import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/soial_media_group.dart';

class FooterDesktopTablet extends StatelessWidget {
  const FooterDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      color: AppColors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(IconsPath.two),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aleppo".toUpperCase(),
                style: AppTextStyle.subtitle01(color: AppColors.white),
              ),
              PaddingConfig.h8,
              Text(
                "Al Tilal, Hamra street\nfirst intersection",
                style: AppTextStyle.subtitle03(color: AppColors.white),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Working".toUpperCase(),
                style: AppTextStyle.subtitle01(color: AppColors.white),
              ),
              PaddingConfig.h8,
              Text(
                "Sunday-Thursday\n10:00 AM- 03:00 PM",
                style: AppTextStyle.subtitle03(color: AppColors.white),
              ),
              PaddingConfig.h16,
              Text(
                "towCompany@gmail.com",
                style: AppTextStyle.subtitle03(
                    color: AppColors.white,
                    decoration: TextDecoration.underline),
              ),
              Text(
                "+9631234567",
                style: AppTextStyle.subtitle03(
                    color: AppColors.white,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "follow us".toUpperCase(),
                style: AppTextStyle.subtitle01(color: AppColors.white),
              ),
              PaddingConfig.h8,
              const SoialMediaGroup()
            ],
          ),
        ],
      ),
    );
  }
}

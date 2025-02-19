import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/paths/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/soial_media_group.dart';

class CustomAppFooter extends StatelessWidget {
  const CustomAppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      color: AppColors.blackColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(IconsPath.two),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aleppo".toUpperCase(),
                style: AppTextStyle.subtitle01(color: AppColors.whiteColor),
              ),
              h10,
              Text(
                "Al Tilal, Hamra street\nfirst intersection",
                style: AppTextStyle.subtitle03(color: AppColors.whiteColor),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Working".toUpperCase(),
                style: AppTextStyle.subtitle01(color: AppColors.whiteColor),
              ),
              h10,
              Text(
                "Sunday-Thursday\n10:00 AM- 03:00 PM",
                style: AppTextStyle.subtitle03(color: AppColors.whiteColor),
              ),
              h20,
              Text(
                "towCompany@gmail.com",
                style: AppTextStyle.subtitle03(
                    color: AppColors.whiteColor,
                    decoration: TextDecoration.underline),
              ),
              Text(
                "+9631234567",
                style: AppTextStyle.subtitle03(
                    color: AppColors.whiteColor,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "follow us".toUpperCase(),
                style: AppTextStyle.subtitle01(color: AppColors.whiteColor),
              ),
              h10,
              const SoialMediaGroup()
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/landing/presentation/pages/sections/about-us/about_us_desktop.dart';
import 'package:two_website/features/landing/presentation/pages/sections/about-us/about_us_tablet_mobile.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.aboutUs.tr().toUpperCase(),
            style: AppTextStyle.headerLg(),
          ),
          PaddingConfig.h16,
          const Expanded(
            child: CustomSiteTemplate(
              backgroundColor: AppColors.white,
              desktop: AboutUsDesktop(),
              tablet: AboutUsTabletMobile(),
              mobile: AboutUsTabletMobile(),
            ),
          ),
        ],
      ),
    );
  }
}

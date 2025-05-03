import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';
import 'package:two_website/features/landing/presentation/pages/sections/about-us/about_us_desktop.dart';
import 'package:two_website/features/landing/presentation/pages/sections/about-us/about_us_tablet_mobile.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class AboutUsSection extends StatefulWidget {
  const AboutUsSection({super.key});

  @override
  State<AboutUsSection> createState() => _AboutUsSectionState();
}

class _AboutUsSectionState extends State<AboutUsSection> {
  @override
  void didChangeDependencies() {
    context.read<LandingBloc>().add(ShowWhyUsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.aboutUs.tr().toUpperCase(),
            style: AppTextStyle.heading00(),
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

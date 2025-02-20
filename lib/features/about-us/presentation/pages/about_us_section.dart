import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/templates/centerd_view.dart';
import 'package:two_website/features/about-us/presentation/widgets/black_box.dart';
import 'package:two_website/features/about-us/presentation/widgets/custom_linked_text.dart';
import 'package:two_website/features/about-us/presentation/widgets/why_us_row.dart';
import 'package:two_website/lang/locale_keys.g.dart';

import '../widgets/why_us_card.dart';

class AboutUsSection extends StatefulWidget {
  const AboutUsSection({super.key});

  @override
  State<AboutUsSection> createState() => _AboutUsSectionState();
}

class _AboutUsSectionState extends State<AboutUsSection> {
  final List<String> icons = [
    IconsPath.wourd,
    IconsPath.dollar,
    IconsPath.handShake,
    IconsPath.like,
    IconsPath.replay,
  ];
  final List<String> texts = [
    LocaleKeys.documentedSuccess.tr(),
    LocaleKeys.competitivePrices.tr(),
    LocaleKeys.customizedSolutions.tr(),
    LocaleKeys.extraodinryUser.tr(),
    LocaleKeys.continuousSupport.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return CenterdView(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.aboutUs.tr().toUpperCase(),
              style: AppTextStyle.heading00(),
            ),
            PaddingConfig.h20,
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "TWO ", style: AppTextStyle.heading04()),
              TextSpan(
                  text: LocaleKeys.isACompane.tr(),
                  style:
                      AppTextStyle.subtitle01(color: AppColors.fontLightColor))
            ])),
            PaddingConfig.h40,
            Text(
              LocaleKeys.weHaveMore.tr(),
              style: AppTextStyle.heading03(),
            ),
            PaddingConfig.h20,
            CustomLinkedText(title: LocaleKeys.checkOurClients.tr()),
            PaddingConfig.h20,
            const BlackBox(
                text1: "Sunday - Thursday", text2: "10:00 AM - 03:00 PM"),
            PaddingConfig.h20,
            BlackBox(
                text1: LocaleKeys.Adress.tr(),
                text2: "Aleppo - Halab Aljadida"),
          ],
        ),
        Image.asset(
          ImagesPath.builder,
        ),
        SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WhyUsRow(),
              PaddingConfig.h40,
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: icons.length,
                    itemBuilder: (context, index) => WhyUsCard(
                          icon: icons[index],
                          text: texts[index],
                          isHover: ValueNotifier(false),
                        )),
              ),
            ],
          ),
        )
      ],
    ));
  }
}

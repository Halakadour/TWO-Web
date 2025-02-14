import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/paths/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/centerd_view.dart';
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
  bool isHoved = false;

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
            h20,
            RichText(
                text: TextSpan(children: [
              TextSpan(text: "TWO ", style: AppTextStyle.heading04()),
              TextSpan(
                  text: LocaleKeys.isACompane.tr(),
                  style:
                      AppTextStyle.subtitle01(color: AppColors.fontLightColor))
            ])),
            h40,
            Text(
              LocaleKeys.weHaveMore.tr(),
              style: AppTextStyle.heading03(),
            ),
            h20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.checkOurClients.tr(),
                  style: AppTextStyle.buttonStyle(color: AppColors.greenColor),
                ),
                w5,
                SvgPicture.asset(
                  IconsPath.arrowLeft,
                )
              ],
            ),
            h20,
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SvgPicture.asset(
                  IconsPath.blackBox,
                  width: 225,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Column(
                    children: [
                      Text(
                        "Sunday - Thursday",
                        style: AppTextStyle.buttonStyle(
                            color: AppColors.whiteColor),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: AppColors.whiteColor,
                          ),
                          w5,
                          Text(
                            "10:00 AM - 03:00 PM",
                            style: AppTextStyle.buttonStyle(
                                color: AppColors.whiteColor),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            h20,
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SvgPicture.asset(
                  IconsPath.blackBox,
                  width: 225,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.Adress.tr(),
                        style: AppTextStyle.buttonStyle(
                            color: AppColors.whiteColor),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.whiteColor,
                          ),
                          w5,
                          Text(
                            "Aleppo - Halab Aljadida",
                            style: AppTextStyle.buttonStyle(
                                color: AppColors.whiteColor),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
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
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.whyUs.tr(),
                      style: AppTextStyle.heading02(),
                    ),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.seeAll.tr(),
                          style: AppTextStyle.buttonStyle(
                              color: AppColors.greenColor),
                        ),
                        SvgPicture.asset(
                          IconsPath.arrowLeft,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              h40,
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: icons.length,
                    itemBuilder: (context, index) => MouseRegion(
                            child: WhyUsCard(
                          icon: icons[index],
                          text: texts[index],
                          isHoverd: isHoved,
                        ))),
              ),
            ],
          ),
        )
      ],
    ));
  }
}

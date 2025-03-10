import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/about-us-why-us/presentation/bloc/about_us_why_us_bloc.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/black_box.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/custom_linked_text.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/why_us_row.dart';
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
  void didChangeDependencies() {
    context.read<AboutUsWhyUsBloc>().add(ShowWhyUsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
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
            PaddingConfig.h16,
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
            PaddingConfig.h16,
            CustomLinkedText(title: LocaleKeys.checkOurClients.tr()),
            PaddingConfig.h16,
            const BlackBox(
                text1: "Sunday - Thursday", text2: "10:00 AM - 03:00 PM"),
            PaddingConfig.h16,
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
                  child: BlocBuilder<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                    buildWhen: (previous, current) =>
                        previous.showWhyUsStatus != current.showWhyUsStatus,
                    builder: (context, state) {
                      if (state.showWhyUsStatus == CasualStatus.loading) {
                        return const CircularProgressIndicator();
                      } else if (state.showWhyUsStatus ==
                          CasualStatus.success) {
                        return ListView.builder(
                            itemCount: icons.length,
                            itemBuilder: (context, index) => WhyUsCard(
                                  icon: icons[index],
                                  text: state.showWhyUsList[index]!.whyUsDoc,
                                  isHover: ValueNotifier(false),
                                ));
                      } else if (state.showWhyUsStatus ==
                          CasualStatus.failure) {
                        return Text(state.message);
                      } else {
                        return const SizedBox();
                      }
                    },
                  )),
            ],
          ),
        )
      ],
    ));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/why_us_card.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class WhyUsColumn extends StatelessWidget {
  const WhyUsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.whyUs.tr(),
              style: AppTextStyle.headerLg(),
            ),
          ],
        ),
        PaddingConfig.h16,
        Expanded(
          child: ListView.builder(
              itemCount: TextStrings.whyUsList.length,
              itemBuilder: (context, index) => WhyUsCard(
                    icon: TextStrings.whyUsIconList[index],
                    text: TextStrings.whyUsList[index],
                    isHover: ValueNotifier(false),
                  )),
        )
        // Expanded(
        //     child: BlocBuilder<LandingBloc, LandingState>(
        //   buildWhen: (previous, current) =>
        //       previous.showWhyUsStatus != current.showWhyUsStatus,
        //   builder: (context, state) {
        //     return LandingStateHandling().showWhyUsList(state);
        //   },
        // )),
      ],
    );
  }
}

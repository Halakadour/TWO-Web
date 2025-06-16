import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/black_box.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/custom_linked_text.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class AboutUsColumn extends StatelessWidget {
  const AboutUsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 400,
          child: Text(
            LocaleKeys.isACompane.tr(),
            style: AppTextStyle.bodyLg(color: AppColors.fontLightColor),
            overflow: TextOverflow.fade,
            maxLines: 4,
          ),
        ),
        PaddingConfig.h40,
        Text(
          LocaleKeys.weHaveMore.tr(),
          style: AppTextStyle.headerMd(),
        ),
        PaddingConfig.h16,
        Row(
          children: [
            CustomLinkedText(title: LocaleKeys.checkOurClients.tr()),
          ],
        ),
        PaddingConfig.h16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlackBox(text1: TextStrings.workDays, text2: TextStrings.workHours),
            PaddingConfig.h16,
            BlackBox(
                text1: LocaleKeys.Adress.tr(), text2: TextStrings.workAdress),
          ],
        )
        // BlocBuilder<LandingBloc, LandingState>(
        //   buildWhen: (previous, current) =>
        //       previous.showAboutUsStatus != current.showAboutUsStatus,
        //   builder: (context, state) {
        //     return LandingStateHandling().showAboutUs(state);
        //   },
        // ),
      ],
    );
  }
}

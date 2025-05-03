import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/functions/bloc-state-handling/landing_state_handling.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';
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
            style: AppTextStyle.subtitle01(color: AppColors.fontLightColor),
            overflow: TextOverflow.fade,
            maxLines: 4,
          ),
        ),
        PaddingConfig.h40,
        Text(
          LocaleKeys.weHaveMore.tr(),
          style: AppTextStyle.heading03(),
        ),
        PaddingConfig.h16,
        Row(
          children: [
            CustomLinkedText(title: LocaleKeys.checkOurClients.tr()),
          ],
        ),
        PaddingConfig.h16,
        BlocBuilder<LandingBloc, LandingState>(
          buildWhen: (previous, current) =>
              previous.showAboutUsStatus != current.showAboutUsStatus,
          builder: (context, state) {
            return LandingStateHandling().showAboutUs(state);
          },
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/functions/bloc-state-handling/landing_state_handling.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';
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
            child: BlocBuilder<LandingBloc, LandingState>(
          buildWhen: (previous, current) =>
              previous.showWhyUsStatus != current.showWhyUsStatus,
          builder: (context, state) {
            return LandingStateHandling().showWhyUsList(state);
          },
        )),
      ],
    );
  }
}

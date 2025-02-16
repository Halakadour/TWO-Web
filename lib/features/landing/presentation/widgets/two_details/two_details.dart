import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/lang/locale_keys.g.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/soial_media_group.dart';

class TwoDetails extends StatefulWidget {
  const TwoDetails({super.key});

  @override
  State<TwoDetails> createState() => _TwoDetailsState();
}

class _TwoDetailsState extends State<TwoDetails> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        h50,
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: LocaleKeys.homeTitle1.tr(),
                  style: AppTextStyle.heading00()),
              TextSpan(
                  text: LocaleKeys.homeTitle2.tr(),
                  style: AppTextStyle.heading00(color: AppColors.greenColor))
            ])),
        h30,
        MouseRegion(
          onEnter: (_) {
            setState(() {
              _isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: CustomCartoonButton(
            isHovered: _isHovered,
            title: LocaleKeys.orderProj.tr(),
          ),
        ),
        h30,
        Text(
          LocaleKeys.orContactUs.tr(),
          style: AppTextStyle.subtitle01(),
        ),
        h20,
        const SoialMediaGroup()
      ],
    );
  }
}

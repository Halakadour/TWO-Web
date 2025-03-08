import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';

// ignore: must_be_immutable
class WhyUsCard extends StatefulWidget {
  WhyUsCard(
      {super.key,
      required this.icon,
      required this.text,
      required this.isHover});

  final String icon;
  final String text;
  ValueNotifier<bool> isHover;

  @override
  State<WhyUsCard> createState() => _WhyUsCardState();
}

class _WhyUsCardState extends State<WhyUsCard> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (context) {
        setState(() {
          widget.isHover.value = true;
        });
      },
      onExit: (context) {
        setState(() {
          widget.isHover.value = false;
        });
      },
      child: ValueListenableBuilder(
        valueListenable: widget.isHover,
        builder: (context, value, child) => AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Container(
              margin: PaddingConfig.marginBottom16,
              padding: PaddingConfig.containerPadding,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                  boxShadow: value
                      ? const [
                          BoxShadow(
                              blurRadius: 0,
                              color: AppColors.fontLightColor,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(0, 5),
                              spreadRadius: 1)
                        ]
                      : const [
                          BoxShadow(
                            color: AppColors.fontLightColor,
                            offset: Offset(2, 2),
                          ),
                          BoxShadow(
                            color: AppColors.gray,
                            offset: Offset(-2, -2),
                          ),
                        ]),
              child: Row(
                children: [
                  SvgPicture.asset(widget.icon),
                  PaddingConfig.w24,
                  Text(
                    widget.text,
                    style: AppTextStyle.buttonStyle(
                        color: AppColors.fontDarkColor),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

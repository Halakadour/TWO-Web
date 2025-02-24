import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/constants/padding_config.dart';
import '../../../../../config/strings/assets_path.dart';
import '../../../../../config/theme/color.dart';
import '../../../../../config/theme/text_style.dart';

// ignore: must_be_immutable
class CustomCartoonButton extends StatefulWidget {
  CustomCartoonButton({
    super.key,
    required this.title,
    required this.isHover,
    required this.onTap,
    this.width,
  });

  final String title;
  final double? width;
  final void Function()? onTap;
  ValueNotifier<bool> isHover;

  @override
  State<CustomCartoonButton> createState() => _CustomCartoonButtonState();
}

class _CustomCartoonButtonState extends State<CustomCartoonButton> {
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
          builder: (context, value, child) => InkWell(
                onTap: widget.onTap,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: widget.width ?? 190,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: value
                            ? const [
                                BoxShadow(
                                    blurRadius: 0,
                                    color: AppColors.darkGreenColor,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset(0, 5),
                                    spreadRadius: 1)
                              ]
                            : []),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.title,
                          style: AppTextStyle.buttonStyle(
                              color: AppColors.whiteColor),
                        ),
                        PaddingConfig.w10,
                        // ignore: deprecated_member_use
                        SvgPicture.asset(IconsPath.arrowRight,
                            // ignore: deprecated_member_use
                            color: AppColors.whiteColor),
                      ],
                    )),
              )),
    );
  }
}

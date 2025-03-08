import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_website/config/constants/sizes_config.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/strings/assets_path.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';

// ignore: must_be_immutable
class CustomCartoonButton extends StatelessWidget {
  CustomCartoonButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
  });

  final String title;
  final double? width;
  final void Function()? onTap;
  ValueNotifier<bool> isHover = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (context) {
        isHover.value = true;
      },
      onExit: (context) {
        isHover.value = false;
      },
      child: ValueListenableBuilder(
          valueListenable: isHover,
          builder: (context, value, child) => InkWell(
                onTap: onTap,
                child: AnimatedContainer(
                    duration: const Duration(
                        milliseconds: SizesConfig.animationDuration),
                    width: width ?? 190,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.greenShade2,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: value
                            ? const [
                                BoxShadow(
                                    blurRadius: 0,
                                    color: AppColors.greenShade3,
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
                          title,
                          style:
                              AppTextStyle.buttonStyle(color: AppColors.white),
                        ),
                        PaddingConfig.w16,
                        // ignore: deprecated_member_use
                        SvgPicture.asset(IconsPath.arrowRight,
                            // ignore: deprecated_member_use
                            color: AppColors.white),
                      ],
                    )),
              )),
    );
  }
}

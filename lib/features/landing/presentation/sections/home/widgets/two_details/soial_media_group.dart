import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/widgets/custom_mouse_Region.dart';

import '../../../../../../../config/constants/padding_config.dart';
import '../../../../../../../config/paths/assets_path.dart';

class SoialMediaGroup extends StatefulWidget {
  const SoialMediaGroup({
    super.key,
  });
  static const double iconSize = 24;

  @override
  State<SoialMediaGroup> createState() => _SoialMediaGroupState();
}

class _SoialMediaGroupState extends State<SoialMediaGroup> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
          child: SvgPicture.asset(
            IconsPath.facebook,
            width: SoialMediaGroup.iconSize,
            // ignore: deprecated_member_use
            color: _isHovered ? AppColors.greenColor : AppColors.iconColor,
          ),
        ),
        w10,
        CustomMouseRegion(
          isHovered: _isHovered,
          child: SvgPicture.asset(
            IconsPath.whatsup,
            width: SoialMediaGroup.iconSize,
          ),
        ),
        w10,
        SvgPicture.asset(
          IconsPath.instgram,
          width: SoialMediaGroup.iconSize,
        ),
        w10,
        SvgPicture.asset(
          IconsPath.x,
          width: SoialMediaGroup.iconSize,
        ),
      ],
    );
  }
}

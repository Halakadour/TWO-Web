import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/theme/color.dart';

import '../../../../../config/constants/padding_config.dart';
import '../../../../../config/strings/assets_path.dart';

class SoialMediaGroup extends StatefulWidget {
  const SoialMediaGroup({
    super.key,
  });
  static const double iconSize = 24;

  @override
  State<SoialMediaGroup> createState() => _SoialMediaGroupState();
}

class _SoialMediaGroupState extends State<SoialMediaGroup> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          IconsPath.facebook,
          width: SoialMediaGroup.iconSize,
          // ignore: deprecated_member_use
          color: AppColors.iconColor,
        ),
        PaddingConfig.w16,
        SvgPicture.asset(
          IconsPath.whatsup,
          width: SoialMediaGroup.iconSize,
        ),
        PaddingConfig.w16,
        SvgPicture.asset(
          IconsPath.instgram,
          width: SoialMediaGroup.iconSize,
        ),
        PaddingConfig.w16,
        SvgPicture.asset(
          IconsPath.x,
          width: SoialMediaGroup.iconSize,
        ),
      ],
    );
  }
}

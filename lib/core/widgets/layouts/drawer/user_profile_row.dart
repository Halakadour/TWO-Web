import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/images/fetch_network_image.dart';
import 'package:two_website/features/auth/domain/entity/profile_entity.dart';

class UserProfileRow extends StatelessWidget {
  const UserProfileRow({super.key, required this.profileEntity});
  final ProfileEntity profileEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            FetchNetworkImage(
              imagePath: profileEntity.pImage!,
              shape: BoxShape.circle,
            ),
          ],
        ),
        PaddingConfig.w8,
        // Name and Email
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profileEntity.pName,
              style: AppTextStyle.subtitle02(
                color: AppColors.fontDarkColor,
              ),
            ),
            Text(
              profileEntity.pRole,
              style: AppTextStyle.subtitle03(
                color: AppColors.fontLightColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

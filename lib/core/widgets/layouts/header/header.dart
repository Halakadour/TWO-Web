import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/radius_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/functions/device_utility.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/images/custom_rounded_image.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader({super.key, this.scaffoldKey});
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(bottom: BorderSide(color: AppColors.gray, width: 1))),
      padding: const EdgeInsets.symmetric(
          horizontal: SizesConfig.md, vertical: SizesConfig.sm),
      child: AppBar(
        // Mobile Menu
        leading: !DeviceUtility.isDesktopScreen(context)
            ? IconButton(
                onPressed: () {
                  scaffoldKey?.currentState!.openDrawer();
                },
                icon: const Icon(Iconsax.menu))
            : null,
        // Search Field
        title: DeviceUtility.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: RadiusConfig.textfieldRadius,
                          borderSide: const BorderSide(
                              color: AppColors.fieldColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: RadiusConfig.textfieldRadius,
                          borderSide: const BorderSide(
                              color: AppColors.fieldColor, width: 2)),
                      prefixIcon: const Icon(
                        Iconsax.search_normal,
                      ),
                      hintText: 'Search anything...',
                      hintStyle: AppTextStyle.textfieldStyle()),
                ),
              )
            : null,
        // Actions
        actions: [
          // Search Icon on Mobile
          if (!DeviceUtility.isDesktopScreen(context))
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
          // Notification Icon
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          PaddingConfig.h8,
          // User Data
          const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // image
              CustomRoundedImage(
                  width: 40,
                  height: 40,
                  padding: 2,
                  borderRadius: 30,
                  imageType: ImageType.asset,
                  image: ImagesPath.cloud)
            ],
          ),
          PaddingConfig.w8,
          // Name and Email
          if (!DeviceUtility.isMobileScreen(context))
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hala Kad",
                  style:
                      AppTextStyle.subtitle02(color: AppColors.fontDarkColor),
                ),
                Text(
                  "Flutter developer",
                  style:
                      AppTextStyle.subtitle03(color: AppColors.fontLightColor),
                ),
              ],
            )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

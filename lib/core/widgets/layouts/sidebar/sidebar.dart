import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/sidebar/menu_item.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({
    super.key,
    required this.currentPageIndex,
    required this.onItemSelected,
  });

  final int currentPageIndex;
  final Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.navyColor,
          border: Border(
            right: BorderSide(color: AppColors.grayColor, width: 1),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: SizesConfig.md),
                child: SvgPicture.asset(IconsPath.logo),
              ),
              PaddingConfig.h16,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizesConfig.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "MENU",
                      style: AppTextStyle.subtitle03(
                        color: AppColors.whiteColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                    PaddingConfig.h8,
                    MenuItem(
                      icon: IconsPath.category,
                      itemName: "Dashboard",
                      pageNum: 0,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected, // Pass callback
                    ),
                    MenuItem(
                      icon: IconsPath.threeUsers,
                      itemName: "Accounts",
                      pageNum: 1,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.edit,
                      itemName: "About Us & Why Us",
                      pageNum: 2,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.paper,
                      itemName: "Posts",
                      pageNum: 3,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.email,
                      itemName: "Contact Us",
                      pageNum: 4,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    PaddingConfig.h8,
                    Text(
                      "OTHER",
                      style: AppTextStyle.subtitle03(
                        color: AppColors.whiteColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                    PaddingConfig.h8,
                    MenuItem(
                      icon: IconsPath.setting,
                      itemName: "Settings",
                      pageNum: 5,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.logout,
                      itemName: "logout",
                      pageNum: 6,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.itemName,
    required this.pageNum,
    required this.currentPage,
    required this.onTap,
  });

  final IconData icon;
  final String itemName;
  final int pageNum;
  final int currentPage;
  final Function(int) onTap; // Callback function

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(pageNum);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: SizesConfig.animationDuration),
        margin: const EdgeInsets.symmetric(vertical: SizesConfig.xs),
        child: Container(
          decoration: BoxDecoration(
              color: (pageNum == currentPage)
                  ? AppColors.greenShade2.withValues(alpha: .1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (pageNum == currentPage)
                const SizedBox(
                  height: 20,
                  child: VerticalDivider(
                    color: AppColors.greenShade2,
                    thickness: 3,
                  ),
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Icon(
                  icon,
                  // ignore: deprecated_member_use
                  color: (pageNum == currentPage)
                      ? AppColors.greenShade2
                      : AppColors.fontLightColor,
                ),
              ),
              Text(
                itemName,
                style: AppTextStyle.navRailStyle(
                  color: (pageNum == currentPage)
                      ? AppColors.greenShade2
                      : AppColors.fontLightColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

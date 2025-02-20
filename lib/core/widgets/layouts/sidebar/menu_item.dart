import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  final String icon;
  final String itemName;
  final int pageNum;
  final int currentPage;
  final Function(int) onTap; // Callback function

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(pageNum); // Notify MainPage to update the index
      },
      child: MouseRegion(
        onEnter: (_) {
          // Hover effect
        },
        onExit: (_) {
          // Hover effect
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: SizesConfig.xs),
          decoration: BoxDecoration(
            color: (pageNum == currentPage)
                ? AppColors.greenColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SvgPicture.asset(
                  icon,
                  color: (pageNum == currentPage)
                      ? AppColors.whiteColor
                      : AppColors.fontLightColor,
                ),
              ),
              Text(
                itemName,
                style: AppTextStyle.buttonStyle(
                  color: (pageNum == currentPage)
                      ? AppColors.whiteColor
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

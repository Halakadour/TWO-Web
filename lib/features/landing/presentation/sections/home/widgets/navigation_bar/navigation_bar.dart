import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/paths/assets_path.dart';
import 'package:two_website/lang/locale_keys.g.dart';
import 'package:two_website/features/landing/presentation/sections/home/widgets/navigation_bar/nav_bar_item.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: SvgPicture.asset(ImagesPath.webLogo),
          ),
          Center(
            child: SizedBox(
              width: 500,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavBarItem(title: LocaleKeys.home.tr()),
                  NavBarItem(title: LocaleKeys.aboutUs.tr()),
                  NavBarItem(title: LocaleKeys.services.tr()),
                  NavBarItem(title: LocaleKeys.portfolio.tr()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

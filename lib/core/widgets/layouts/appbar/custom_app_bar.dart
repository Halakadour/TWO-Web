import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/appbar/desktop_tablet_app_bar.dart';
import 'package:two_website/core/widgets/layouts/appbar/mobile_app_bar.dart';
import 'package:two_website/core/widgets/responsive/responsive_design.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveDesign(
        desktop: DesktopTabletAppBar(scrollController: scrollController),
        tablet: DesktopTabletAppBar(scrollController: scrollController),
        mobile: MobileAppBar(
          scrollController: scrollController,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

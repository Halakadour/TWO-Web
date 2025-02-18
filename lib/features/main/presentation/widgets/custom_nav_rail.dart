import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';

import '../../../../config/theme/text_style.dart';

class CustomNavRail extends StatelessWidget {
  const CustomNavRail({
    super.key,
    required this.selectedIndex,
  });

  final ValueNotifier<int> selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, value, child) => NavigationRail(
        backgroundColor: AppColors.navyColor,
        onDestinationSelected: (value) {
          selectedIndex.value = value;
        },
        elevation: 1,
        indicatorColor: const Color(0xFF1E274E),
        labelType: NavigationRailLabelType.selected,
        minWidth: 200,
        groupAlignment: -.9,
        selectedIconTheme: const IconThemeData(
          applyTextScaling: true,
          size: 30,
          color: AppColors.whiteColor,
        ),
        unselectedIconTheme: const IconThemeData(
          applyTextScaling: true,
          size: 30,
          color: AppColors.whiteColor,
        ),
        selectedLabelTextStyle:
            AppTextStyle.navRailStyle(color: AppColors.whiteColor),
        unselectedLabelTextStyle:
            AppTextStyle.navRailStyle(color: AppColors.whiteColor),
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.home_filled),
            label: Text("Dashboard"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.shopping_bag_rounded),
            label: Text("Role"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.edit_document),
            label: Text("Contracts"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.person_pin_rounded),
            label: Text("Acounts"),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.message_rounded),
            label: Text("Contact Us"),
          ),
        ],
        selectedIndex: value,
        leading: const CircleAvatar(),
      ),
    );
  }
}

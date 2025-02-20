import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';

class DeviceUtility {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= SizesConfig.desktopScreenSize;
  }

  static bool isTabletScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= SizesConfig.tabletScreenSize &&
        MediaQuery.of(context).size.width < SizesConfig.desktopScreenSize;
  }

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < SizesConfig.tabletScreenSize;
  }
}

import 'package:flutter/widgets.dart';
import 'package:two_website/config/constants/sizes_config.dart';

class ForScrolling {
  final List<double> sectionOffsets = [
    0,
    SizesConfig.pageHight + 40,
    SizesConfig.pageHight * 2 + 80,
    SizesConfig.pageHight * 3 + 120,
  ];

  void scrollToSection(int index, ScrollController scrollController) {
    scrollController.animateTo(
      sectionOffsets[index],
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

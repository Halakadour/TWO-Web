import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';

class PageTemplate extends StatelessWidget {
  const PageTemplate({super.key, this.color, this.image, required this.child});
  final Color? color;
  final DecorationImage? image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(image: image, color: color),
      padding: PaddingConfig.pagePadding,
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: double.infinity, maxHeight: SizesConfig.pageHight),
        child: child,
      ),
    );
  }
}

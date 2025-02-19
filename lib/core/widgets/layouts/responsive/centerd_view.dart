import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/page_hight.dart';

class CenterdView extends StatelessWidget {
  const CenterdView({super.key, this.color, this.image, required this.child});
  final Color? color;
  final DecorationImage? image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(image: image, color: color),
      padding: pagePadding,
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: double.infinity, maxHeight: pageHight),
        child: child,
      ),
    );
  }
}

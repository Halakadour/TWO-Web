import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class Breadcrumbs extends StatelessWidget {
  final List<String> paths;
  final List<String> pages;

  const Breadcrumbs({super.key, required this.paths, required this.pages});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(paths.length, (index) {
        final isLast = index == paths.length - 1;
        return Row(
          children: [
            if (index > 0) const Text(' / '),
            GestureDetector(
              onTap: () {
                context.pushNamed(paths[index]);
              },
              child: Text(pages[index],
                  style: AppTextStyle.subtitle03(
                      color: isLast
                          ? AppColors.greenShade3
                          : AppColors.fontLightColor)),
            ),
          ],
        );
      }),
    );
  }
}

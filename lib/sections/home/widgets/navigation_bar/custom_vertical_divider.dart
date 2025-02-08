import 'package:flutter/material.dart';

import '../../../../config/theme/color.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: VerticalDivider(
          width: 3,
          color: AppColors.grayColor,
        ),
      ),
    );
  }
}

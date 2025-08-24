import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/sizes_config.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(
        Icons.arrow_back,
        size: SizesConfig.iconsLg,
      ),
    );
  }
}

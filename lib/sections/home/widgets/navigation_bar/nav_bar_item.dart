import 'package:flutter/material.dart';
import 'package:two_website/config/theme/text_style.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.buttonStyle(),
    );
  }
}

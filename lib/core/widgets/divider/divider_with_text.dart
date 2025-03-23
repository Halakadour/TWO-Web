import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';

class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
            child: Divider(
          color: AppColors.gray,
          thickness: .8,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        const Expanded(
            child: Divider(
          color: AppColors.gray,
          thickness: .8,
        )),
      ],
    );
  }
}

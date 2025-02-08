import 'package:flutter/material.dart';
import 'package:two_website/config/constants/page_hight.dart';

class Section extends StatelessWidget {
  final String title;
  final Color? color;

  const Section({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: pageHight,
      width: double.infinity,
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}

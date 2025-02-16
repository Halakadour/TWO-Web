import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/features/about-us/presentation/widgets/custom_linked_text.dart';

class PostCard extends StatelessWidget {
  const PostCard(
      {super.key, required this.postImagePath, required this.postBody});

  final String postImagePath;
  final String postBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
          boxShadow: const [
            BoxShadow(
                color: AppColors.grayColor,
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(2, 2)),
            BoxShadow(
                color: AppColors.grayColor,
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(-2, -2)),
          ]),
      child: Column(
        children: [
          Image.asset(postImagePath),
          h10,
          Text(postBody),
          const Spacer(),
          const CustomLinkedText(title: "view replies"),
        ],
      ),
    );
  }
}

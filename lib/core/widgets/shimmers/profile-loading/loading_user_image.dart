import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:two_website/config/theme/color.dart';

class LoadingUserImage extends StatelessWidget {
  const LoadingUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 30,
        width: 30,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTableItem extends StatelessWidget {
  const ShimmerTableItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 20,
        width: 60,
        color: Colors.white,
      ),
    );
  }
}

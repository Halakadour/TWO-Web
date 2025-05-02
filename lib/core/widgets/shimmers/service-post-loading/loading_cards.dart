import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCards extends StatelessWidget {
  const LoadingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 300,
                    width: 300,
                    color: Colors.white,
                  ),
                ),
              )),
    );
  }
}

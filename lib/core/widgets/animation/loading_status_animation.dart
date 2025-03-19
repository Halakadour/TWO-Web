import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_website/config/strings/assets_path.dart';

class LoadingStatusAnimation extends StatelessWidget {
  const LoadingStatusAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200, height: 200, child: Lottie.asset(JsonPath.loading));
  }
}

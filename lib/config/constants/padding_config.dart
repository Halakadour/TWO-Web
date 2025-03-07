import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';

class PaddingConfig {
  // Margin
  static const EdgeInsets marginBottom12 = EdgeInsets.only(bottom: 12);
  static const EdgeInsets marginBottom16 = EdgeInsets.only(bottom: 16);
  static const EdgeInsets marginBottom24 = EdgeInsets.only(bottom: 24);
  static const EdgeInsets marginBottom40 = EdgeInsets.only(bottom: 40);

// Padding
  static const EdgeInsets pagePadding =
      EdgeInsets.symmetric(horizontal: 30, vertical: 20);
  static const EdgeInsets containerPadding = EdgeInsets.all(15);
  static const EdgeInsets rectPadding =
      EdgeInsets.symmetric(vertical: 10, horizontal: 40);
  static const EdgeInsets paddingWithAppBarHeight = EdgeInsets.only(
    top: SizesConfig.appbarHeight,
    left: SizesConfig.defaultSpace,
    bottom: SizesConfig.defaultSpace,
    right: SizesConfig.defaultSpace,
  );

// Heights
  static const SizedBox h8 = SizedBox(height: 8);
  static const SizedBox h16 = SizedBox(height: 16);
  static const SizedBox h24 = SizedBox(height: 24);
  static const SizedBox h32 = SizedBox(height: 32);
  static const SizedBox h40 = SizedBox(height: 40);
  static const SizedBox h48 = SizedBox(height: 48);
  static const SizedBox h56 = SizedBox(height: 56);
  static const SizedBox h70 = SizedBox(height: 70);
  static const SizedBox h80 = SizedBox(height: 80);

// Width
  static const SizedBox w8 = SizedBox(width: 8);
  static const SizedBox w16 = SizedBox(width: 16);
  static const SizedBox w24 = SizedBox(width: 24);
  static const SizedBox w32 = SizedBox(width: 32);
  static const SizedBox w40 = SizedBox(width: 40);
  static const SizedBox w48 = SizedBox(width: 48);
}

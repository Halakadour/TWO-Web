import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/strings/assets_path.dart';

Widget togglePassword(bool isSecurePassword, Function() onTap) {
  return GestureDetector(
      onTap: onTap,
      child: isSecurePassword
          ? SvgPicture.asset(IconsPath.eyeShow)
          : SvgPicture.asset(IconsPath.eyeHide));
}

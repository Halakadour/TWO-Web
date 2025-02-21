import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/sizes_config.dart';

import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.prefixIconPath,
      this.postfixIconPath,
      this.prefixIconWidget,
      required this.labelText,
      required this.controller,
      required this.validator,
      this.hintText,
      this.obscureText = false});
  final String? prefixIconPath;
  final Widget? prefixIconWidget;
  final Widget? postfixIconPath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: prefixIconPath == null
              ? prefixIconWidget
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    prefixIconPath!,
                  ),
                ),
          suffixIcon: postfixIconPath == null
              ? null
              : Padding(
                  padding: const EdgeInsets.all(10), child: postfixIconPath),
          label: Text(
            labelText,
            style: AppTextStyle.textfieldStyle(),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizesConfig.inputFieldRadius),
              borderSide:
                  const BorderSide(color: AppColors.grayColor, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizesConfig.inputFieldRadius),
              borderSide:
                  const BorderSide(color: AppColors.grayColor, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizesConfig.inputFieldRadius),
              borderSide:
                  const BorderSide(color: AppColors.grayColor, width: 1))),
    );
  }
}

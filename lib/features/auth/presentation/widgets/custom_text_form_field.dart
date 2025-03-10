import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/sizes_config.dart';

import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.prefixIconPath,
      this.postfixIconPath,
      this.prefixIconWidget,
      required this.labelText,
      required this.controller,
      required this.validator,
      this.hintText,
      this.hintStyle,
      this.style,
      this.obscureText = false,
      this.filled = false,
      this.fillColor = Colors.transparent,
      this.border,
      this.borderColor = AppColors.gray,
      this.enabled,
      this.autofocus = false,
      this.focusNode});

  final String? prefixIconPath;
  final Widget? prefixIconWidget;
  final Widget? postfixIconPath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final String labelText;
  final bool obscureText;
  final bool? filled;
  final Color? fillColor;
  final InputBorder? border;
  final Color? borderColor;
  final TextStyle? style;
  bool? enabled;
  bool autofocus;
  FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      focusNode: focusNode,
      autofocus: autofocus,
      style: style,
      autocorrect: true,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          filled: filled,
          fillColor: fillColor,
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
          hintStyle: hintStyle,
          border: border ??
              OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(SizesConfig.inputFieldRadius),
                  borderSide: BorderSide(
                      color: borderColor ?? AppColors.gray, width: 1)),
          enabledBorder: border ??
              OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(SizesConfig.inputFieldRadius),
                  borderSide: BorderSide(
                      color: borderColor ?? AppColors.gray, width: 1)),
          focusedBorder: border ??
              OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(SizesConfig.inputFieldRadius),
                  borderSide: BorderSide(
                      color: borderColor ?? AppColors.gray, width: 1))),
    );
  }
}

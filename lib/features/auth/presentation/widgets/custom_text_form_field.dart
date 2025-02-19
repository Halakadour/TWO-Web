import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constants/radius_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.prefixIconPath,
      this.postfixIconPath,
      required this.labelText,
      required this.controller,
      required this.validator,
      this.hintText,
      this.obscureText = false});
  final String prefixIconPath;
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
          filled: true,
          fillColor: AppColors.fieldColor,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              prefixIconPath,
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
          border: UnderlineInputBorder(borderRadius: textfieldRadius)),
    );
  }
}

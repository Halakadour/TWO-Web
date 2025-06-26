import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class CustomPhoneNumberField extends StatelessWidget {
  const CustomPhoneNumberField({
    super.key,
    required TextEditingController phoneController,
    this.validator,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: _phoneController,
      initialCountryCode: 'SY',
      validator: validator, // ✅ أضفنا الفاليديتر هون
      decoration: InputDecoration(
        labelText: "",
        labelStyle: AppTextStyle.bodyMd(color: AppColors.fontLightColor),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizesConfig.inputFieldRadius),
            borderSide: const BorderSide(color: AppColors.gray, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizesConfig.inputFieldRadius),
            borderSide: const BorderSide(color: AppColors.gray, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizesConfig.inputFieldRadius),
            borderSide: const BorderSide(color: AppColors.gray, width: 1)),
      ),
    );
  }
}

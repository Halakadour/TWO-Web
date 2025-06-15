import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';

class CustomPhoneNumberField extends StatelessWidget {
  const CustomPhoneNumberField({
    super.key,
    required TextEditingController phoneController,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: _phoneController,
      dropdownTextStyle: AppTextStyle.bodyMd(color: AppColors.fontLightColor),
      initialCountryCode: 'SY',
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

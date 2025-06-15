import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';

class WorkDataStep extends StatelessWidget {
  const WorkDataStep({
    super.key,
    required this.emailController,
    required this.companyNameController,
    required this.dateController,
  });

  final TextEditingController emailController;
  final TextEditingController companyNameController;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email
        Text(
          "Work Email*",
          style: AppTextStyle.bodySm(),
        ),
        PaddingConfig.h8,
        CustomTextFormField(
          controller: emailController,
          labelText: "",
          validator: (p0) {
            if (p0 != null) {
              return null;
            } else {
              return TextStrings.fieldValidation;
            }
          },
        ),
        PaddingConfig.h16,
        // Company
        Text(
          "Company Name (optional)",
          style: AppTextStyle.bodySm(),
        ),
        PaddingConfig.h8,
        CustomTextFormField(
          controller: companyNameController,
          labelText: "",
          validator: (p0) {
            if (p0 != null) {
              return null;
            } else {
              return TextStrings.fieldValidation;
            }
          },
        ),
        PaddingConfig.h16,
        // Date
        Text(
          "When can we contract you?\nplease specify day and time",
          style: AppTextStyle.bodySm(),
        ),
        PaddingConfig.h8,
        CustomTextFormField(
          controller: dateController,
          labelText: "",
          validator: (p0) {
            if (p0 != null) {
              return null;
            } else {
              return TextStrings.fieldValidation;
            }
          },
        ),
        PaddingConfig.h16,
      ],
    );
  }
}

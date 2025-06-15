import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/images/fetch_image_circle.dart';
import 'package:two_website/core/widgets/textfield/custom_phone_number_textfield.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';

class ClientDataStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final String? imageB64;
  final Function(String? newImage) onImageUpdate;

  const ClientDataStep({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.imageB64,
    required this.onImageUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: FetchImageCircle(
            imageB64: imageB64,
            onUpdate: onImageUpdate,
          ),
        ),
        PaddingConfig.h16,
        Text("Full Name*", style: AppTextStyle.bodySm()),
        PaddingConfig.h8,
        CustomTextFormField(
          controller: nameController,
          labelText: "",
          validator: (p0) => p0 != null ? null : TextStrings.fieldValidation,
        ),
        PaddingConfig.h16,
        Text("Phone Number*", style: AppTextStyle.bodySm()),
        PaddingConfig.h8,
        CustomPhoneNumberField(phoneController: phoneController),
        PaddingConfig.h16,
      ],
    );
  }
}

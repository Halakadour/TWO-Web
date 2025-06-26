import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/textfield/custom_text_form_field.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/custom_choise_chip.dart';

class WorkDataStep extends StatelessWidget {
  const WorkDataStep({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.companyNameController,
    required this.selectedCooperationType,
    required this.dateController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController companyNameController;
  final ValueNotifier<String?> selectedCooperationType;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email
          Text(
            "${TextStrings.workEmail}*",
            style: AppTextStyle.bodySm(),
          ),
          PaddingConfig.h8,
          CustomTextFormField(
            controller: emailController,
            labelText: "",
            validator: (input) {
              if (input == null || input.trim().isEmpty) {
                return TextStrings.fieldValidation;
              } else {
                return null;
              }
            },
          ),
          PaddingConfig.h16,
          // Company
          Text(
            "${TextStrings.companyName} (${TextStrings.optional})",
            style: AppTextStyle.bodySm(),
          ),
          PaddingConfig.h8,
          CustomTextFormField(
            controller: companyNameController,
            labelText: "",
            validator: (input) {
              return null;
            },
          ),
          PaddingConfig.h16,
          // Cooperation Type
          Text("${TextStrings.cooperationType}*", style: AppTextStyle.bodySm()),
          PaddingConfig.h16,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(4, (index) {
              final labels = [
                TextStrings.analysisOnly,
                TextStrings.developmentOnly,
                TextStrings.completeProjectDevelopment,
                TextStrings.testOnly,
              ];
              return ValueListenableBuilder(
                valueListenable: selectedCooperationType,
                builder: (context, value, child) => CustomChoiceChip(
                  label: labels[index],
                  selected: selectedCooperationType.value == labels[index],
                  onSelected: () =>
                      selectedCooperationType.value = labels[index],
                ),
              );
            }),
          ),
          PaddingConfig.h16,
          // Date
          Text(
            TextStrings.whenWeCanContract,
            style: AppTextStyle.bodySm(),
          ),
          PaddingConfig.h8,
          CustomTextFormField(
            controller: dateController,
            labelText: "",
            validator: (input) {
              if (input == null || input.trim().isEmpty) {
                return TextStrings.fieldValidation;
              } else {
                return null;
              }
            },
          ),
          PaddingConfig.h16,
        ],
      ),
    );
  }
}

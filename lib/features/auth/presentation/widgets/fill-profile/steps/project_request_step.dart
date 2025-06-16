import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/textfield/custom_text_form_field.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/custom_choise_chip.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/fetch_cv_box.dart';

class ProjectRequestStep extends StatelessWidget {
  const ProjectRequestStep({
    super.key,
    required this.selectedProjectType,
    required this.selectedCost,
    required this.selectedDuration,
    required this.projectDescriptionController,
    required this.mainAxsesController,
    required this.fileB64,
  });

  final ValueNotifier<String?> selectedProjectType;
  final ValueNotifier<String?> selectedCost;
  final ValueNotifier<String?> selectedDuration;
  final TextEditingController projectDescriptionController;
  final TextEditingController mainAxsesController;
  final ValueNotifier<String?> fileB64;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaddingConfig.h16,
        Text("${TextStrings.projectType}*", style: AppTextStyle.bodySm()),
        PaddingConfig.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(5, (index) {
            final labels = [
              TextStrings.mobileApp,
              TextStrings.website,
              TextStrings.systemAnalysis,
              TextStrings.softwareTestings,
              TextStrings.maintain,
            ];
            return ValueListenableBuilder(
              valueListenable: selectedProjectType,
              builder: (context, value, child) => CustomChoiceChip(
                label: labels[index],
                selected: selectedProjectType.value == labels[index],
                onSelected: () => selectedProjectType.value = labels[index],
              ),
            );
          }),
        ),
        PaddingConfig.h24,
        Text("${TextStrings.projectDescription}*",
            style: AppTextStyle.bodySm()),
        PaddingConfig.h16,
        CustomTextFormField(
          controller: projectDescriptionController,
          maxLines: 4,
          labelText: "",
          validator: (p0) => p0 != null ? null : TextStrings.fieldValidation,
        ),
        PaddingConfig.h24,
        Text("${TextStrings.expectedCost}*", style: AppTextStyle.bodySm()),
        PaddingConfig.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(4, (index) {
            final labels = [
              "${TextStrings.lessThan} \$1000",
              "\$1000 - \$5000",
              "\$6000 - \$9000",
              "${TextStrings.moreThan} \$10000"
            ];
            return ValueListenableBuilder(
              valueListenable: selectedCost,
              builder: (context, value, child) => CustomChoiceChip(
                label: labels[index],
                selected: selectedCost.value == labels[index],
                onSelected: () => selectedCost.value = labels[index],
              ),
            );
          }),
        ),
        PaddingConfig.h24,
        Text("${TextStrings.expectedDuration}*", style: AppTextStyle.bodySm()),
        PaddingConfig.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(4, (index) {
            final labels = [
              "${TextStrings.lessThan} 2 ",
              "3 - 5 ${TextStrings.month}",
              "6 - 10 ${TextStrings.month}",
              "${TextStrings.moreThan} 1 ${TextStrings.year}"
            ];
            return ValueListenableBuilder(
              valueListenable: selectedDuration,
              builder: (context, value, child) => CustomChoiceChip(
                label: labels[index],
                selected: selectedDuration.value == labels[index],
                onSelected: () => selectedDuration.value = labels[index],
              ),
            );
          }),
        ),
        PaddingConfig.h24,
        Text(
          TextStrings.doYouPrepareDocumnet,
          style: AppTextStyle.bodySm(),
        ),
        PaddingConfig.h16,
        FetchCvBox(
          hasBorder: true,
          fileB64: fileB64.value,
          onUpdate: (newFile) {
            fileB64.value = newFile;
          },
        ),
        PaddingConfig.h24,
        Text(
          TextStrings.keyRequirment,
          style: AppTextStyle.bodySm(),
        ),
        PaddingConfig.h16,
        CustomTextFormField(
          controller: mainAxsesController,
          maxLines: 4,
          labelText: "",
          validator: (p0) => p0 != null ? null : TextStrings.fieldValidation,
        ),
        PaddingConfig.h16,
      ],
    );
  }
}

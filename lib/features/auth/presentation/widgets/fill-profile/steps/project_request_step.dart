import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';
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

  final ValueNotifier<int?> selectedProjectType;
  final ValueNotifier<int?> selectedCost;
  final ValueNotifier<int?> selectedDuration;
  final TextEditingController projectDescriptionController;
  final TextEditingController mainAxsesController;
  final ValueNotifier<String?> fileB64;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaddingConfig.h16,
        Text("Project Type*", style: AppTextStyle.bodySm()),
        PaddingConfig.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(5, (index) {
            final labels = [
              "Mobile App",
              "Website",
              "System Analysis",
              "Software Testings",
              "Maintain"
            ];
            return ValueListenableBuilder(
              valueListenable: selectedProjectType,
              builder: (context, value, child) => CustomChoiceChip(
                label: labels[index],
                selected: selectedProjectType.value == index,
                onSelected: () => selectedProjectType.value = index,
              ),
            );
          }),
        ),
        PaddingConfig.h24,
        Text("Project Description*", style: AppTextStyle.bodySm()),
        PaddingConfig.h16,
        CustomTextFormField(
          controller: projectDescriptionController,
          maxLines: 4,
          labelText: "",
          validator: (p0) => p0 != null ? null : TextStrings.fieldValidation,
        ),
        PaddingConfig.h24,
        Text("Expected Cost*", style: AppTextStyle.bodySm()),
        PaddingConfig.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(4, (index) {
            final labels = [
              "Less than \$1000",
              "\$1000 - \$5000",
              "\$6000 - \$9000",
              "More than \$10000"
            ];
            return ValueListenableBuilder(
              valueListenable: selectedCost,
              builder: (context, value, child) => CustomChoiceChip(
                label: labels[index],
                selected: selectedCost.value == index,
                onSelected: () => selectedCost.value = index,
              ),
            );
          }),
        ),
        PaddingConfig.h24,
        Text("Expected Duration*", style: AppTextStyle.bodySm()),
        PaddingConfig.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(4, (index) {
            final labels = [
              "Less than month",
              "from 3 - 5 months",
              "from 6 - 10 months",
              "More than 1 year"
            ];
            return ValueListenableBuilder(
              valueListenable: selectedDuration,
              builder: (context, value, child) => CustomChoiceChip(
                label: labels[index],
                selected: selectedDuration.value == index,
                onSelected: () => selectedDuration.value = index,
              ),
            );
          }),
        ),
        PaddingConfig.h24,
        Text(
          "Do you prepare any project document?\nif yes please upload it",
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
          "Key feature or requirement that the\nproject should include?",
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

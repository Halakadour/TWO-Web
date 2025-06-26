import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/textfield/custom_text_form_field.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/custom_choise_chip.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/fetch_cv_box.dart';

class ProjectRequestStep extends StatefulWidget {
  const ProjectRequestStep({
    super.key,
    required this.formKey,
    required this.selectedProjectType,
    required this.selectedCost,
    required this.selectedDuration,
    required this.projectDescriptionController,
    required this.mainAxsesController,
    required this.fileB64,
  });
  final GlobalKey<FormState> formKey;
  final ValueNotifier<String?> selectedProjectType;
  final ValueNotifier<String?> selectedCost;
  final ValueNotifier<String?> selectedDuration;
  final TextEditingController projectDescriptionController;
  final TextEditingController mainAxsesController;
  final ValueNotifier<String?> fileB64;

  @override
  State<ProjectRequestStep> createState() => _ProjectRequestStepState();
}

class _ProjectRequestStepState extends State<ProjectRequestStep> {
  final List<String> durations = [
    "${TextStrings.lessThan} 2 ",
    "3 - 5 ${TextStrings.month}",
    "6 - 10 ${TextStrings.month}",
    "${TextStrings.moreThan} 1 ${TextStrings.year}",
  ];

  final List<String> costs = [
    "${TextStrings.lessThan} \$1000",
    "\$1000 - \$5000",
    "\$6000 - \$9000",
    "${TextStrings.moreThan} \$10000"
  ];
  void _showAddCostDialog() async {
    String? customValue;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("أدخل كلفة مخصصة"),
          content: TextField(
            decoration: InputDecoration(
                hintText: "مثل : ${TextStrings.moreThan} \$50000 ",
                hintStyle:
                    AppTextStyle.bodySm(color: AppColors.fontLightColor)),
            onChanged: (value) => customValue = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("إلغاء"),
            ),
            ElevatedButton(
              onPressed: () {
                if (customValue != null && customValue!.trim().isNotEmpty) {
                  setState(() {
                    costs.add(customValue!);
                    widget.selectedCost.value = customValue!;
                  });
                }
                Navigator.pop(context);
              },
              child: Text(
                "إضافة",
                style: AppTextStyle.buttonStyle(color: AppColors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAddDurationDialog() async {
    String? customValue;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("أدخل مدة مخصصة"),
          content: TextField(
            decoration: InputDecoration(
                hintText: "مثل : 12 ${TextStrings.month}",
                hintStyle:
                    AppTextStyle.bodySm(color: AppColors.fontLightColor)),
            onChanged: (value) => customValue = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("إلغاء"),
            ),
            ElevatedButton(
              onPressed: () {
                if (customValue != null && customValue!.trim().isNotEmpty) {
                  setState(() {
                    durations.add(customValue!);
                    widget.selectedDuration.value = customValue!;
                  });
                }
                Navigator.pop(context);
              },
              child: Text(
                "إضافة",
                style: AppTextStyle.buttonStyle(color: AppColors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
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
                valueListenable: widget.selectedProjectType,
                builder: (context, value, child) => CustomChoiceChip(
                  label: labels[index],
                  selected: widget.selectedProjectType.value == labels[index],
                  onSelected: () =>
                      widget.selectedProjectType.value = labels[index],
                ),
              );
            }),
          ),
          PaddingConfig.h24,
          Text("${TextStrings.projectDescription}*",
              style: AppTextStyle.bodySm()),
          PaddingConfig.h16,
          CustomTextFormField(
            controller: widget.projectDescriptionController,
            maxLines: 4,
            labelText: "",
            validator: (input) {
              if (input == null || input.trim().isEmpty) {
                return TextStrings.fieldValidation;
              } else {
                return null;
              }
            },
          ),
          PaddingConfig.h24,
          Text("${TextStrings.expectedCost}*", style: AppTextStyle.bodySm()),
          PaddingConfig.h16,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...costs.map((label) {
                return ValueListenableBuilder<String?>(
                  valueListenable: widget.selectedCost,
                  builder: (context, value, child) => CustomChoiceChip(
                    label: label,
                    selected: widget.selectedCost.value == label,
                    onSelected: () => widget.selectedCost.value = label,
                  ),
                );
              }),
              CustomChoiceChip(
                label: "+",
                selected: false,
                onSelected: _showAddCostDialog,
              ),
            ],
          ),
          PaddingConfig.h24,
          Text("${TextStrings.expectedDuration}*",
              style: AppTextStyle.bodySm()),
          PaddingConfig.h16,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...durations.map((label) {
                return ValueListenableBuilder<String?>(
                  valueListenable: widget.selectedDuration,
                  builder: (context, value, child) => CustomChoiceChip(
                    label: label,
                    selected: widget.selectedDuration.value == label,
                    onSelected: () => widget.selectedDuration.value = label,
                  ),
                );
              }),
              CustomChoiceChip(
                label: "+",
                selected: false,
                onSelected: _showAddDurationDialog,
              ),
            ],
          ),
          PaddingConfig.h24,
          Text(
            TextStrings.doYouPrepareDocumnet,
            style: AppTextStyle.bodySm(),
          ),
          PaddingConfig.h16,
          FetchCvBox(
            hasBorder: true,
            fileB64: widget.fileB64.value,
            onUpdate: (newFile) {
              widget.fileB64.value = newFile;
            },
          ),
          PaddingConfig.h24,
          Text(
            TextStrings.keyRequirment,
            style: AppTextStyle.bodySm(),
          ),
          PaddingConfig.h16,
          CustomTextFormField(
            controller: widget.mainAxsesController,
            maxLines: 4,
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

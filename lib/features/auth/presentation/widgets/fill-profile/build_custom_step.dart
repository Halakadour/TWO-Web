import 'package:flutter/material.dart';
import 'package:two_website/config/theme/text_style.dart';

Step buildCustomStep(
    {required int currentStep,
    required int stepIndex,
    required String title,
    required Widget content,
    required Color? activeColor}) {
  return Step(
    title: Text(
      title,
      style: AppTextStyle.bodyMd(color: activeColor!),
    ),
    isActive: currentStep >= stepIndex,
    state: currentStep > stepIndex ? StepState.complete : StepState.indexed,
    content: content,
  );
}

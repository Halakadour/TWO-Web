import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_website/core/widgets/dialog/auth/forget_some_thing_dialog.dart';
import 'package:two_website/features/auth/presentation/widgets/order-project/build_custom_step.dart';
import 'package:two_website/features/auth/presentation/widgets/order-project/steps/project_request_step.dart';
import 'package:two_website/features/auth/presentation/widgets/order-project/steps/work_data_step.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';

class OrderProjectBody extends StatefulWidget {
  const OrderProjectBody({super.key});

  @override
  State<OrderProjectBody> createState() => _OrderProjectBodyState();
}

class _OrderProjectBodyState extends State<OrderProjectBody> {
  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(), // ProjectDataStep
    GlobalKey<FormState>(), // WorkDataStep
  ];

  late final TextEditingController _dateController;
  late final TextEditingController _projectDescriptionController;
  late final TextEditingController _requirementController;

  ValueNotifier<String?> fileB64 = ValueNotifier(null);

  ValueNotifier<int> currentStep = ValueNotifier(0);
  ValueNotifier<String?> selectedProjectType = ValueNotifier(null);
  ValueNotifier<String?> selectedDesription = ValueNotifier(null);
  ValueNotifier<List<String>> selectedKeyRequirements = ValueNotifier([]);
  final ValueNotifier<String?> selectedCooperationType = ValueNotifier(null);

  @override
  void initState() {
    _dateController = TextEditingController();
    _projectDescriptionController = TextEditingController();
    _requirementController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _projectDescriptionController.dispose();
    _requirementController.dispose();
    fileB64.dispose();
    currentStep.dispose();
    selectedProjectType.dispose();
    selectedDesription.dispose();
    selectedKeyRequirements.dispose();
    selectedCooperationType.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.orderProject,
          style: AppTextStyle.headerSm(),
        ),
        PaddingConfig.h16,
        ValueListenableBuilder(
          valueListenable: currentStep,
          builder: (context, value, child) {
            final isLastStep = currentStep.value == getSteps().length - 1;

            return Stepper(
              steps: getSteps(),
              currentStep: value,
              onStepContinue: () {
                if (formKeys[currentStep.value].currentState!.validate()) {
                  if (currentStep.value < getSteps().length - 1) {
                    if (currentStep.value == 0 &&
                        selectedProjectType.value == null) {
                      forgetSomeThingDialog(context, "project type");
                    } else if (currentStep.value == 0 &&
                        selectedDesription.value == null) {
                      forgetSomeThingDialog(context, "project Description");
                    } else if (currentStep.value == 0 &&
                        selectedKeyRequirements.value.isEmpty) {
                      forgetSomeThingDialog(context, "project Requiredment");
                    } else if (currentStep.value == 1 &&
                        selectedCooperationType.value == null) {
                      forgetSomeThingDialog(context, "coopertion type");
                    } else {
                      currentStep.value++;
                    }
                  } else {
                    context.read<LandingBloc>().add(
                          CreateProjectEvent(
                            type: selectedProjectType.value!,
                            description: selectedDesription.value!,
                            requirements: selectedKeyRequirements.value,
                            cooperationType: selectedCooperationType.value!,
                            document: fileB64.value,
                            contactTime: _dateController.text,
                          ),
                        );
                  }
                }
              },
              onStepCancel: () {
                currentStep.value == 0 ? null : currentStep.value--;
              },
              onStepTapped: (value) {
                currentStep.value = value;
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Row(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text(
                        isLastStep ? TextStrings.confirm : TextStrings.next,
                        style: AppTextStyle.buttonStyle(color: AppColors.white),
                      ),
                    ),
                    PaddingConfig.w16,
                    if (currentStep.value != 0)
                      CancelTextButton(
                        onPressed: details.onStepCancel,
                      )
                  ],
                );
              },
            );
          },
        ),
        PaddingConfig.h16,
      ],
    );
  }

  List<Step> getSteps() => [
        buildCustomStep(
          currentStep: currentStep.value,
          stepIndex: 0,
          title: TextStrings.projectRequest,
          activeColor: currentStep.value > 0
              ? AppColors.greenShade2
              : AppColors.fontLightColor,
          content: ProjectRequestStep(
            formKey: formKeys[0],
            selectedProjectType: selectedProjectType,
            selectedDesription: selectedDesription,
            selectedKeyRequirements: selectedKeyRequirements,
            projectDescriptionController: _projectDescriptionController,
            requirementController: _requirementController,
            fileB64: fileB64,
          ),
        ),
        buildCustomStep(
          currentStep: currentStep.value,
          stepIndex: 1,
          title: TextStrings.workData,
          activeColor: currentStep.value > 1
              ? AppColors.greenShade2
              : AppColors.fontLightColor,
          content: WorkDataStep(
            formKey: formKeys[1],
            selectedCooperationType: selectedCooperationType,
            dateController: _dateController,
          ),
        ),
      ];
}

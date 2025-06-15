import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/buttons/cancel_text_button.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/build_custom_step.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/steps/client_data_step.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/steps/project_request_step.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/steps/work_data_step.dart';
import 'package:two_website/features/landing/data/models/role_response_model.dart';

class FillProfileBody extends StatefulWidget {
  const FillProfileBody({super.key});

  @override
  State<FillProfileBody> createState() => _FillProfileBodyState();
}

class _FillProfileBodyState extends State<FillProfileBody> {
  //late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _companyNameController;
  late final TextEditingController _dateController;
  late final TextEditingController _projectDescriptionController;
  late final TextEditingController _mainAxsesController;

  ValueNotifier<RoleModel?> role = ValueNotifier(null);
  ValueNotifier<String?> imageB64 = ValueNotifier(null);
  ValueNotifier<String?> fileB64 = ValueNotifier(null);

  ValueNotifier<int> currentStep = ValueNotifier(0);
  ValueNotifier<int?> selectedProjectType = ValueNotifier(null);
  ValueNotifier<int?> selectedCost = ValueNotifier(null);
  ValueNotifier<int?> selectedDuration = ValueNotifier(null);
  List<int> selectedDurations = [];

  @override
  void initState() {
    //_formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _companyNameController = TextEditingController();
    _dateController = TextEditingController();
    _projectDescriptionController = TextEditingController();
    _mainAxsesController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    role.dispose();
    imageB64.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _companyNameController.dispose();
    _dateController.dispose();
    _projectDescriptionController.dispose();
    _mainAxsesController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.fillForm,
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
                if (!isLastStep) {
                  currentStep.value++;
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
                        isLastStep ? "Confirm" : "Next",
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
          title: "Client Data",
          activeColor: currentStep.value > 0
              ? AppColors.greenShade2
              : AppColors.fontLightColor,
          content: ClientDataStep(
            nameController: _nameController,
            phoneController: _phoneController,
            imageB64: imageB64.value,
            onImageUpdate: (newImage) => imageB64.value = newImage,
          ),
        ),
        buildCustomStep(
          currentStep: currentStep.value,
          stepIndex: 1,
          title: "Project Request",
          activeColor: currentStep.value > 1
              ? AppColors.greenShade2
              : AppColors.fontLightColor,
          content: ProjectRequestStep(
            selectedProjectType: selectedProjectType,
            selectedCost: selectedCost,
            selectedDuration: selectedDuration,
            projectDescriptionController: _projectDescriptionController,
            mainAxsesController: _mainAxsesController,
            fileB64: fileB64,
          ),
        ),
        buildCustomStep(
          currentStep: currentStep.value,
          stepIndex: 2,
          title: "Work Data",
          activeColor: currentStep.value > 2
              ? AppColors.greenShade2
              : AppColors.fontLightColor,
          content: WorkDataStep(
            emailController: _emailController,
            companyNameController: _companyNameController,
            dateController: _dateController,
          ),
        ),
      ];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_website/features/auth/data/datasources/auth_param.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/build_custom_step.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/steps/client_data_step.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/steps/project_request_step.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/steps/work_data_step.dart';

class FillClientProfileBody extends StatefulWidget {
  const FillClientProfileBody({super.key, required this.id});
  final String id;

  @override
  State<FillClientProfileBody> createState() => _FillClientProfileBodyState();
}

class _FillClientProfileBodyState extends State<FillClientProfileBody> {
  //late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _companyNameController;
  late final TextEditingController _dateController;
  late final TextEditingController _projectDescriptionController;
  late final TextEditingController _mainAxsesController;

  ValueNotifier<String?> imageB64 = ValueNotifier(null);
  ValueNotifier<String?> fileB64 = ValueNotifier(null);

  ValueNotifier<int> currentStep = ValueNotifier(0);
  ValueNotifier<String?> selectedProjectType = ValueNotifier(null);
  ValueNotifier<String?> selectedCost = ValueNotifier(null);
  ValueNotifier<String?> selectedDuration = ValueNotifier(null);
  final ValueNotifier<String?> selectedCooperationType = ValueNotifier(null);

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
                } else {
                  context.read<AuthRoleProfileBloc>().add(
                      UpdateClientProfileEvent(
                          param: UpdateClientProfileParam(
                              token: "token",
                              roleId: widget.id,
                              image: imageB64.value!,
                              fullName: _nameController.text,
                              companyName: _companyNameController.text,
                              workEmail: _emailController.text,
                              phoneNumber: _phoneController.text,
                              projectType: selectedProjectType.value!,
                              projectDescription: selectedDuration.value!,
                              projectCost: selectedCost.value!,
                              projectDuration: selectedDuration.value!,
                              projectRequirements:
                                  _projectDescriptionController.text,
                              documents: fileB64.value!,
                              cooperationType: selectedCooperationType.value!,
                              contractTime: _dateController.text,
                              visibilit: "0")));
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
          title: TextStrings.clientData,
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
          title: TextStrings.projectRequest,
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
          title: TextStrings.workData,
          activeColor: currentStep.value > 2
              ? AppColors.greenShade2
              : AppColors.fontLightColor,
          content: WorkDataStep(
            emailController: _emailController,
            companyNameController: _companyNameController,
            selectedCooperationType: selectedCooperationType,
            dateController: _dateController,
          ),
        ),
      ];
}

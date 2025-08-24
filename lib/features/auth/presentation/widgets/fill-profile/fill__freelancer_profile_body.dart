import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/images/fetch_image_circle.dart';
import 'package:two_website/core/widgets/textfield/custom_phone_number_textfield.dart';
import 'package:two_website/features/auth/data/models/role_response_model.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/fetch_cv_box.dart';

class FillFreelancerProfileBody extends StatefulWidget {
  const FillFreelancerProfileBody({super.key, required this.id});
  final String id;

  @override
  State<FillFreelancerProfileBody> createState() =>
      _FillFreelancerProfileBodyState();
}

class _FillFreelancerProfileBodyState extends State<FillFreelancerProfileBody> {
  ValueNotifier<RoleModel?> role = ValueNotifier(null);
  ValueNotifier<String?> imageB64 = ValueNotifier(null);
  ValueNotifier<String?> fileB64 = ValueNotifier(null);
  TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    role.dispose();
    imageB64.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextStrings.fillProfile,
          style: AppTextStyle.headerSm(),
        ),
        PaddingConfig.h16,
        // Image
        Align(
          alignment: Alignment.center,
          child: FetchImageCircle(
            imageB64: imageB64.value,
            onUpdate: (newImage) => imageB64.value = newImage,
          ),
        ),
        PaddingConfig.h16,
        // Phone Number
        Text("${TextStrings.phoneNumber}*", style: AppTextStyle.bodySm()),
        PaddingConfig.h8,
        CustomPhoneNumberField(
          phoneController: phoneController,
          validator: (input) {
            if (input == null || input.number.trim().isEmpty) {
              return TextStrings.fieldValidation;
            } else {
              return null;
            }
          },
        ),
        PaddingConfig.h16,
        Text("${TextStrings.addCV}*", style: AppTextStyle.bodySm()),
        PaddingConfig.h8,
        FetchCvBox(
          fileB64: fileB64.value,
          onUpdate: (newFile) => fileB64.value = newFile,
        ),
        PaddingConfig.h16,
        ElevatedButton(
          onPressed: () {
            context.read<AuthRoleProfileBloc>().add(
                UpdateFreelancerProfileEvent(
                    image: imageB64.value!,
                    roleId: widget.id,
                    phoneNumber: phoneController.text));
          },
          child: Text(
            TextStrings.confirm,
            style: AppTextStyle.buttonStyle(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}

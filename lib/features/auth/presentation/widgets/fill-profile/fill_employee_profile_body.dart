// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/dropdown/custom_dropdown_list_for_role_model.dart';
import 'package:two_website/core/widgets/images/fetch_image_circle.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/core/widgets/shimmers/dropdown-loading/custom_dropdown_loading.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
import 'package:two_website/features/auth/presentation/widgets/fill-profile/fetch_cv_box.dart';
import 'package:two_website/features/landing/data/models/role_response_model.dart';

class FillEmployeeProfileBody extends StatefulWidget {
  const FillEmployeeProfileBody({super.key});

  @override
  State<FillEmployeeProfileBody> createState() =>
      _FillEmployeeProfileBodyState();
}

class _FillEmployeeProfileBodyState extends State<FillEmployeeProfileBody> {
  RoleModel? role;
  String? imageB64;
  String? cvB64;

  void updateImageBytes(String? base64) {
    setState(() {
      imageB64 = base64;
    });
  }

  void updateCVBytes(String? base64) {
    setState(() {
      cvB64 = base64;
    });
  }

  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(GetRolesWithoutClientEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          TextStrings.fillProfile,
          style: AppTextStyle.subtitle01(),
        ),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        FetchImageCircle(imageB64: imageB64, onUpdate: updateImageBytes),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Job Title",
            style: AppTextStyle.subtitle03(),
          ),
        ),
        PaddingConfig.h8,
        BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
          buildWhen: (previous, current) =>
              (previous.roleWithoutClientListStatus !=
                  current.roleWithoutClientListStatus),
          builder: (context, state) {
            return rolesListStateHandling(state);
          },
        ),
        PaddingConfig.h16,
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "CV File",
            style: AppTextStyle.subtitle03(),
          ),
        ),
        PaddingConfig.h8,
        if (!(role != null &&
            (role!.role.contains("freelancer") || role!.role.contains("user"))))
          FetchCvBox(fileB64: cvB64, onUpdate: updateCVBytes),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        SizedBox(
          width: double.infinity,
          child: CustomCartoonButton(
            title: TextStrings.tcontinue,
            onTap: () {
              if (imageB64 == null) {
                CustomQuickAlert().addImageAlert(context);
              } else if (role == null) {
                CustomQuickAlert().addRoleAlert(context);
              } else if (role!.role.contains("freelancer")) {
                context.read<AuthRoleProfileBloc>().add(
                    UpdateFreelancerProfileEvent(
                        image: imageB64!, roleId: role!.id));
              } else if (role!.role.contains("user")) {
                context.read<AuthRoleProfileBloc>().add(UpdateGuestProfileEvent(
                    image: imageB64!, roleId: role!.id));
              } else {
                if (cvB64 == null) {
                  CustomQuickAlert().addImageAlert(context);
                } else {
                  context.read<AuthRoleProfileBloc>().add(
                      UpdateEmployeeProfileEvent(
                          image: imageB64!, cv: cvB64!, roleId: role!.id));
                }
              }
            },
          ),
        ),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
      ],
    );
  }

  Widget rolesListStateHandling(AuthRoleProfileState state) {
    if (state.roleWithoutClientListStatus == CasualStatus.success) {
      return CustomDropdownListForRoleModel(
          selectYour: "job",
          value: role,
          items: state.roleWithoutClientList.map(
            (role) {
              return DropdownMenuItem(
                value: role,
                child: Text(role.role),
              );
            },
          ).toList(),
          onChanged: (value) {
            setState(() {
              role = value;
            });
          });
    } else if (state.roleWithoutClientListStatus == CasualStatus.loading) {
      return const CustomDropdownLoading();
    } else if (state.roleWithoutClientListStatus == CasualStatus.failure) {
      return const Text("No Roles");
    } else {
      return const SizedBox();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
import 'package:two_website/core/widgets/dropdown/custom_dropdown_list_for_role_model.dart';
import 'package:two_website/core/widgets/images/fetch_image_circle.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/core/widgets/shimmers/dropdown-loading/custom_dropdown_loading.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_website/features/landing/data/models/role_response_model.dart';

class FillProfileBody extends StatefulWidget {
  const FillProfileBody({super.key});

  @override
  State<FillProfileBody> createState() => _FillProfileBodyState();
}

class _FillProfileBodyState extends State<FillProfileBody> {
  RoleModel? role;
  String? imageB64;

  void updateImageBytes(String? base64) {
    setState(() {
      imageB64 = base64;
    });
  }

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _subjectController;
  late final TextEditingController _phoneController;
  late final TextEditingController _messageController;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _subjectController = TextEditingController();
    _phoneController = TextEditingController();
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(GetRolesEvent());
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
            "User Type",
            style: AppTextStyle.subtitle03(color: AppColors.fontLightColor),
          ),
        ),
        PaddingConfig.h8,
        BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
          buildWhen: (previous, current) =>
              (previous.roleListStatus != current.roleListStatus),
          builder: (context, state) {
            return rolesListStateHandling(state);
          },
        ),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        if (role != null && role!.role.contains("client"))
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "For Client",
              style: AppTextStyle.subtitle03(color: AppColors.fontLightColor),
            ),
          ),
        PaddingConfig.h16,
        if (role != null && role!.role.contains("client"))
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                    controller: _subjectController,
                    labelText: "subject",
                    validator: (p0) {
                      if (p0 != null) {
                        return null;
                      } else {
                        return TextStrings.fieldValidation;
                      }
                    },
                    style: AppTextStyle.subtitle02(
                        color: AppColors.fontLightColor),
                    filled: true,
                    fillColor: AppColors.fieldColor,
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(SizesConfig.borderRadiusMd),
                        borderSide: BorderSide.none)),
                PaddingConfig.h16,
                IntlPhoneField(
                  controller: _phoneController,
                  dropdownTextStyle:
                      AppTextStyle.subtitle02(color: AppColors.fontLightColor),
                  initialCountryCode: 'SY',
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.fieldColor,
                      labelText: "Phone Number",
                      labelStyle: AppTextStyle.subtitle02(
                          color: AppColors.fontLightColor),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(SizesConfig.borderRadiusMd),
                          borderSide: BorderSide.none)),
                ),
                PaddingConfig.h8,
                CustomTextFormField(
                  maxLines: 6,
                  style:
                      AppTextStyle.subtitle02(color: AppColors.fontLightColor),
                  filled: true,
                  fillColor: AppColors.fieldColor,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizesConfig.borderRadiusMd),
                      borderSide: BorderSide.none),
                  labelText: 'Message',
                  controller: _messageController,
                  validator: (p0) {
                    if (p0 != null) {
                      return null;
                    } else {
                      return TextStrings.fieldValidation;
                    }
                  },
                ),
                PaddingConfig.h24,
                SizedBox(
                  width: double.infinity,
                  child: CustomCartoonButton(
                    title: TextStrings.tcontinue,
                    onTap: () {
                      if (imageB64 == null) {
                        CustomQuickAlert().addImageAlert(context);
                      } else if (role == null) {
                        CustomQuickAlert().addRoleAlert(context);
                      } else {
                        context.read<AuthRoleProfileBloc>().add(
                            UpdateClientProfileEvent(
                                image: imageB64!,
                                roleId: role!.id,
                                subject: _subjectController.text,
                                description: _messageController.text,
                                phone: _phoneController.text));
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: SizesConfig.spaceBtwItems,
                ),
              ],
            ),
          ),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        if (role != null && role!.role.contains("free"))
          SizedBox(
            width: double.infinity,
            child: CustomCartoonButton(
              title: TextStrings.tcontinue,
              onTap: () {
                if (imageB64 == null) {
                  CustomQuickAlert().addImageAlert(context);
                } else if (role == null) {
                  CustomQuickAlert().addRoleAlert(context);
                } else {
                  context.read<AuthRoleProfileBloc>().add(
                      UpdateFreelancerProfileEvent(
                          image: imageB64!, roleId: role!.id));
                }
              },
            ),
          ),
      ],
    );
  }

  Widget rolesListStateHandling(AuthRoleProfileState state) {
    if (state.roleListStatus == CasualStatus.success) {
      return CustomDropdownListForRoleModel(
        selectYour: "job",
        value: role,
        items: state.roleList.map(
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
        },
      );
    } else if (state.roleListStatus == CasualStatus.loading) {
      return const CustomDropdownLoading();
    } else if (state.roleListStatus == CasualStatus.failure) {
      return const Text("No Roles");
    } else {
      return const SizedBox();
    }
  }
}

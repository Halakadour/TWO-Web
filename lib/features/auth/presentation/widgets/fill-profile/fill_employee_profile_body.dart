// ignore_for_file: deprecated_member_use

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/dropdown/custom_dropdown_list_for_role_model.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/core/widgets/shimmers/dropdown-loading/custom_dropdown_loading.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';

class FillEmployeeProfileBody extends StatefulWidget {
  const FillEmployeeProfileBody({super.key});

  @override
  State<FillEmployeeProfileBody> createState() =>
      _FillEmployeeProfileBodyState();
}

class _FillEmployeeProfileBodyState extends State<FillEmployeeProfileBody> {
  RoleModel? role;
  Uint8List? imageBytes;
  Uint8List? cvBytes;
  ValueNotifier<bool> isHover = ValueNotifier(false);

  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(GetRolesWithoutClientEvent());
    super.didChangeDependencies();
  }

  Future<void> _getCVFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() async {
        cvBytes = await result.files.first.xFile.readAsBytes();
      });
    }
  }

  Future<void> _getImageFile() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (value) {
        if (value != null) {
          setState(() async {
            imageBytes = await value.readAsBytes();
          });
        }
      },
    );
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
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
                width: 130,
                height: 130,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.fieldColor,
                ),
                child: imageBytes != null
                    ? Image.memory(
                        imageBytes!,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Iconsax.image)),
            IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: AppColors.greenShade3,
                    padding: const EdgeInsets.all(10),
                    shape: const CircleBorder()),
                onPressed: () {
                  _getImageFile();
                },
                icon: const Icon(
                  Iconsax.camera,
                  color: AppColors.white,
                ))
          ],
        ),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
          buildWhen: (previous, current) =>
              (previous.roleWithoutClientListStatus !=
                  current.roleWithoutClientListStatus),
          builder: (context, state) {
            return rolesListStateHandling(state);
          },
        ),
        PaddingConfig.h16,
        if (!(role != null &&
            (role!.role.contains("freelancer") || role!.role.contains("user"))))
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: AppColors.fieldColor,
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "CV File",
                      style: AppTextStyle.subtitle03(
                          color: AppColors.fontLightColor),
                    ),
                  ],
                ),
                PaddingConfig.h16,
                InkWell(
                  onTap: () async {
                    _getCVFile();
                  },
                  child: SvgPicture.asset(
                    IconsPath.upload,
                    width: 20,
                    color: AppColors.greenShade2,
                  ),
                ),
                Text(
                  cvBytes != null ? "Cv Selected" : "select or drop a file",
                  style: AppTextStyle.subtitle03(color: AppColors.greenShade2),
                ),
              ],
            ),
          ),
        const SizedBox(
          height: SizesConfig.spaceBtwItems,
        ),
        SizedBox(
          width: double.infinity,
          child: CustomCartoonButton(
            title: TextStrings.tcontinue,
            onTap: () {
              if (imageBytes == null) {
                CustomQuickAlert().addImageAlert(context);
              } else if (cvBytes == null) {
                CustomQuickAlert().addCvAlert(context);
              } else if (role == null) {
                CustomQuickAlert().addRoleAlert(context);
              } else {
                context.read<AuthRoleProfileBloc>().add(
                    UpdateEmployeeProfileEvent(
                        image: imageBytes!, cv: cvBytes!, roleId: role!.id));
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

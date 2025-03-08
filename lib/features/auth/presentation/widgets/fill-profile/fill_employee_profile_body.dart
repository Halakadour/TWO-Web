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
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/core/widgets/layouts/buttons/custom_cartoon_button.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';

class FillEmployeeProfileBody extends StatefulWidget {
  const FillEmployeeProfileBody({super.key});

  @override
  State<FillEmployeeProfileBody> createState() =>
      _FillEmployeeProfileBodyState();
}

class _FillEmployeeProfileBodyState extends State<FillEmployeeProfileBody> {
  RoleModel? selectedItem;
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
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: AppColors.fieldColor,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              SvgPicture.asset(
                IconsPath.work,
                width: 20,
              ),
              PaddingConfig.w24,
              BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
                buildWhen: (previous, current) =>
                    (previous.roleWithoutClientListStatus !=
                        current.roleWithoutClientListStatus),
                builder: (context, state) {
                  if (state.roleWithoutClientListStatus ==
                      CasualStatus.success) {
                    return DropdownButton<RoleModel>(
                      value: selectedItem,
                      underline: const SizedBox(),
                      focusColor: AppColors.fieldColor,
                      elevation: 0,
                      hint: Text(
                        "select your role",
                        style: AppTextStyle.subtitle03(
                            color: AppColors.fontDarkColor),
                      ),
                      dropdownColor: AppColors.fieldColor,
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
                          selectedItem = value;
                        });
                      },
                    );
                  } else if (state.roleWithoutClientListStatus ==
                      CasualStatus.loading) {
                    return const CircularProgressIndicator();
                  } else if (state.roleWithoutClientListStatus ==
                      CasualStatus.failure) {
                    return const Text("No Roles");
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
        PaddingConfig.h16,
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
                  SvgPicture.asset(
                    IconsPath.decument,
                    width: 20,
                  ),
                  PaddingConfig.w24,
                  Text(
                    "CV",
                    style:
                        AppTextStyle.subtitle03(color: AppColors.fontDarkColor),
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
              } else if (selectedItem == null) {
                CustomQuickAlert().addRoleAlert(context);
              } else {
                context.read<AuthRoleProfileBloc>().add(
                    UpdateEmployeeProfileEvent(
                        image: imageBytes!,
                        cv: cvBytes!,
                        roleId: selectedItem!.id));
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
}

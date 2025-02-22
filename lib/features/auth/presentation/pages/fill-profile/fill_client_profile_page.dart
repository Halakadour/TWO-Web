// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/templates/page_Template.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';

import '../../../../../core/network/enums.dart';

class FillClientProfilePage extends StatefulWidget {
  const FillClientProfilePage({super.key});

  @override
  State<FillClientProfilePage> createState() => _FillProfilePageState();
}

class _FillProfilePageState extends State<FillClientProfilePage> {
  RoleModel? selectedItem;
  PlatformFile? imageFile;
  Uint8List? imageBytes; // Store image data in memory

  ValueNotifier<bool> isHover = ValueNotifier(false);

  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(GetRolesEvent());
    super.didChangeDependencies();
  }

  Future<void> _getImageFile() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (value) {
        if (value != null) {
          setState(() async {
            imageFile = PlatformFile(
                name: value.name, size: value.hashCode, path: value.path);
            imageBytes = await value.readAsBytes();
          });
        }
      },
    );
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   type: FileType.image,
    //   allowMultiple: false,
    //   withData: true,
    // );

    // if (result != null && result.files.isNotEmpty) {
    //   if (result.files.first.bytes != null) {
    //     setState(() {
    //       imageFile = result.files.first;
    //       imageBytes = result.files.first.bytes;
    //     });
    //   } else {
    //     print("File picked, but bytes are null");
    //   }
    // } else {
    //   print("No file selected");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTemplate(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grayColor, width: 1),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                            : Padding(
                                padding: const EdgeInsets.all(20),
                                child: SvgPicture.asset(
                                  IconsPath.image,
                                  // ignore: deprecated_member_use
                                  color: AppColors.fontLightColor,
                                ),
                              ),
                      ),
                      InkWell(
                        onTap: () async {
                          _getImageFile();
                        },
                        child: SvgPicture.asset(
                          IconsPath.editPen,
                          width: 40,
                        ),
                      )
                    ],
                  ),
                  PaddingConfig.h50,
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.fieldColor,
                        borderRadius: BorderRadius.circular(12)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          IconsPath.work,
                          width: 20,
                        ),
                        PaddingConfig.w20,
                        BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
                          buildWhen: (previous, current) =>
                              (previous.roleListStatus !=
                                  current.roleListStatus),
                          builder: (context, state) {
                            if (state.roleListStatus == CasualStatus.success) {
                              print("Success");
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
                                    selectedItem = value;
                                  });
                                },
                              );
                            } else if (state.roleListStatus ==
                                CasualStatus.loading) {
                              print("Loading");
                              return const CircularProgressIndicator();
                            } else if (state.roleListStatus ==
                                CasualStatus.failure) {
                              print(state.message);
                              return const Text("ToT");
                            } else {
                              return const SizedBox();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  PaddingConfig.h20,
                ],
              ),
            ),
          ),
          PaddingConfig.h20,
          BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
            listener: (context, state) {
              if (state.updateClientProfileStatus == CasualStatus.loading) {
                CustomQuickAlert().loadingAlert(context);
              } else if (state.updateClientProfileStatus ==
                  CasualStatus.success) {
                context.pop();
                context.pushReplacementNamed(AppRouteConfig.main);
              } else if (state.updateClientProfileStatus ==
                  CasualStatus.failure) {
                context.pop();
                print(state.message);
                CustomQuickAlert().failureAlert(context, state.message);
              }
            },
            listenWhen: (previous, current) {
              return (previous.updateClientProfileStatus !=
                      current.updateClientProfileStatus ||
                  previous.updateEmployeeProfileStatus !=
                      current.updateEmployeeProfileStatus);
            },
            child: CustomCartoonButton(
              isHover: isHover,
              title: "Apply",
              onTap: () {
                print(selectedItem!.id);
                print(selectedItem!.role);
                print(imageFile);
                if (imageBytes == null) {
                  CustomQuickAlert().addImageAlert(context);
                } else if (selectedItem == null) {
                  CustomQuickAlert().addRoleAlert(context);
                } else {
                  print(selectedItem!.id);
                  print(selectedItem!.role);
                  context.read<AuthRoleProfileBloc>().add(
                      UpdateClientProfileEvent(
                          image: imageBytes!, roleId: selectedItem!.id));
                }
              },
            ),
          )
        ],
      )),
    );
  }
}

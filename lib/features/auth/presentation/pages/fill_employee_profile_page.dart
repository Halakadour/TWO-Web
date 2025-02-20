// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/templates/centerd_view.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_website/features/auth/presentation/widgets/profile_conainer.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';

import '../../../../core/network/enums.dart';

class FillEmployeeProfilePage extends StatefulWidget {
  const FillEmployeeProfilePage({super.key});

  @override
  State<FillEmployeeProfilePage> createState() => _FillProfilePageState();
}

class _FillProfilePageState extends State<FillEmployeeProfilePage> {
  RoleModel? selectedItem;
  File? imageFile;
  File? cvFile;
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
      final cvPath = result.files.first.path;
      if (cvPath != null) {
        setState(() {
          cvFile = File(cvPath);
        });
      }
    } else {
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenterdView(
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
                  ProfileConainer(
                    imageFile: imageFile,
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
                              (previous.roleWithoutClientListStatus !=
                                  current.roleWithoutClientListStatus),
                          builder: (context, state) {
                            if (state.roleWithoutClientListStatus ==
                                CasualStatus.success) {
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
                              print("Loading");
                              return const CircularProgressIndicator();
                            } else if (state.roleWithoutClientListStatus ==
                                CasualStatus.failure) {
                              print(state.message);
                              return const Text("No Roles");
                            } else {
                              return const SizedBox();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  PaddingConfig.h20,
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.fieldColor,
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              IconsPath.decument,
                              width: 20,
                            ),
                            PaddingConfig.w20,
                            Text(
                              "CV",
                              style: AppTextStyle.subtitle03(
                                  color: AppColors.fontDarkColor),
                            ),
                          ],
                        ),
                        PaddingConfig.h20,
                        InkWell(
                          onTap: () async {
                            _getCVFile();
                          },
                          child: SvgPicture.asset(
                            IconsPath.upload,
                            width: 20,
                            color: AppColors.greenColor,
                          ),
                        ),
                        Text(
                          cvFile != null
                              ? cvFile!.path
                              : "select or drop a file",
                          style: AppTextStyle.subtitle03(
                              color: AppColors.greenColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PaddingConfig.h20,
          BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
            listener: (context, state) {
              if (state.updateEmployeeProfileStatus == CasualStatus.loading) {
                const CircularProgressIndicator();
              } else if (state.updateEmployeeProfileStatus ==
                  CasualStatus.success) {
                QuickAlert.show(
                    context: context, type: QuickAlertType.success, width: 300);

                context.pushReplacementNamed(AppRouteConfig.main);
              } else if (state.updateEmployeeProfileStatus ==
                  CasualStatus.failure) {
                QuickAlert.show(
                    context: context, type: QuickAlertType.error, width: 300);
              }
            },
            listenWhen: (previous, current) {
              return (previous.updateEmployeeProfileStatus !=
                  current.updateEmployeeProfileStatus);
            },
            child: CustomCartoonButton(
              isHover: isHover,
              title: "Apply",
              onTap: () {
                if (imageFile == null) {
                  CustomQuickAlert().addImageAlert(context);
                } else if (selectedItem == null) {
                  CustomQuickAlert().addRoleAlert(context);
                } else if (cvFile == null) {
                  CustomQuickAlert().addCvAlert(context);
                } else {
                  context.read<AuthRoleProfileBloc>().add(
                      UpdateEmployeeProfileEvent(
                          image: imageFile!,
                          cv: cvFile!,
                          roleId: selectedItem!.id));
                }
              },
            ),
          )
        ],
      )),
    );
  }
}

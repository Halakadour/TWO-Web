import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/paths/assets_path.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/centerd_view.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';

import '../../../../core/network/enum_status.dart';

class FillClientProfilePage extends StatefulWidget {
  const FillClientProfilePage({super.key});

  @override
  State<FillClientProfilePage> createState() => _FillProfilePageState();
}

class _FillProfilePageState extends State<FillClientProfilePage> {
  RoleModel? selectedItem;
  File? imageFile;

  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(GetRolesEvent());
    super.didChangeDependencies();
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
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.fieldColor),
                        child: imageFile != null
                            ? Image.network(
                                imageFile!.name,
                                fit: BoxFit.cover,
                              )
                            : Padding(
                                padding: const EdgeInsets.all(20),
                                child: SvgPicture.asset(
                                  IconsPath.image,
                                  color: AppColors.fontLightColor,
                                ),
                              ),
                      ),
                      InkWell(
                        onTap: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.image,
                            allowMultiple: false,
                          );

                          if (result != null && result.files.isNotEmpty) {
                            final filePath = result.files.first.path;
                            if (filePath != null) {
                              setState(() {
                                imageFile = File(filePath.codeUnits, filePath);
                              });
                            }
                          } else {
                            print("No file selected");
                          }
                        },
                        child: SvgPicture.asset(
                          IconsPath.editPen,
                          width: 40,
                        ),
                      )
                    ],
                  ),
                  h50,
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
                        w20,
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
                  h20,
                ],
              ),
            ),
          ),
          h20,
          BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
            listener: (context, state) {
              if (state.updateEmployeeProfileStatus == CasualStatus.loading ||
                  state.updateClientProfileStatus == CasualStatus.loading) {
                const CircularProgressIndicator();
              } else if (state.updateEmployeeProfileStatus ==
                      CasualStatus.success ||
                  state.updateClientProfileStatus == CasualStatus.success) {
                QuickAlert.show(
                    context: context, type: QuickAlertType.success, width: 300);

                context.pushReplacementNamed(AppRouteConfig.main);
              } else if (state.updateEmployeeProfileStatus ==
                      CasualStatus.failure ||
                  state.updateClientProfileStatus == CasualStatus.failure) {
                QuickAlert.show(
                    context: context, type: QuickAlertType.error, width: 300);
              }
            },
            listenWhen: (previous, current) {
              return (previous.updateClientProfileStatus !=
                      current.updateClientProfileStatus ||
                  previous.updateEmployeeProfileStatus !=
                      current.updateEmployeeProfileStatus);
            },
            child: CustomCartoonButton(
              isHovered: true,
              title: "Apply",
              onTap: () {
                print(selectedItem!.id);
                print(selectedItem!.role);
                print(imageFile);
                // if (imageFile == null) {
                //   QuickAlert.show(
                //       context: context,
                //       type: QuickAlertType.warning,
                //       title: "Please add the image",
                //       width: 300);
                // } else if (selectedItem == null) {
                //   QuickAlert.show(
                //       context: context,
                //       type: QuickAlertType.warning,
                //       title: "Please add the role",
                //       width: 300);
                // } else {
                //   context.read<AuthRoleProfileBloc>().add(
                //       UpdateClientProfileEvent(
                //           image: imageFile!, roleId: selectedItem!.id));
                // }
              },
            ),
          )
        ],
      )),
    );
  }
}

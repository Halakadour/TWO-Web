import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/paths/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/centerd_view.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_website/features/landing/presentation/widgets/two_details/custom_cartoon_button.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';

import '../../../../core/network/enum_status.dart';

class FillProfilePage extends StatefulWidget {
  const FillProfilePage({super.key});

  @override
  State<FillProfilePage> createState() => _FillProfilePageState();
}

class _FillProfilePageState extends State<FillProfilePage> {
  List<RoleModel> items = [
    RoleModel(id: 1, role: "Client"),
    RoleModel(id: 2, role: "Prgrammer")
  ];
  RoleModel? selectedItem;
  String userType = "Client";

  @override
  void didChangeDependencies() {
    //context.read<AuthBloc>().add(GetRolesWithoutClientEvent());
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
          Container(
            width: 500,
            height: 500,
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
                      width: 110,
                      height: 110,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.fieldColor),
                      child: SvgPicture.asset(
                        IconsPath.profile,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SvgPicture.asset(
                      IconsPath.editPen,
                      width: 30,
                    )
                  ],
                ),
                h20,
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.fieldColor,
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Type :",
                        style: AppTextStyle.subtitle03(
                            color: AppColors.fontDarkColor),
                      ),
                      h20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Radio<String>(
                                value: "Employee",
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              w10,
                              Text(
                                "Employee",
                                style: AppTextStyle.subtitle03(
                                    color: AppColors.fontDarkColor),
                              ),
                            ],
                          ),
                          w30,
                          Row(
                            children: [
                              Radio<String>(
                                value: "Client",
                                groupValue: userType,
                                onChanged: (value) {
                                  setState(() {
                                    userType = value!;
                                  });
                                },
                              ),
                              w10,
                              Text(
                                "Client",
                                style: AppTextStyle.subtitle03(
                                    color: AppColors.fontDarkColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                h20,
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
                            previous.roleListStatus != current.roleListStatus,
                        builder: (context, state) {
                          if (state.roleListStatus == CasualStatus.success) {
                            print("Success");
                            return DropdownButton<RoleModel>(
                              value: selectedItem,
                              underline: const SizedBox(),
                              focusColor: AppColors.whiteColor,
                              elevation: 0,
                              hint: Text(
                                "select your role",
                                style: AppTextStyle.subtitle03(
                                    color: AppColors.fontDarkColor),
                              ),
                              dropdownColor: AppColors.whiteColor,
                              items: (userType == "Client")
                                  ? state.roleList.map(
                                      (role) {
                                        return DropdownMenuItem(
                                          value: role,
                                          child: Text(role.role),
                                        );
                                      },
                                    ).toList()
                                  : state.roleList.map(
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
                if (userType != "Client")
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.fieldColor,
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          IconsPath.decument,
                          width: 20,
                        ),
                        w20,
                        Text(
                          "CV",
                          style: AppTextStyle.subtitle03(
                              color: AppColors.fontDarkColor),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          h20,
          const CustomCartoonButton(isHovered: true, title: "Apply")
        ],
      )),
    );
  }
}

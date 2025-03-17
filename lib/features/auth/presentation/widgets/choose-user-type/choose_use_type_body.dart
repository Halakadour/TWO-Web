import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
import 'package:two_website/core/widgets/dropdown/custom_dropdown_list.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/roles/data/models/role_response_model.dart';

class ChooseUseTypeBody extends StatefulWidget {
  const ChooseUseTypeBody({super.key});

  @override
  State<ChooseUseTypeBody> createState() => _ChooseUseTypeBodyState();
}

class _ChooseUseTypeBodyState extends State<ChooseUseTypeBody> {
  String? userType;
  List<String> userTypeList = [
    TextStrings.client,
    TextStrings.other,
  ];
  RoleModel? role;
  List<RoleModel> rolesList = [];

  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(GetRolesWithoutClientEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Header
        SizedBox(
            width: 200, height: 200, child: Lottie.asset(JsonPath.success)),
        PaddingConfig.h8,
        Text(
          TextStrings.signUpSuccessfully,
          style: AppTextStyle.subtitle01(color: AppColors.greenShade2),
        ),
        const SizedBox(
          height: SizesConfig.md,
        ),
        Text(TextStrings.chooseType,
            style: AppTextStyle.subtitle02(color: AppColors.fontLightColor)),
        const SizedBox(
          height: SizesConfig.spaceBtwSections,
        ),
        // Type buttons
        CustomDropdownList(
            selectYour: "Type",
            value: userType,
            items: userTypeList.map(
              (type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                userType = value;
              });
            }),
        const SizedBox(
          height: SizesConfig.lg,
        ),
        const SizedBox(
          height: SizesConfig.lg,
        ),
        CustomCartoonButton(
          title: "Next",
          width: double.infinity,
          onTap: () {
            if (userType == TextStrings.client) {
              context.pushNamed(AppRouteConfig.fillClientProfile);
            } else {
              context.pushNamed(AppRouteConfig.fillEmployeeProfile);
            }
          },
        )
      ],
    );
  }
}

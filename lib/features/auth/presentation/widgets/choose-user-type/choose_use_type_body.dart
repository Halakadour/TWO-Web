import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/functions/bloc-state-handling/auth_state_handling.dart';
import 'package:two_website/core/widgets/animation/success_status_animation.dart';
import 'package:two_website/core/widgets/buttons/custom_cartoon_button.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/data/models/role_response_model.dart';

class ChooseUseTypeBody extends StatefulWidget {
  const ChooseUseTypeBody({super.key});

  @override
  State<ChooseUseTypeBody> createState() => _ChooseUseTypeBodyState();
}

class _ChooseUseTypeBodyState extends State<ChooseUseTypeBody> {
  ValueNotifier<RoleModel?> selectedRole = ValueNotifier(null);
  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(GetRolesEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Header
        const SuccessStatusAnimation(),
        PaddingConfig.h8,
        Text(
          TextStrings.signUpSuccessfully,
          style: AppTextStyle.bodyLg(color: AppColors.greenShade2),
        ),
        const SizedBox(
          height: SizesConfig.md,
        ),
        Text(TextStrings.chooseYourType,
            style: AppTextStyle.bodyMd(color: AppColors.fontLightColor)),
        const SizedBox(
          height: SizesConfig.spaceBtwSections,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray),
              borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd)),
          child: BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
              buildWhen: (previous, current) =>
                  previous.roleListStatus != current.roleListStatus,
              builder: (context, state) {
                return AuthStateHandling().getUserTypeRole(
                  state: state,
                  selectedRole: selectedRole,
                  onChanged0: (newValue) {
                    selectedRole.value = newValue;
                  },
                  onChanged1: (newValue) {
                    selectedRole.value = newValue;
                  },
                );
              }),
        ),
        const SizedBox(
          height: SizesConfig.spaceBtwSections,
        ),
        CustomCartoonButton(
          title: TextStrings.next,
          width: double.infinity,
          onTap: () {
            print(selectedRole.value!.role);
            selectedRole.value!.role.contains("cl")
                ? context.pushNamed(AppRouteConfig.fillClientProfile,
                    pathParameters: {
                        'id': selectedRole.value!.id.toString(),
                      })
                : context.pushNamed(AppRouteConfig.fillFreelancerProfile,
                    pathParameters: {
                        'id': selectedRole.value!.id.toString(),
                      });
          },
        )
      ],
    );
  }
}

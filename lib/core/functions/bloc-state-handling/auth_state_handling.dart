import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/widgets/buttons/radio_button.dart';
import 'package:two_website/core/widgets/dialog/auth/not_authorized_dialog.dart';
import 'package:two_website/core/widgets/dialog/state/error_dialog.dart';
import 'package:two_website/core/widgets/dialog/state/loading_dialog.dart';
import 'package:two_website/core/widgets/dialog/state/success_dialog.dart';
import 'package:two_website/core/widgets/dropdown/custom_dropdown_list_for_role_model.dart';
import 'package:two_website/core/widgets/images/fetch_network_image.dart';
import 'package:two_website/core/widgets/layouts/drawer/user_profile_row.dart';
import 'package:two_website/core/widgets/shimmers/dropdown-loading/custom_dropdown_loading.dart';
import 'package:two_website/core/widgets/shimmers/profile-loading/loading_user_image.dart';
import 'package:two_website/core/widgets/shimmers/profile-loading/loading_user_profile.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/data/models/role_response_model.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';

class AuthStateHandling {
  // auth
  Future<void> signUpListener(
      AuthRoleProfileState state, BuildContext context) async {
    if (state.authModelStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.authModelStatus == CasualStatus.success) {
      await SharedPreferencesServices.setUserToken(state.authModel!.token);
      context.pop();
      context.pushReplacementNamed(AppRouteConfig.chooseUserType);
    } else if (state.authModelStatus == CasualStatus.failure ||
        state.authModelStatus == CasualStatus.notAuthorized) {
      context.pop();
      showErrorDialog(context, state.message);
    } else {
      const SizedBox();
    }
  }

  Future<void> loginListener(
      AuthRoleProfileState state, BuildContext context) async {
    if (state.authModelStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.authModelStatus == CasualStatus.success) {
      context.pop();
      await SharedPreferencesServices.setUserToken(state.authModel!.token);
      showSuccessDialog(
        context,
        () {
          context.pop();
          context.pushReplacementNamed(AppRouteConfig.landing);
          context.read<AuthRoleProfileBloc>().add(GetUserProfileEvent());
        },
      );
    } else if (state.authModelStatus == CasualStatus.failure ||
        state.authModelStatus == CasualStatus.notAuthorized) {
      context.pop();
      showErrorDialog(context, state.message);
    } else {
      const SizedBox();
    }
  }

  void logoutListener(AuthRoleProfileState state, BuildContext context) async {
    if (state.logoutStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.logoutStatus == CasualStatus.success) {
      context.pop();
      await SharedPreferencesServices.deleteUserToken();
      showSuccessDialog(
        context,
        () {
          context.pop();
          context.pushReplacementNamed(AppRouteConfig.landing);
        },
      );
    } else if (state.authModelStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    } else if (state.authModelStatus == CasualStatus.notAuthorized) {
      context.pop();
      showNotAuthorizedDialog(context);
    }
  }

// Profile
  void fillClientProfileListener(
      AuthRoleProfileState state, BuildContext context) {
    if (state.updateClientProfileStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.updateClientProfileStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(
        context,
        () {
          context.pop();
          context.pushReplacementNamed(AppRouteConfig.orderProject);
        },
      );
    } else if (state.updateClientProfileStatus == CasualStatus.failure) {
      context.pop();
      print(state.message);
      showErrorDialog(context, state.message);
    }
  }

  void orderProjectListener(LandingState state, BuildContext context) {
    if (state.createProjectStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.createProjectStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(
        context,
        () {
          context.pop();
          context.pushReplacementNamed(AppRouteConfig.landing);
          Future.delayed(const Duration(milliseconds: 300), () {
            context.read<AuthRoleProfileBloc>().add(GetUserProfileEvent());
          });
        },
      );
    } else if (state.createProjectStatus == CasualStatus.failure) {
      context.pop();
      print(state.message);
      showErrorDialog(context, state.message);
    }
  }

  void fillFreelancerProfileListener(
      AuthRoleProfileState state, BuildContext context) {
    if (state.updateFreeLancerProfileStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.updateFreeLancerProfileStatus == CasualStatus.success) {
      //context.read<AuthRoleProfileBloc>().add(GetUserProfileEvent());
      context.pop();
      showSuccessDialog(
        context,
        () {
          context.pop();
          context.pushReplacementNamed(AppRouteConfig.landing);
          Future.delayed(const Duration(milliseconds: 300), () {
            context.read<AuthRoleProfileBloc>().add(GetUserProfileEvent());
          });
        },
      );
    } else if (state.updateFreeLancerProfileStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    }
  }

  Widget getUserProfileHeader(
    AuthRoleProfileState state,
    BuildContext context,
  ) {
    if (state.profileEntityStatus == CasualStatus.success) {
      return UserProfileRow(
        profileEntity: state.profileEntity!,
      );
    } else {
      return const LoadingUserProfile();
    }
  }

  Widget getUserProfileImage(
    AuthRoleProfileState state,
    BuildContext context,
  ) {
    if (state.profileEntityStatus == CasualStatus.loading) {
      return const LoadingUserImage();
    } else if (state.profileEntityStatus == CasualStatus.success) {
      return FetchNetworkImage(imagePath: state.profileEntity!.pImage!);
    } else {
      return const SizedBox();
    }
  }

// Roles
  Widget getDropDowmRolesList({
    required AuthRoleProfileState state,
    required ValueNotifier<RoleModel?> selectedRole,
    required void Function(RoleModel?) onChanged,
  }) {
    if (state.roleListStatus == CasualStatus.success) {
      if (state.roleList.isNotEmpty) {
        return ValueListenableBuilder<RoleModel?>(
          valueListenable: selectedRole,
          builder: (context, roleValue, _) {
            return CustomDropdownListForRoleModel(
              value: roleValue,
              items: state.roleList.map((role) {
                return DropdownMenuItem(value: role, child: Text(role.role));
              }).toList(),
              onChanged: onChanged,
            );
          },
        );
      } else {
        return const Text("No Roles");
      }
    } else if (state.roleListStatus == CasualStatus.loading) {
      return const CustomDropdownLoading();
    } else if (state.roleListStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return const SizedBox();
    }
  }

  Widget getUserTypeRole({
    required AuthRoleProfileState state,
    required ValueNotifier<RoleModel?> selectedRole,
    required void Function(RoleModel?) onChanged0,
    required void Function(RoleModel?) onChanged1,
  }) {
    if (state.roleListStatus == CasualStatus.loading) {
      return const CircularProgressIndicator();
    } else if (state.roleListStatus == CasualStatus.success) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomRadioButton(
              role: ValueNotifier(state.roleList[0]),
              selcetedRole: selectedRole,
              label: state.roleList[0].role,
              onChanged: onChanged0),
          const SizedBox(width: 24),
          CustomRadioButton(
              role: ValueNotifier(state.roleList[1]),
              selcetedRole: selectedRole,
              label: state.roleList[1].role,
              onChanged: onChanged1),
        ],
      );
    } else if (state.roleListStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return const SizedBox();
    }
  }
}

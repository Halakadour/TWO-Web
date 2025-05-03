import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/widgets/images/fetch_network_image.dart';
import 'package:two_website/core/widgets/layouts/drawer/user_profile_row.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/core/widgets/shimmers/profile-loading/loading_user_image.dart';
import 'package:two_website/core/widgets/shimmers/profile-loading/loading_user_profile.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

class AuthStateHandling {
  Future<void> signUpListener(
      AuthRoleProfileState state, BuildContext context) async {
    if (state.authModelStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.authModelStatus == CasualStatus.success) {
      await SharedPreferencesServices.setUserToken(state.authModel!.token);
      context.pop();
      context.pushReplacementNamed(AppRouteConfig.chooseUserType);
    } else if (state.authModelStatus == CasualStatus.failure ||
        state.authModelStatus == CasualStatus.notAuthorized) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else {
      const SizedBox();
    }
  }

  Future<void> loginListener(
      AuthRoleProfileState state, BuildContext context) async {
    if (state.authModelStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.authModelStatus == CasualStatus.success) {
      await SharedPreferencesServices.setUserToken(state.authModel!.token);
      context.read<AuthRoleProfileBloc>().add(GetUserProfileEvent());
      context.pop();
      context.pushReplacementNamed(AppRouteConfig.landing);
    } else if (state.authModelStatus == CasualStatus.failure ||
        state.authModelStatus == CasualStatus.notAuthorized) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else {
      const SizedBox();
    }
  }

  void logoutListener(AuthRoleProfileState state, BuildContext context) async {
    if (state.logoutStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.logoutStatus == CasualStatus.success) {
      context.pop();
      await SharedPreferencesServices.deleteUserToken();
      CustomQuickAlert().successAlert(context);
      context.pushReplacementNamed(AppRouteConfig.landing);
    } else if (state.authModelStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.authModelStatus == CasualStatus.notAuthorized) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }

  void fillClientProfileListener(
      AuthRoleProfileState state, BuildContext context) {
    if (state.updateClientProfileStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.updateClientProfileStatus == CasualStatus.success) {
      context.read<AuthRoleProfileBloc>().add(GetUserProfileEvent());
      context.pop();
      context.pushReplacementNamed(AppRouteConfig.landing);
    } else if (state.updateClientProfileStatus == CasualStatus.failure) {
      context.pop();
      print(state.message);
      CustomQuickAlert().failureAlert(context, state.message);
    }
  }

  void fillFreelancerProfileListener(
      AuthRoleProfileState state, BuildContext context) {
    if (state.updateFreeLancerProfileStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.updateFreeLancerProfileStatus == CasualStatus.success) {
      context.read<AuthRoleProfileBloc>().add(GetUserProfileEvent());
      context.pop();
      context.pushReplacementNamed(AppRouteConfig.landing);
    } else if (state.updateFreeLancerProfileStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    }
  }

  Widget getUserProfileHeader(
    AuthRoleProfileState state,
    BuildContext context,
  ) {
    if (state.profileEntityStatus == CasualStatus.loading) {
      return const LoadingUserProfile();
    } else if (state.profileEntityStatus == CasualStatus.success) {
      return UserProfileRow(
        profileEntity: state.profileEntity!,
      );
    } else {
      return const SizedBox();
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
}

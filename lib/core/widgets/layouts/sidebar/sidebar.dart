import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/core/widgets/dialog/auth/auth_dialogs.dart';
import 'package:two_website/core/widgets/layouts/sidebar/menu_item.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({
    super.key,
    required this.currentPageIndex,
    required this.onItemSelected,
  });

  final int currentPageIndex;
  final Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.navy,
          border: Border(
            right: BorderSide(color: AppColors.gray, width: 1),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: SizesConfig.md),
                child: SvgPicture.asset(IconsPath.logo),
              ),
              PaddingConfig.h16,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizesConfig.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "MENU",
                      style: AppTextStyle.subtitle03(
                        color: AppColors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    PaddingConfig.h8,
                    MenuItem(
                      icon: IconsPath.category,
                      itemName: "Dashboard",
                      pageNum: 0,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.threeUsers,
                      itemName: "Accounts",
                      pageNum: 1,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.edit,
                      itemName: "About Us & Why Us",
                      pageNum: 2,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.bag,
                      itemName: "Services",
                      pageNum: 3,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.paper,
                      itemName: "Posts",
                      pageNum: 4,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.email,
                      itemName: "Contact Us",
                      pageNum: 5,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    PaddingConfig.h8,
                    Text(
                      "OTHER",
                      style: AppTextStyle.subtitle03(
                        color: AppColors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    PaddingConfig.h8,
                    MenuItem(
                      icon: IconsPath.setting,
                      itemName: "Settings",
                      pageNum: 6,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
                      listener: (context, state) {
                        logoutStateHandling(state, context);
                      },
                      listenWhen: (previous, current) =>
                          previous.logoutStatusStatus !=
                          current.logoutStatusStatus,
                      child: GestureDetector(
                        onTap: () => AuthDialogs().logoutDialog(context),
                        child: const LogoutWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logoutStateHandling(
      AuthRoleProfileState state, BuildContext context) async {
    if (state.logoutStatusStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.logoutStatusStatus == CasualStatus.success) {
      context.pop();
      await SharedPreferencesServices.deleteUserToken();
      CustomQuickAlert().successAlert(context);
      context.pushReplacementNamed(AppRouteConfig.landing);
    } else if (state.authModelStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.authModelStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: SizesConfig.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SvgPicture.asset(
              IconsPath.logout,
              // ignore: deprecated_member_use
              color: AppColors.fontLightColor,
            ),
          ),
          Text(
            "Logout",
            style: AppTextStyle.buttonStyle(
              color: AppColors.fontLightColor,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/functions/bloc-state-handling/auth_state_handling.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/dialog/auth/auth_dialogs.dart';
import 'package:two_website/core/widgets/layouts/drawer/logout_widget.dart';
import 'package:two_website/core/widgets/layouts/drawer/menu_item.dart';
import 'package:two_website/core/widgets/layouts/drawer/sign_row.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
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
              if (context.read<AuthRoleProfileBloc>().state.authorizedStatus ==
                  CasualStatus.authorized)
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: SizesConfig.lg, horizontal: SizesConfig.md),
                    child:
                        BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
                      buildWhen: (previous, current) =>
                          previous.profileEntityStatus !=
                          current.profileEntityStatus,
                      builder: (context, state) => AuthStateHandling()
                          .getUserProfileHeader(state, context),
                    )),
              if (context.read<AuthRoleProfileBloc>().state.authorizedStatus !=
                  CasualStatus.authorized)
                const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizesConfig.lg, horizontal: SizesConfig.md),
                  child: SignRow(),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizesConfig.md, vertical: SizesConfig.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MenuItem(
                      icon: Iconsax.home,
                      itemName: "Home",
                      pageNum: 0,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: Iconsax.building_3,
                      itemName: "About Us",
                      pageNum: 1,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: Iconsax.bag,
                      itemName: "Services",
                      pageNum: 2,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: Iconsax.reserve,
                      itemName: "Posts",
                      pageNum: 3,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    MenuItem(
                      icon: Iconsax.setting,
                      itemName: "Settings",
                      pageNum: 4,
                      currentPage: currentPageIndex,
                      onTap: onItemSelected,
                    ),
                    if (context
                            .read<AuthRoleProfileBloc>()
                            .state
                            .authorizedStatus ==
                        CasualStatus.authorized)
                      BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
                        listener: (context, state) {
                          AuthStateHandling().logoutListener(state, context);
                        },
                        listenWhen: (previous, current) =>
                            previous.logoutStatus != current.logoutStatus,
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
}

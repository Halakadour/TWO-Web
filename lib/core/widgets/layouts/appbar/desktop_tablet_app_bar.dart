import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/for_scrolling.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/functions/bloc-state-handling/auth_state_handling.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/layouts/drawer/sign_row.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/landing/presentation/widgets/navigation_bar/custom_vertical_divider.dart';

import '../../../../config/strings/assets_path.dart';
import '../../../../lang/locale_keys.g.dart';

class DesktopTabletAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const DesktopTabletAppBar({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<DesktopTabletAppBar> createState() => _DesktopTabletAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

int _currentIndex = 0;

class _DesktopTabletAppBarState extends State<DesktopTabletAppBar> {
  void scrollToSection(int index) {
    setState(() {
      _currentIndex = index;
    });
    ForScrolling().scrollToSection(index, widget.scrollController);
  }

  String selectedLanguage = LocaleKeys.arabic.tr();

  void changeLanguage(String languageCode) {
    if (languageCode == 'ar') {
      context.setLocale(const Locale('ar'));
      setState(() {
        selectedLanguage = LocaleKeys.arabic.tr();
      });
    } else {
      context.setLocale(const Locale('en'));
      setState(() {
        selectedLanguage = LocaleKeys.english.tr();
      });
    }
  }

  @override
  PreferredSizeWidget build(BuildContext context) {
    selectedLanguage = context.locale.languageCode;
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: SizedBox(
        height: 50,
        width: 50,
        child: SvgPicture.asset(ImagesPath.webLogo),
      ),
      actions: [
        ...List.generate(ForScrolling().sectionOffsets.length, (index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => scrollToSection(index),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    [
                      LocaleKeys.home.tr(),
                      LocaleKeys.aboutUs.tr(),
                      LocaleKeys.services.tr(),
                      LocaleKeys.posters.tr(),
                    ][index],
                    style: AppTextStyle.buttonStyle(color: AppColors.black),
                  ),
                ),
              ),
              Container(
                height: 2.5,
                width: 60,
                color: (_currentIndex == index) ? AppColors.mainColor : null,
              ),
            ],
          );
        }),
        PaddingConfig.w48,
        Row(
          children: [
            BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
              buildWhen: (previous, current) =>
                  previous.profileEntityStatus != current.profileEntityStatus,
              builder: (context, state) {
                if (state.authorizedStatus == CasualStatus.authorized) {
                  return AuthStateHandling()
                      .getUserProfileHeader(state, context);
                } else {
                  return const SignRow();
                }
              },
            ),
            const CustomVerticalDivider(),
            GestureDetector(
              onTapDown: (details) {
                final offset = details.globalPosition;
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    offset.dx,
                    offset.dy,
                    MediaQuery.of(context).size.width - offset.dx,
                    MediaQuery.of(context).size.height - offset.dy,
                  ),
                  items: [
                    PopupMenuItem<String>(
                      value: 'en',
                      child: Text(LocaleKeys.english.tr()),
                    ),
                    PopupMenuItem<String>(
                      value: 'ar',
                      child: Text(LocaleKeys.arabic.tr()),
                    ),
                  ],
                ).then((value) {
                  if (value != null) {
                    changeLanguage(value);
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedLanguage == "en"
                      ? LocaleKeys.english.tr()
                      : LocaleKeys.arabic.tr()),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

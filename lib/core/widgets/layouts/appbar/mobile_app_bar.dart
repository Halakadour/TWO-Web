import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class MobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppBar(
      {super.key, required this.scaffoldKey, required this.scrollController});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ScrollController scrollController;

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MobileAppBarState extends State<MobileAppBar> {
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
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      actions: [
        SizedBox(
          height: 50,
          width: 50,
          child: SvgPicture.asset(ImagesPath.webLogo),
        ),
        PaddingConfig.w16,
        // User Data
        // BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
        //   buildWhen: (previous, current) =>
        //       previous.profileEntityStatus != current.profileEntityStatus,
        //   builder: (context, state) {
        //     if (state.authorizedStatus == CasualStatus.authorized) {
        //       return AuthStateHandling().getUserProfileHeader(state, context);
        //     } else {
        //       return const SignUpButton();
        //     }
        //   },
        // ),
      ],
    );
  }
}

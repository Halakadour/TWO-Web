import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/core/widgets/layouts/appbar/custom_menu.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class MobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MobileAppBarState extends State<MobileAppBar> {
  final List<double> _sectionOffsets = [
    0,
    SizesConfig.pageHight + 40,
    SizesConfig.pageHight * 2 + 80,
    SizesConfig.pageHight * 3 + 120,
  ];

  void scrollToSection(int index) {
    widget.scrollController.animateTo(
      _sectionOffsets[index],
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
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
  Widget build(BuildContext context) {
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
        CustomMenu(
          scrollController: widget.scrollController,
        )
      ],
    );
  }
}

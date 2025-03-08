import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class CustomMenu extends StatefulWidget {
  const CustomMenu({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  CustomMenuState createState() => CustomMenuState();
}

class CustomMenuState extends State<CustomMenu> {
  OverlayEntry? _backgroundOverlay;
  OverlayEntry? _mainMenuOverlay;
  OverlayEntry? _languageMenuOverlay;
  Offset _mainMenuPosition = Offset.zero;
  final LayerLink _mainLink = LayerLink();
  final LayerLink _langLink = LayerLink();

  void _showMainMenu(BuildContext context, TapDownDetails details) {
    _hideMenus(); // Ensure no duplicate menus
    _mainMenuPosition = details.globalPosition;

    // Show background overlay first
    _backgroundOverlay = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _hideMenus, // Close menus on outside tap
        behavior: HitTestBehavior.opaque, // Detect taps anywhere
        child: Container(),
      ),
    );
    Overlay.of(context).insert(_backgroundOverlay!);

    _mainMenuOverlay = OverlayEntry(
      builder: (context) => Positioned(
        left: _mainMenuPosition.dx - 100,
        top: _mainMenuPosition.dy,
        child: CompositedTransformFollower(
          link: _mainLink,
          offset: const Offset(10, 10), // Adjust for positioning
          child: Material(
            color: Colors.white,
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _menuItem(
                    context, LocaleKeys.home.tr(), () => _scrollToSection(0)),
                _menuItem(context, LocaleKeys.aboutUs.tr(),
                    () => _scrollToSection(1)),
                _menuItem(context, LocaleKeys.services.tr(),
                    () => _scrollToSection(2)),
                _menuItem(context, LocaleKeys.posters.tr(),
                    () => _scrollToSection(3)),
                _menuItem(context, LocaleKeys.signin.tr(), () {},
                    isButton: true),
                _menuItem(
                  context,
                  selectedLanguage == "en"
                      ? LocaleKeys.english.tr()
                      : LocaleKeys.arabic.tr(),
                  _showLanguageMenu,
                  hasArrow: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_mainMenuOverlay!);
  }

  void _showLanguageMenu() {
    _hideLanguageMenu(); // Ensure no duplicate menus

    _languageMenuOverlay = OverlayEntry(
      builder: (context) => Positioned(
        left: _mainMenuPosition.dx - 180, // Adjust position
        top: _mainMenuPosition.dy + 200, // Align with "English"
        child: CompositedTransformFollower(
          link: _langLink,
          offset: const Offset(0, 0),
          child: Material(
            color: Colors.white,
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _menuItem(context, "English", () => _changeLanguage("en")),
                _menuItem(context, "Arabic", () => _changeLanguage("ar")),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_languageMenuOverlay!);
  }

  void _hideMenus() {
    _backgroundOverlay?.remove();
    _backgroundOverlay = null;

    _mainMenuOverlay?.remove();
    _mainMenuOverlay = null;

    _hideLanguageMenu();
  }

  void _hideLanguageMenu() {
    _languageMenuOverlay?.remove();
    _languageMenuOverlay = null;
  }

  final List<double> _sectionOffsets = [
    0,
    SizesConfig.pageHight + 40,
    SizesConfig.pageHight * 2 + 80,
    SizesConfig.pageHight * 3 + 120,
  ];

  void _scrollToSection(int index) {
    widget.scrollController.animateTo(
      _sectionOffsets[index],
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    _hideMenus();
  }

  String selectedLanguage = LocaleKeys.arabic.tr();

  void _changeLanguage(String languageCode) {
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
    _hideMenus();
  }

  Widget _menuItem(BuildContext context, String text, VoidCallback onTap,
      {bool isButton = false, bool hasArrow = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: isButton
            ? BoxDecoration(
                color: AppColors.greenShade2,
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppTextStyle.buttonStyle(
                  color: isButton ? AppColors.white : AppColors.black),
            ),
            if (hasArrow) const Icon(Icons.arrow_drop_down_outlined),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    selectedLanguage = context.locale.languageCode;
    return GestureDetector(
      onTapDown: (details) => _showMainMenu(context, details),
      child: const Padding(
        padding: EdgeInsets.only(right: 20),
        child: Icon(Iconsax.menu),
      ),
    );
  }
}

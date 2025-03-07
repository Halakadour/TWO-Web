import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/landing/presentation/widgets/navigation_bar/custom_vertical_divider.dart';
import 'package:two_website/features/landing/presentation/widgets/navigation_bar/sign_up_button.dart';

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

final List<double> _sectionOffsets = [
  0,
  SizesConfig.pageHight + 40,
  SizesConfig.pageHight * 2 + 80,
  SizesConfig.pageHight * 3 + 120,
  SizesConfig.pageHight * 4 + 160,
];

class _DesktopTabletAppBarState extends State<DesktopTabletAppBar> {
  void scrollToSection(int index) {
    setState(() {
      _currentIndex = index;
    });
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
        ...List.generate(_sectionOffsets.length, (index) {
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
                      LocaleKeys.contactUs.tr(),
                    ][index],
                    style:
                        AppTextStyle.buttonStyle(color: AppColors.blackColor),
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
            const SignUpButton(),
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

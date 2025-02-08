import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/page_hight.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/lang/locale_keys.g.dart';
import 'package:two_website/sections/about-us/about_us_section.dart';
import 'package:two_website/sections/home/home_section.dart';
import 'package:two_website/sections/home/widgets/navigation_bar/contact_us_button.dart';
import 'package:two_website/sections/services/services_section.dart';

import 'config/paths/assets_path.dart';
import 'core/widgets/section.dart';
import 'sections/home/widgets/navigation_bar/custom_vertical_divider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();

  int _currentIndex = 0;

  final List<double> _sectionOffsets = [
    0,
    pageHight,
    pageHight * 2,
    pageHight * 3
  ];

  void scrollToSection(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 4) {
      _scrollController.animateTo(
        pageHight * 4,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _scrollController.animateTo(
        _sectionOffsets[index],
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
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
    return Scaffold(
      appBar: AppBar(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      [
                        LocaleKeys.home.tr(),
                        LocaleKeys.aboutUs.tr(),
                        LocaleKeys.services.tr(),
                        LocaleKeys.portfolio.tr()
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
          w50,
          Row(
            children: [
              ContactUsButton(onPressed: () => scrollToSection(4)),
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
                    Text(selectedLanguage),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: const Column(
          children: [
            HomeSection(),
            AboutUsSection(),
            ServicesSection(),
            Section(title: 'Projects', color: Colors.redAccent),
            Section(title: 'Contact Us', color: Colors.purpleAccent),
          ],
        ),
      ),
    );
  }
}

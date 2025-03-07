import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/features/about-us-why-us/presentation/pages/about_us_why_us_page.dart';
import 'package:two_website/features/contact-us/presentation/pages/contact_us_page.dart';
import 'package:two_website/features/main/presentation/pages/dashboard_page.dart';
import 'package:two_website/features/posts/presentation/pages/posts_page.dart';
import 'package:two_website/features/profile/presentation/pages/accounts_page.dart';
import 'package:two_website/features/profile/presentation/pages/setting_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ValueNotifier<int> _pageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ValueListenableBuilder(
        valueListenable: _pageIndex,
        builder: (context, value, _) {
          return CustomSiteTemplate(
            currentPageIndex: _pageIndex.value,
            onItemSelected: (newIndex) {
              _pageIndex.value = newIndex;
            },
            desktop: Desktop(
              index: value,
            ),
            tablet: Tablet(
              index: value,
            ),
            mobile: Mobile(
              index: value,
            ),
          );
        },
      ),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({super.key, required this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IndexedStack(
        index: index,
        children: const [
          DashboardPage(),
          AccountsPage(),
          AboutUsWhyUsPage(),
          PostsPage(),
          ContactUsPage(),
          SettingPage(),
        ],
      ),
    );
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key, required this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IndexedStack(
        index: index,
        children: const [
          DashboardPage(),
          AccountsPage(),
          AboutUsWhyUsPage(),
          PostsPage(),
          ContactUsPage(),
          SettingPage(),
        ],
      ),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key, required this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IndexedStack(
        index: index,
        children: const [
          DashboardPage(),
          AccountsPage(),
          AboutUsWhyUsPage(),
          PostsPage(),
          ContactUsPage(),
          SettingPage(),
        ],
      ),
    );
  }
}

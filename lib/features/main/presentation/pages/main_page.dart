import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/sidebar/sidebar.dart';
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

  void _updatePageIndex(int newIndex) {
    _pageIndex.value = newIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _pageIndex,
      builder: (context, value, _) {
        return Scaffold(
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomSidebar(
                  currentPageIndex: value,
                  onItemSelected: _updatePageIndex,
                ),
              ),
              Expanded(
                flex: 4,
                child: IndexedStack(
                  index: value,
                  children: const [
                    DashboardPage(),
                    AccountsPage(),
                    PostsPage(),
                    SettingPage(),
                    ContactUsPage(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

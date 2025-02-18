import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:two_website/features/contact-us/presentation/pages/contact_us_page.dart';
import 'package:two_website/features/contracts/presentation/pages/contracts_page.dart';
import 'package:two_website/features/main/presentation/pages/dashboard_page.dart';
import 'package:two_website/features/main/presentation/widgets/custom_nav_rail.dart';
import 'package:two_website/features/roles/presentation/pages/roles_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ValueNotifier<int> _pageIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _pageIndex,
        builder: (context, value, _) {
          return Scaffold(
            body: Row(
              children: [
                if (ResponsiveBreakpoints.of(context).isDesktop)
                  CustomNavRail(
                    selectedIndex: _pageIndex,
                  ),
                Expanded(
                  child: IndexedStack(index: value, children: const [
                    DashboardPage(),
                    RolesPage(),
                    ContractsPage(),
                    ContactUsPage()
                  ]),
                ),
              ],
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomSiteTemplate(
          currentPageIndex: shell.currentIndex,
          onItemSelected: (index) {
            shell.goBranch(index);
          },
          desktop: Expanded(
            child: shell,
          )),
    );
  }
}

// class Desktop extends StatelessWidget {
//   const Desktop({super.key, required this.index});
//   final int? index;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: IndexedStack(
//         index: index,
//         children: const [
//           DashboardPage(),
//           AccountsPage(),
//           AboutUsWhyUsPage(),
//           PostsPage(),
//           ContactUsPage(),
//           SettingPage(),
//         ],
//       ),
//     );
//   }
// }

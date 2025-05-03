import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/for_scrolling.dart';
import 'package:two_website/core/functions/device_utility.dart';
import 'package:two_website/core/widgets/layouts/appbar/custom_app_bar.dart';
import 'package:two_website/core/widgets/layouts/drawer/drawer.dart';
import 'package:two_website/core/widgets/layouts/footer/custom_app_footer.dart';
import 'package:two_website/features/landing/presentation/pages/sections/posts_section.dart';
import 'package:two_website/features/landing/presentation/pages/sections/about-us/about_us_section.dart';
import 'package:two_website/features/landing/presentation/pages/sections/home_section.dart';
import 'package:two_website/features/landing/presentation/pages/sections/services_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int currnetPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        scrollController: _scrollController,
        scaffoldKey: scaffoldKey,
      ),
      // Mobile Drawer
      drawer: DeviceUtility.isMobileScreen(context)
          ? CustomDrawer(
              currentPageIndex: currnetPageIndex,
              onItemSelected: (p0) {
                setState(() {
                  currnetPageIndex = p0;
                  if (p0 != 4) {
                    ForScrolling().scrollToSection(p0, _scrollController);
                    context.pop();
                  }
                });
              },
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: const Column(
          children: [
            HomeSection(),
            AboutUsSection(),
            ServicesSection(),
            PostsSection(),
            CustomAppFooter()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/appbar/custom_app_bar.dart';
import 'package:two_website/core/widgets/layouts/footer/custom_app_footer.dart';
import 'package:two_website/features/landing/presentation/pages/sections/posts_section.dart';
import 'package:two_website/features/landing/presentation/pages/sections/about_us_section.dart';
import 'package:two_website/features/landing/presentation/pages/sections/home_section.dart';
import 'package:two_website/features/landing/presentation/pages/sections/services_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(scrollController: _scrollController),
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

import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_website/features/posts/presentation/pages/create-post/responsive-pages/create_post_desktop_tablet.dart';
import 'package:two_website/features/posts/presentation/pages/create-post/responsive-pages/create_post_mobile.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    return CustomSiteTemplate(
      currentPageIndex: 0,
      onItemSelected: (p0) {},
      useLayout: false,
      desktop: const CreatePostDesktopTablet(),
      tablet: const CreatePostDesktopTablet(),
      mobile: const CreatePostMobile(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:two_website/core/widgets/layouts/templates/login_template.dart';
import 'package:two_website/features/posts/presentation/widgets/create-post/create_post_form.dart';

class CreatePostDesktopTablet extends StatelessWidget {
  const CreatePostDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginTemplate(child: CreatePostForm());
  }
}

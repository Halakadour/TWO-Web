import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/features/posts/presentation/widgets/create-post/create_post_form.dart';

class CreatePostMobile extends StatelessWidget {
  const CreatePostMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesConfig.defaultSpace),
          child: Column(
            children: [CreatePostForm()],
          ),
        ),
      ),
    );
  }
}

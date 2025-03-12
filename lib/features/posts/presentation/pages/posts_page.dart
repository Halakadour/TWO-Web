import 'package:flutter/material.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/features/posts/presentation/pages/create-post/create_post_page.dart';
import 'package:two_website/features/posts/presentation/pages/post_replies_page.dart';
import 'package:two_website/features/posts/presentation/pages/show_posts_page.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Expanded(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: IndexedStack(
              index: 1,
              children: [
                ShowPostsPage(),
                CreatePostPage(),
                PostRepliesPage(
                  postId: "0",
                ),
              ],
            ),
          ),
        ));
  }
}

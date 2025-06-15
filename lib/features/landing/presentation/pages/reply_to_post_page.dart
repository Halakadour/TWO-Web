import 'package:flutter/material.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/widgets/layouts/templates/login_template.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/landing/presentation/widgets/posts/reply_to_post_body.dart';

class ReplyToPostPage extends StatefulWidget {
  const ReplyToPostPage(
      {super.key,
      required this.postId,
      required this.postPoster,
      required this.postbody});
  final String postId;
  final String postPoster;
  final String postbody;

  @override
  State<ReplyToPostPage> createState() => _ReplyToPostPageState();
}

class _ReplyToPostPageState extends State<ReplyToPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTemplate(
          color: AppColors.bgColor,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "sent a reply".toUpperCase(),
                              style: AppTextStyle.headerLg(),
                            ),
                            PaddingConfig.h24,
                            ScrollTemplate(
                                child: ReplyToPostBody(
                                    postId: widget.postId,
                                    postPoster: widget.postPoster,
                                    postbody: widget.postbody))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

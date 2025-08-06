import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/widgets/images/fetch_network_image.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/custom_linked_text.dart';
import 'package:two_website/features/landing/domain/entities/post_entity.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.postEntity});

  final PostEntity postEntity;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 400,
        padding: const EdgeInsets.only(bottom: 20),
        margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(
                  color: AppColors.gray,
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(2, 2)),
              BoxShadow(
                  color: AppColors.gray,
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(-2, -2)),
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: FetchNetworkImage(imagePath: widget.postEntity.poster),
            ),
            PaddingConfig.h8,
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16.0),
              child: Text(
                widget.postEntity.body,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            const SizedBox(
              width: double.infinity,
              child: Divider(
                color: AppColors.fieldColor,
              ),
            ),
            PaddingConfig.h8,
            CustomLinkedText(
                title: TextStrings.sentReply,
                onTap: () => context
                        .pushNamed(AppRouteConfig.replyToPost, pathParameters: {
                      'id': widget.postEntity.postId.toString(),
                      'image': widget.postEntity.poster,
                      'body': widget.postEntity.body
                    })),
          ],
        ),
      ),
    );
  }
}

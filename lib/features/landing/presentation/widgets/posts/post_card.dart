import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/widgets/images/memory_image_fetch.dart';
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
    return Container(
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
          MemoryImageFetch(poster: widget.postEntity.poster),
          PaddingConfig.h8,
          Text(widget.postEntity.body),
          const Spacer(),
          const SizedBox(
            width: double.infinity,
            child: Divider(
              color: AppColors.fieldColor,
            ),
          ),
          PaddingConfig.h8,
          CustomLinkedText(
              title: "Add a reply",
              onTap: () => context
                      .pushNamed(AppRouteConfig.replyToPost, pathParameters: {
                    'id': widget.postEntity.postId.toString(),
                    'image': widget.postEntity.poster,
                    'body': widget.postEntity.body
                  })),
        ],
      ),
    );
  }
}

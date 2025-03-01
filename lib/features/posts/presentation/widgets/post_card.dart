import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/custom_linked_text.dart';
import 'package:two_website/features/posts/domain/entities/post_entity.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.postEntity});

  final PostEntity postEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
          boxShadow: const [
            BoxShadow(
                color: AppColors.grayColor,
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(2, 2)),
            BoxShadow(
                color: AppColors.grayColor,
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(-2, -2)),
          ]),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: "$imageUri${postEntity.image}",
            fadeInCurve: Curves.linear,
            errorWidget: (context, url, error) => const Icon(Iconsax.image),
            height: 200,
          ),
          PaddingConfig.h10,
          Text(postEntity.body),
          const Spacer(),
          const SizedBox(
            width: double.infinity,
            child: Divider(
              color: AppColors.fieldColor,
            ),
          ),
          PaddingConfig.h10,
          CustomLinkedText(
              title: "Add a reply",
              onTap: () => context
                      .pushNamed(AppRouteConfig.replyToPost, pathParameters: {
                    'id': postEntity.id.toString(),
                    'image': postEntity.image,
                    'body': postEntity.body
                  })),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          Image.network("$imageUri${postEntity.image}"),
          // CachedNetworkImage(
          //   imageUrl: "$imageUri${postEntity.image}",
          //   fadeInCurve: Curves.linear,
          //   errorWidget: (context, url, error) => const Icon(Iconsax.image),
          //   errorListener: (value) {
          //     log(value.toString());
          //   },
          //   height: 200,
          // ),
          PaddingConfig.h8,
          Text(postEntity.body),
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
                    'id': postEntity.id.toString(),
                    'image': postEntity.image,
                    'body': postEntity.body
                  })),
        ],
      ),
    );
  }
}

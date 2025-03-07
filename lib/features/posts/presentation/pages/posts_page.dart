import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_website/features/posts/presentation/widgets/create-post/create_post_button.dart';
import 'package:two_website/features/posts/presentation/widgets/custom_posts_table.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  ValueNotifier<bool> actriveSelected = ValueNotifier(true);
  @override
  void didChangeDependencies() {
    context.read<PostBloc>().add(GetActivePostsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: BlocListener<PostBloc, PostState>(
              listener: (context, state) {
                managePostState(state, context);
              },
              listenWhen: (previous, current) => (previous.deletePostStatus !=
                      current.deletePostStatus ||
                  previous.unActivePostStatus != current.unActivePostStatus),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius:
                        BorderRadius.circular(SizesConfig.borderRadiusMd)),
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CreatePostButton(),
                        IconButton(
                            onPressed: () {
                              filterPosts(context);
                            },
                            icon: const Icon(Iconsax.filter))
                      ],
                    ),
                    const SizedBox(
                      height: SizesConfig.spaceBtwSections,
                    ),
                    Flexible(
                      child: BlocBuilder<PostBloc, PostState>(
                        buildWhen: (previous, current) =>
                            previous.activePostsListStatus !=
                            current.activePostsListStatus,
                        builder: (context, state) {
                          if (state.activePostsListStatus ==
                              CasualStatus.loading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state.activePostsListStatus ==
                              CasualStatus.success) {
                            return CustomPostsTable(
                                activePostsList: state.activePostsList);
                          } else if (state.activePostsListStatus ==
                              CasualStatus.failure) {
                            return Text(state.message);
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  void managePostState(PostState state, BuildContext context) {
    if (state.deletePostStatus == CasualStatus.loading ||
        state.unActivePostStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.deletePostStatus == CasualStatus.success ||
        state.unActivePostStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
    } else if (state.deletePostStatus == CasualStatus.failure ||
        state.unActivePostStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.deletePostStatus == CasualStatus.noToken ||
        state.unActivePostStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().failureAlert(context, TextStrings.noToken);
    }
  }

  void filterPosts(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Filter By :",
          style: AppTextStyle.subtitle01(),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Activation :",
                style: AppTextStyle.subtitle03(color: AppColors.greenColor),
              ),
              PaddingConfig.h24,
              ValueListenableBuilder(
                valueListenable: actriveSelected,
                builder: (context, value, child) => Row(
                  children: [
                    InkWell(
                      onTap: () {
                        actriveSelected.value = true;
                        context.read<PostBloc>().add(GetActivePostsEvent());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: value
                              ? AppColors.greenColor
                              : AppColors.grayColor,
                        ),
                        child: Text(
                          "Active posts",
                          style: AppTextStyle.subtitle04(
                              color: value
                                  ? AppColors.whiteColor
                                  : AppColors.fontDarkColor),
                        ),
                      ),
                    ),
                    PaddingConfig.w16,
                    InkWell(
                      onTap: () {
                        actriveSelected.value = false;
                        context.read<PostBloc>().add(GetUnActivePostsEvent());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !value
                              ? AppColors.greenColor
                              : AppColors.grayColor,
                        ),
                        child: Text(
                          "Un Active posts",
                          style: AppTextStyle.subtitle04(
                              color: !value
                                  ? AppColors.whiteColor
                                  : AppColors.fontDarkColor),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

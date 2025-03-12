import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/buttons/create_button.dart';
import 'package:two_website/core/widgets/buttons/filter_button.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_website/features/posts/presentation/widgets/custom_posts_table.dart';
import 'package:two_website/features/posts/presentation/widgets/loading_posts_table.dart';

class ShowPostsPage extends StatefulWidget {
  const ShowPostsPage({super.key});

  @override
  State<ShowPostsPage> createState() => _ShowPostsPageState();
}

class _ShowPostsPageState extends State<ShowPostsPage> {
  ValueNotifier<bool> actriveSelected = ValueNotifier(true);
  @override
  void didChangeDependencies() {
    context.read<PostBloc>().add(GetActivePostsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostState>(
      listener: (context, state) {
        managePostState(state, context);
      },
      listenWhen: (previous, current) =>
          (previous.deletePostStatus != current.deletePostStatus ||
              previous.unActivePostStatus != current.unActivePostStatus),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Posts",
                style: AppTextStyle.heading03(),
              ),
            ],
          ),
          const SizedBox(
            height: SizesConfig.spaceBtwSections,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CreateButton(
                addingType: "Post",
                onPressed: () {
                  context.pushNamed(AppRouteConfig.createPost);
                },
              ),
              PaddingConfig.w8,
              FilterButton(
                onPressed: () {
                  filterPosts(context);
                },
              )
            ],
          ),
          const SizedBox(
            height: SizesConfig.spaceBtwSections,
          ),
          Flexible(
            child: BlocBuilder<PostBloc, PostState>(
              buildWhen: (previous, current) =>
                  (previous.activePostsListStatus !=
                          current.activePostsListStatus ||
                      previous.unActivePostsListStatus !=
                          current.unActivePostsListStatus),
              builder: (context, state) {
                return manageGetPostsUI(state);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget manageGetPostsUI(PostState state) {
    if (state.activePostsListStatus == CasualStatus.loading ||
        state.unActivePostsListStatus == CasualStatus.loading) {
      return const LoadingPostsTable();
    } else if (state.activePostsListStatus == CasualStatus.success ||
        state.unActivePostsListStatus == CasualStatus.success) {
      return CustomPostsTable(
          activePostsList: actriveSelected.value
              ? state.activePostsList
              : state.unActivePostsList);
    } else if (state.activePostsListStatus == CasualStatus.failure ||
        state.unActivePostsListStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return const SizedBox();
    }
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
                style: AppTextStyle.subtitle03(color: AppColors.greenShade2),
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
                        context.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: value ? AppColors.greenShade2 : AppColors.gray,
                        ),
                        child: Text(
                          "Active posts",
                          style: AppTextStyle.subtitle04(
                              color: value
                                  ? AppColors.white
                                  : AppColors.fontDarkColor),
                        ),
                      ),
                    ),
                    PaddingConfig.w16,
                    InkWell(
                      onTap: () {
                        actriveSelected.value = false;
                        context.read<PostBloc>().add(GetUnActivePostsEvent());
                        context.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              !value ? AppColors.greenShade2 : AppColors.gray,
                        ),
                        child: Text(
                          "Un Active posts",
                          style: AppTextStyle.subtitle04(
                              color: !value
                                  ? AppColors.white
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

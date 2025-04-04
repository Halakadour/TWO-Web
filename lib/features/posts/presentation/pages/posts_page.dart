import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/buttons/create_button.dart';
import 'package:two_website/core/widgets/buttons/filter_button.dart';
import 'package:two_website/core/widgets/dialog/posts/posts_dialogs.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/core/widgets/shimmers/table-loading/loading_posts_table.dart';
import 'package:two_website/core/widgets/texts/page_title.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_website/features/posts/presentation/widgets/custom_posts_table.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _ShowPostsPageState();
}

class _ShowPostsPageState extends State<PostsPage> {
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
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            managePostState(state, context);
          },
          listenWhen: (previous, current) =>
              (previous.deletePostStatus != current.deletePostStatus ||
                  previous.unActivePostStatus != current.unActivePostStatus),
          child: Column(
            children: [
              const PageTitle(pageTitle: "Posts"),
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
                      PostsDialogs().filterPosts(context, actriveSelected);
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
        ),
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
}

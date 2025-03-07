import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_website/features/posts/presentation/widgets/post_card.dart';

class PostsSection extends StatefulWidget {
  const PostsSection({super.key});

  @override
  State<PostsSection> createState() => _PostsSectionState();
}

class _PostsSectionState extends State<PostsSection> {
  final ScrollController _controller = ScrollController();
  int postValue = 0;

  void _scrollLeft() {
    _controller.animateTo(
      _controller.offset - 1000,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _controller.animateTo(
      _controller.offset + 1000,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void didChangeDependencies() {
    context.read<PostBloc>().add(GetActivePostsEvent());
    context.read<PostBloc>().add(GetUnActivePostsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        child: DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "posts".toUpperCase(),
                style: AppTextStyle.heading00(),
              ),
            ],
          ),
          PaddingConfig.h48,
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.fieldColor,
                    borderRadius: BorderRadius.circular(10)),
                width: 400,
                height: 50,
                margin: const EdgeInsets.only(bottom: 30),
                child: TabBar(
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greenColor,
                    ),
                    onTap: (value) {
                      setState(() {
                        postValue = value;
                      });
                    },
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: AppColors.fontLightColor,
                    labelColor: AppColors.whiteColor,
                    tabs: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("Active Posts"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("Un Active Posts"),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 450,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: _scrollLeft,
                ),
                PaddingConfig.w32,
                Flexible(
                  child: (postValue == 0)
                      ? BlocBuilder<PostBloc, PostState>(
                          buildWhen: (previous, current) =>
                              previous.activePostsListStatus !=
                              current.activePostsListStatus,
                          builder: (context, state) {
                            if (state.activePostsListStatus ==
                                CasualStatus.loading) {
                              return const CircularProgressIndicator();
                            } else if (state.activePostsListStatus ==
                                CasualStatus.success) {
                              return (state.activePostsList.isEmpty)
                                  ? const Text("No Postes")
                                  : ListView.builder(
                                      itemCount: state.activePostsList.length,
                                      scrollDirection: Axis.horizontal,
                                      controller: _controller,
                                      itemBuilder: (context, index) => PostCard(
                                        postEntity:
                                            state.activePostsList[index],
                                      ),
                                    );
                            } else if (state.activePostsListStatus ==
                                CasualStatus.failure) {
                              return Text(state.message);
                            } else {
                              return const SizedBox();
                            }
                          },
                        )
                      : BlocBuilder<PostBloc, PostState>(
                          buildWhen: (previous, current) =>
                              previous.unActivePostsListStatus !=
                              current.unActivePostsListStatus,
                          builder: (context, state) {
                            if (state.unActivePostsListStatus ==
                                CasualStatus.loading) {
                              return const CircularProgressIndicator();
                            } else if (state.unActivePostsListStatus ==
                                CasualStatus.success) {
                              return (state.unActivePostsList.isEmpty)
                                  ? const Text("No Postes")
                                  : ListView.builder(
                                      itemCount: state.unActivePostsList.length,
                                      scrollDirection: Axis.horizontal,
                                      controller: _controller,
                                      itemBuilder: (context, index) => PostCard(
                                            postEntity:
                                                state.unActivePostsList[index],
                                          ));
                            } else if (state.unActivePostsListStatus ==
                                CasualStatus.failure) {
                              return Text(state.message);
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                ),
                PaddingConfig.w32,
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onPressed: _scrollRight,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

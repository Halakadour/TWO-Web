import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/functions/bloc-state-handling/landing_state_handling.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';

class PostsSection extends StatefulWidget {
  const PostsSection({super.key});

  @override
  State<PostsSection> createState() => _PostsSectionState();
}

class _PostsSectionState extends State<PostsSection> {
  final ScrollController _controller = ScrollController();

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
    context.read<LandingBloc>().add(GetActivePostsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "posts".toUpperCase(),
              style: AppTextStyle.headerLg(),
            ),
          ],
        ),
        PaddingConfig.h48,
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
              PaddingConfig.w16,
              Expanded(
                  child: BlocBuilder<LandingBloc, LandingState>(
                buildWhen: (previous, current) =>
                    previous.activePostsListStatus !=
                    current.activePostsListStatus,
                builder: (context, state) {
                  return LandingStateHandling()
                      .showActivePosts(state, _controller);
                },
              )),
              PaddingConfig.w16,
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
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/error/exceptions.dart';
import 'package:two_website/core/network/enum_status.dart';
import 'package:two_website/core/widgets/centerd_view.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_website/features/posts/presentation/widgets/post_card.dart';

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
    context.read<PostBloc>().add(GetActivePostsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CenterdView(
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
        h50,
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
              w30,
              Expanded(
                child: BlocBuilder<PostBloc, PostState>(
                  buildWhen: (previous, current) =>
                      previous.activePostsListStatus !=
                      current.activePostsListStatus,
                  builder: (context, state) {
                    if (state.activePostsListStatus == CasualStatus.loading) {
                      return const CircularProgressIndicator();
                    } else if (state.activePostsListStatus ==
                        CasualStatus.success) {
                      return ListView.builder(
                        itemCount: state.activePostsList.length,
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        itemBuilder: (context, index) => PostCard(
                            postImagePath: state.activePostsList[index].image,
                            postBody: state.activePostsList[index].body),
                      );
                    } else if (state.activePostsListStatus ==
                        CasualStatus.failure) {
                      return ErrorWidget(ServerException);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              w30,
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

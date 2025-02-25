import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';

class PostRepliesPage extends StatefulWidget {
  const PostRepliesPage({super.key, required this.postId});
  final String postId;

  @override
  State<PostRepliesPage> createState() => _PostRepliesPageState();
}

class _PostRepliesPageState extends State<PostRepliesPage> {
  ValueNotifier<bool> actriveSelected = ValueNotifier(true);
  @override
  void didChangeDependencies() {
    context
        .read<PostBloc>()
        .add(GetPostsRepliesEvent(postId: int.parse(widget.postId)));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: BlocListener<PostBloc, PostState>(
              listener: (context, state) {},
              listenWhen: (previous, current) =>
                  (previous.acceptReplyStatus != current.acceptReplyStatus),
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
                        const Text("Post Replies"),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    "Filter By :",
                                    style: AppTextStyle.subtitle01(),
                                  ),
                                  actions: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Acceptation :",
                                          style: AppTextStyle.subtitle03(
                                              color: AppColors.greenColor),
                                        ),
                                        PaddingConfig.h30,
                                        ValueListenableBuilder(
                                          valueListenable: actriveSelected,
                                          builder: (context, value, child) =>
                                              Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  actriveSelected.value = true;
                                                  context.read<PostBloc>().add(
                                                      GetPostsRepliesEvent(
                                                          postId: int.parse(
                                                              widget.postId)));
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15,
                                                      vertical: 9),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: value
                                                        ? AppColors.greenColor
                                                        : AppColors.grayColor,
                                                  ),
                                                  child: Text(
                                                    "Un Accepted replies",
                                                    style: AppTextStyle.subtitle04(
                                                        color: value
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .fontDarkColor),
                                                  ),
                                                ),
                                              ),
                                              PaddingConfig.w10,
                                              InkWell(
                                                onTap: () {
                                                  actriveSelected.value = false;
                                                  context.read<PostBloc>().add(
                                                      GetPostsAcceptedRepliesEvent(
                                                          postId: int.parse(
                                                              widget.postId)));
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15,
                                                      vertical: 9),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: !value
                                                        ? AppColors.greenColor
                                                        : AppColors.grayColor,
                                                  ),
                                                  child: Text(
                                                    "Accepted replies",
                                                    style: AppTextStyle.subtitle04(
                                                        color: !value
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .fontDarkColor),
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
                            previous.postsRepliesListStatus !=
                            current.postsRepliesListStatus,
                        builder: (context, state) {
                          if (state.postsRepliesListStatus ==
                              CasualStatus.loading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state.postsRepliesListStatus ==
                              CasualStatus.success) {
                            return DataTable2(
                              columnSpacing: 12,
                              minWidth: 500,
                              dividerThickness: 0,
                              horizontalMargin: 20,
                              headingRowHeight: 56,
                              headingTextStyle: AppTextStyle.subtitle01(),
                              headingRowColor: WidgetStateColor.resolveWith(
                                (states) => AppColors.grayColor,
                              ),
                              headingRowDecoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          SizesConfig.borderRadiusMd))),
                              columns: const [
                                DataColumn2(label: Text("Name")),
                                DataColumn2(label: Text("Email")),
                                DataColumn2(label: Text("Phone")),
                                DataColumn2(label: Text("Cv")),
                                DataColumn2(label: Text("Actions")),
                              ],
                              rows: List<DataRow>.generate(
                                  state.postRepliesList.length,
                                  (index) => DataRow(cells: [
                                        DataCell(Text(state
                                            .postRepliesList[index].fullName)),
                                        DataCell(Text(state
                                            .postRepliesList[index].email)),
                                        DataCell(Text(state
                                            .postRepliesList[index].phone)),
                                        DataCell(Text(state
                                            .postRepliesList[index]
                                            .cvFile
                                            .path)),
                                        DataCell(IconButton(
                                            onPressed: () {
                                              context.read<PostBloc>().add(
                                                  AcceptReplyEvent(
                                                      replyId: state
                                                          .postRepliesList[
                                                              index]
                                                          .id));
                                            },
                                            icon: const Icon(
                                              Iconsax.clipboard_tick,
                                              color: AppColors.greenColor,
                                            ))),
                                      ])),
                            );
                          } else if (state.postsRepliesListStatus ==
                              CasualStatus.failure) {
                            return const Text("Failure");
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
}

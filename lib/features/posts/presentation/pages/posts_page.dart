import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/base_uri.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/images/custom_rounded_image.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_website/features/posts/presentation/widgets/create-post/create_post_button.dart';

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
                                          "Activation :",
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
                                                      GetActivePostsEvent());
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
                                                    "Active posts",
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
                                                      GetUnActivePostsEvent());
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
                                                    "Un Active posts",
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
                            previous.activePostsListStatus !=
                            current.activePostsListStatus,
                        builder: (context, state) {
                          if (state.activePostsListStatus ==
                              CasualStatus.loading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state.activePostsListStatus ==
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
                                DataColumn2(label: Text("Title")),
                                DataColumn2(label: Text("Image")),
                                DataColumn2(label: Text("Actions")),
                                DataColumn2(label: Text("Replies")),
                              ],
                              rows: List<DataRow>.generate(
                                  state.activePostsList.length,
                                  (index) => DataRow(cells: [
                                        DataCell(Text(
                                            state.activePostsList[index].body)),
                                        DataCell(CustomRoundedImage(
                                          imageType: ImageType.network,
                                          image:
                                              "$imageUri${state.activePostsList[index].image}",
                                          borderRadius: 2,
                                        )),
                                        DataCell(Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  context.read<PostBloc>().add(
                                                      UnActivePostEvent(
                                                          postId: state
                                                              .activePostsList[
                                                                  index]
                                                              .id));
                                                },
                                                icon: const Icon(
                                                  Iconsax.clipboard_tick,
                                                  color: AppColors.greenColor,
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  context.read<PostBloc>().add(
                                                      DeletePostEvent(
                                                          postId: state
                                                              .activePostsList[
                                                                  index]
                                                              .id));
                                                },
                                                icon: const Icon(
                                                  Iconsax.trash,
                                                  color: AppColors.redColor,
                                                )),
                                          ],
                                        )),
                                        DataCell(TextButton(
                                            onPressed: () {
                                              context.pushNamed(
                                                  AppRouteConfig.postReplies,
                                                  pathParameters: {
                                                    'id': state
                                                        .activePostsList[index]
                                                        .id
                                                        .toString(),
                                                  });
                                            },
                                            child: Text(
                                              "Veiw Replies",
                                              style: AppTextStyle.subtitle04(
                                                  color: AppColors.blueColor),
                                            ))),
                                      ])),
                            );
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
}

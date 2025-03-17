import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/features/contact-us/presentation/bloc/contact_us_bloc.dart';
import 'package:two_website/features/posts/presentation/bloc/post_bloc.dart';

class FilterDialogs {
  // Contact Us Filter //
  void filterContactUs(
      BuildContext context, ValueNotifier<List<int>> actriveSelected) {
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
                "Seen :",
                style: AppTextStyle.subtitle03(color: AppColors.greenShade2),
              ),
              PaddingConfig.h24,
              ValueListenableBuilder(
                valueListenable: actriveSelected,
                builder: (context, value, child) => Row(
                  children: [
                    InkWell(
                      onTap: () {
                        actriveSelected.value[0] = 1;
                        context.read<ContactUsBloc>().add(
                            GetContactUsWithSeenAndApprovedEvent(
                                seenFilter: 1));
                        context.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: (value[0] == 1)
                              ? AppColors.greenShade2
                              : AppColors.gray,
                        ),
                        child: Text(
                          "Seen Mail",
                          style: AppTextStyle.subtitle04(
                              color: (value[0] == 1)
                                  ? AppColors.white
                                  : AppColors.fontDarkColor),
                        ),
                      ),
                    ),
                    PaddingConfig.w16,
                    InkWell(
                      onTap: () {
                        actriveSelected.value[0] = 0;
                        context.read<ContactUsBloc>().add(
                            GetContactUsWithSeenAndApprovedEvent(
                                seenFilter: 0));
                        context.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !(value[0] == 1)
                              ? AppColors.greenShade2
                              : AppColors.gray,
                        ),
                        child: Text(
                          "Un Seen Mail",
                          style: AppTextStyle.subtitle04(
                              color: !(value[0] == 1)
                                  ? AppColors.white
                                  : AppColors.fontDarkColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PaddingConfig.h16,
              Text(
                "Approvment :",
                style: AppTextStyle.subtitle03(color: AppColors.greenShade2),
              ),
              PaddingConfig.h24,
              ValueListenableBuilder(
                valueListenable: actriveSelected,
                builder: (context, value, child) => Row(
                  children: [
                    InkWell(
                      onTap: () {
                        actriveSelected.value[1] = 1;
                        context.read<ContactUsBloc>().add(
                            GetContactUsWithSeenAndApprovedEvent(
                                approvedFilter: 1));
                        context.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: (value[1] == 1)
                              ? AppColors.greenShade2
                              : AppColors.gray,
                        ),
                        child: Text(
                          "Approved Mail",
                          style: AppTextStyle.subtitle04(
                              color: (value[1] == 1)
                                  ? AppColors.white
                                  : AppColors.fontDarkColor),
                        ),
                      ),
                    ),
                    PaddingConfig.w16,
                    InkWell(
                      onTap: () {
                        actriveSelected.value[1] = 0;
                        context.read<ContactUsBloc>().add(
                            GetContactUsWithSeenAndApprovedEvent(
                                approvedFilter: 0));
                        context.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !(value[1] == 1)
                              ? AppColors.greenShade2
                              : AppColors.gray,
                        ),
                        child: Text(
                          "Un Approved Mail",
                          style: AppTextStyle.subtitle04(
                              color: !(value[1] == 1)
                                  ? AppColors.white
                                  : AppColors.fontDarkColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // Posts Filter //
  void filterPosts(BuildContext context, ValueNotifier<bool> actriveSelected) {
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/dialog/why-us-about-us/why_us_about_us_dialogs.dart';
import 'package:two_website/core/widgets/buttons/create_button.dart';
import 'package:two_website/core/widgets/buttons/update_button.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/about_us_entity.dart';
import 'package:two_website/features/about-us-why-us/presentation/bloc/about_us_why_us_bloc.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/custom_why_us_table.dart';
import 'package:two_website/core/widgets/shimmers/card-loading/loading_site_card.dart';
import 'package:two_website/core/widgets/shimmers/table-loading/loading_why_us_table.dart';
import 'package:two_website/core/widgets/shimmers/card-loading/loading_working_time_card.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/site_card.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/working_time_card.dart';

class AboutUsWhyUsPage extends StatefulWidget {
  const AboutUsWhyUsPage({super.key});

  @override
  State<AboutUsWhyUsPage> createState() => _AboutUsWhyUsPageState();
}

class _AboutUsWhyUsPageState extends State<AboutUsWhyUsPage> {
  @override
  void didChangeDependencies() {
    context.read<AboutUsWhyUsBloc>().add(ShowWhyUsEvent());
    context.read<AboutUsWhyUsBloc>().add(ShowAboutUsEvent());
    super.didChangeDependencies();
  }

  final TextEditingController _whyUsController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();
  AboutUsEntity? aboutUsEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "About Us :",
                  style: AppTextStyle.heading03(),
                ),
                Row(
                  children: [
                    // Create About Us
                    BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                      listener: (context, state) {
                        createAboutUsStateHandling(state, context);
                      },
                      listenWhen: (previous, current) =>
                          previous.createAboutUsStatus !=
                          current.createAboutUsStatus,
                      child: CreateButton(
                        addingType: "About Us",
                        onPressed: () {
                          AboutUsWhyUsDialogs().addAboutUsDialog(
                              context, _timeController, _siteController);
                        },
                      ),
                    ),
                    PaddingConfig.w8,
                    // Update About Us
                    BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                      listener: (context, state) {
                        updateAboutUsStateHandling(state, context);
                      },
                      listenWhen: (previous, current) =>
                          previous.updateAboutUsStatus !=
                          current.updateAboutUsStatus,
                      child: UpdateButton(
                        updateType: "About Us",
                        onPressed: () {
                          if (aboutUsEntity != null) {
                            AboutUsWhyUsDialogs().updateAboutUsDialog(
                                context,
                                TextEditingController(
                                    text: aboutUsEntity!.aboutWorkTime),
                                TextEditingController(
                                    text: aboutUsEntity!.aboutSite),
                                aboutUsEntity!.aboutId);
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
            PaddingConfig.h16,
            // Displaying About Us
            BlocBuilder<AboutUsWhyUsBloc, AboutUsWhyUsState>(
              builder: (context, state) {
                return showAboutUsStateHandling(state);
              },
              buildWhen: (previous, current) =>
                  previous.showAboutUsStatus != current.showAboutUsStatus,
            ),
            PaddingConfig.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Why Us :",
                  style: AppTextStyle.heading03(),
                ),
                // Create Why Us
                BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                  listener: (context, state) {
                    createWhyUsStateHandling(state, context);
                  },
                  listenWhen: (previous, current) =>
                      previous.createWhyUsStatus != current.createWhyUsStatus,
                  child: CreateButton(
                    addingType: "Why Us",
                    onPressed: () {
                      AboutUsWhyUsDialogs()
                          .addWhyUsDialog(context, _whyUsController);
                    },
                  ),
                )
              ],
            ),
            PaddingConfig.h16,
            // Displaying Why Us
            Flexible(
              child: BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                listener: (context, state) {
                  updateOrDeleteWhyUsStateHandling(state, context);
                },
                listenWhen: (previous, current) =>
                    (previous.deleteWhyUsStatus != current.deleteWhyUsStatus ||
                        previous.updateWhyUsStatus !=
                            current.updateWhyUsStatus),
                child: BlocBuilder<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                  buildWhen: (previous, current) =>
                      (previous.showWhyUsStatus != current.showWhyUsStatus),
                  builder: (context, state) {
                    return showWhyUsStateHandling(state);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showAboutUsStateHandling(AboutUsWhyUsState state) {
    if (state.showAboutUsStatus == CasualStatus.loading) {
      return const Row(children: [
        LoadingWorkingTimeCard(),
        PaddingConfig.w24,
        LoadingSiteCard()
      ]);
    } else if (state.showAboutUsStatus == CasualStatus.success) {
      if (state.showAboutUsEntity == null) {
        return const Text("Empty");
      } else {
        aboutUsEntity = state.showAboutUsEntity!;
        return Row(
          children: [
            WorkingTimeCard(
                workingTime: state.showAboutUsEntity!.aboutWorkTime),
            PaddingConfig.w24,
            SiteCard(site: state.showAboutUsEntity!.aboutSite)
          ],
        );
      }
    } else if (state.showAboutUsStatus == CasualStatus.failure) {
      return const Text("Failure");
    } else {
      return const SizedBox();
    }
  }

  void createAboutUsStateHandling(
      AboutUsWhyUsState state, BuildContext context) {
    if (state.createAboutUsStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.createAboutUsStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
      context.read<AboutUsWhyUsBloc>().add(ShowAboutUsEvent());
    } else if (state.createAboutUsStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.createAboutUsStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }

  void updateAboutUsStateHandling(
      AboutUsWhyUsState state, BuildContext context) {
    if (state.updateAboutUsStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.updateAboutUsStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
      context.read<AboutUsWhyUsBloc>().add(ShowAboutUsEvent());
    } else if (state.updateAboutUsStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.updateAboutUsStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }

  Widget showWhyUsStateHandling(AboutUsWhyUsState state) {
    if (state.showWhyUsStatus == CasualStatus.loading) {
      return const LoadingWhyUsTable();
    } else if (state.showWhyUsStatus == CasualStatus.success) {
      if (state.showWhyUsList.isEmpty) {
        return Text(state.message);
      } else {
        return CustomWhyUsTable(whyUsList: state.showWhyUsList);
      }
    } else if (state.showWhyUsStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return const SizedBox();
    }
  }

  void createWhyUsStateHandling(AboutUsWhyUsState state, BuildContext context) {
    if (state.createWhyUsStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.createWhyUsStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
      context.read<AboutUsWhyUsBloc>().add(ShowWhyUsEvent());
    } else if (state.createWhyUsStatus == CasualStatus.failure) {
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.createWhyUsStatus == CasualStatus.noToken) {
      CustomQuickAlert().noTokenAlert(context);
    }
  }

  void updateOrDeleteWhyUsStateHandling(
      AboutUsWhyUsState state, BuildContext context) {
    if (state.updateWhyUsStatus == CasualStatus.loading ||
        state.deleteWhyUsStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.updateWhyUsStatus == CasualStatus.success ||
        state.deleteWhyUsStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
      context.read<AboutUsWhyUsBloc>().add(ShowWhyUsEvent());
    } else if (state.updateWhyUsStatus == CasualStatus.failure ||
        state.deleteWhyUsStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.updateWhyUsStatus == CasualStatus.noToken ||
        state.deleteWhyUsStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}

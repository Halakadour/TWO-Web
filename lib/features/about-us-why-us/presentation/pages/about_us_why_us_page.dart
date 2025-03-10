import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/dialog/why-us-about-us/why_us_about_us_dialogs.dart';
import 'package:two_website/core/widgets/layouts/buttons/add_button.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/about-us-why-us/presentation/bloc/about_us_why_us_bloc.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/custom_why_us_table.dart';
import 'package:two_website/features/about-us-why-us/presentation/widgets/loading_why_us_table.dart';
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
                      WhyUsAboutUsDialogs().addAboutUsDialog(
                          context, _timeController, _siteController);
                    },
                  ),
                )
              ],
            ),
            PaddingConfig.h16,
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
                BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                  listener: (context, state) {
                    createWhyUsStateHandling(state, context);
                  },
                  listenWhen: (previous, current) =>
                      previous.createWhyUsStatus != current.createWhyUsStatus,
                  child: CreateButton(
                    addingType: "Why Us",
                    onPressed: () {
                      WhyUsAboutUsDialogs()
                          .addWhyUsDialog(context, _whyUsController);
                    },
                  ),
                )
              ],
            ),
            PaddingConfig.h16,
            Flexible(
              child: BlocBuilder<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                buildWhen: (previous, current) =>
                    (previous.showWhyUsStatus != current.showWhyUsStatus),
                builder: (context, state) {
                  return showWhyUsStateHandling(state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  RenderObjectWidget showAboutUsStateHandling(AboutUsWhyUsState state) {
    if (state.showAboutUsStatus == CasualStatus.loading) {
      return const Row(
          children: [WorkingTimeCard(), PaddingConfig.w24, SiteCard()]);
    } else if (state.showAboutUsStatus == CasualStatus.success) {
      return const Row(
        children: [WorkingTimeCard(), PaddingConfig.w24, SiteCard()],
      );
    } else if (state.showAboutUsStatus == CasualStatus.failure) {
      return const Row(
        children: [WorkingTimeCard(), PaddingConfig.w24, SiteCard()],
      );
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
    } else if (state.createWhyUsStatus == CasualStatus.failure) {
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.createWhyUsStatus == CasualStatus.noToken) {
      CustomQuickAlert().noTokenAlert(context);
    }
  }

  void createAboutUsStateHandling(
      AboutUsWhyUsState state, BuildContext context) {
    if (state.createAboutUsStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.createAboutUsStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
    } else if (state.createAboutUsStatus == CasualStatus.failure) {
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.createAboutUsStatus == CasualStatus.noToken) {
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
}

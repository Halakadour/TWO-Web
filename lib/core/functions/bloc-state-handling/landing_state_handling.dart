import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/assets_path.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/core/widgets/shimmers/service-post-loading/loading_cards.dart';
import 'package:two_website/core/widgets/shimmers/why-us-loading/loading_why_us_list.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/black_box.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/why_us_card.dart';
import 'package:two_website/features/landing/presentation/widgets/posts/post_card.dart';
import 'package:two_website/features/landing/presentation/widgets/services/service_card.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class LandingStateHandling {
  // About Us Why Us Section
  RenderObjectWidget showAboutUs(LandingState state) {
    if (state.showAboutUsStatus == CasualStatus.success) {
      return Column(
        children: [
          BlackBox(text1: state.showAboutUsEntity!.aboutWorkTime, text2: ""),
          PaddingConfig.h16,
          BlackBox(
              text1: LocaleKeys.Adress.tr(),
              text2: state.showAboutUsEntity!.aboutSite),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget showWhyUsList(LandingState state) {
    if (state.showWhyUsStatus == CasualStatus.loading) {
      return const LoadingWhyUsList();
    } else if (state.showWhyUsStatus == CasualStatus.success) {
      return ListView.builder(
          itemCount: state.showWhyUsList.length,
          itemBuilder: (context, index) => WhyUsCard(
                icon: IconsPath.wourd,
                text: state.showWhyUsList[index]!.whyUsDoc,
                isHover: ValueNotifier(false),
              ));
    } else if (state.showWhyUsStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return const SizedBox();
    }
  }

  // Posts Section
  Widget showActivePosts(LandingState state, ScrollController? controller) {
    if (state.activePostsListStatus == CasualStatus.loading) {
      return const LoadingCards();
    } else if (state.activePostsListStatus == CasualStatus.success) {
      return (state.activePostsList.isEmpty)
          ? const Text("No Postes")
          : ListView.builder(
              itemCount: state.activePostsList.length,
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemBuilder: (context, index) => PostCard(
                postEntity: state.activePostsList[index],
              ),
            );
    } else if (state.activePostsListStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return const SizedBox();
    }
  }

  void sendReplyListener(LandingState state, BuildContext context) {
    if (state.sendReplyStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.sendReplyStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
      context.pop();
    } else if (state.sendReplyStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    }
  }

  // Service Section
  Widget showServicesList(LandingState state, ScrollController? controller) {
    if (state.serviceListStatus == CasualStatus.loading) {
      return const Center(
        child: LoadingCards(),
      );
    } else if (state.serviceListStatus == CasualStatus.success) {
      return ListView.builder(
        itemCount: state.serviceList.length,
        scrollDirection: Axis.horizontal,
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) => ServiceCard(
          serviceEntity: state.serviceList[index],
        ),
      );
    } else if (state.serviceListStatus == CasualStatus.failure) {
      return Text(
        state.message,
        style: AppTextStyle.buttonStyle(color: AppColors.white),
      );
    } else {
      return const SizedBox();
    }
  }

  // Contact Us Section
  void contactUsListener(LandingState state, BuildContext context) {
    if (state.createContcatStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.createContcatStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
    } else if (state.createContcatStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.createContcatStatus == CasualStatus.notAuthorized) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}

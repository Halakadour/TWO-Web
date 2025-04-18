import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';
import 'package:two_website/features/landing/presentation/widgets/about-us-why-us/custom_linked_text.dart';
import 'package:two_website/features/landing/presentation/widgets/services/service_card.dart';
import 'package:two_website/lang/locale_keys.g.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
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
    context.read<LandingBloc>().add(ShowServicesEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        color: AppColors.black,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.services.tr().toUpperCase(),
                  style: AppTextStyle.heading00(color: AppColors.white),
                ),
              ],
            ),
            PaddingConfig.h40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "our experts team of programmers and software engineers will help to create your software as you\ndream, whether you order an application ar a website ypu would has a chanse to manage your busniss\nwith the power of software tools. we have an offer to you!",
                  style: AppTextStyle.subtitle03(color: AppColors.white),
                ),
                CustomLinkedText(
                  title: LocaleKeys.seeAll.tr(),
                )
              ],
            ),
            PaddingConfig.h40,
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                    ),
                    onPressed: _scrollLeft,
                  ),
                  PaddingConfig.w32,
                  Expanded(
                    child: BlocBuilder<LandingBloc, LandingState>(
                      buildWhen: (previous, current) =>
                          previous.serviceListStatus !=
                          current.serviceListStatus,
                      builder: (context, state) {
                        return servicesListStateHandling(state);
                      },
                    ),
                  ),
                  PaddingConfig.w32,
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.white,
                    ),
                    onPressed: _scrollRight,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget servicesListStateHandling(LandingState state) {
    if (state.serviceListStatus == CasualStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.serviceListStatus == CasualStatus.success) {
      return ListView.builder(
        itemCount: state.serviceList.length,
        scrollDirection: Axis.horizontal,
        controller: _controller,
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
}

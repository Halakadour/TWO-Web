import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/functions/bloc-state-handling/landing_state_handling.dart';
import 'package:two_website/core/functions/device_utility.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Flexible(
              child: Text(
                "our experts team of programmers and software engineers will help to create your software as you dream, whether you order an application ar a website ypu would has a chanse to manage your busniss with the power of software tools. we have an offer to you!",
                style: AppTextStyle.subtitle03(color: AppColors.white),
                maxLines: 3,
                overflow: TextOverflow.fade,
              ),
            ),
            PaddingConfig.h40,
            SizedBox(
              width: double.infinity,
              height: DeviceUtility.isDesktopScreen(context)
                  ? MediaQuery.of(context).size.width * 0.3
                  : DeviceUtility.isDesktopScreen(context)
                      ? MediaQuery.of(context).size.width * 0.3
                      : MediaQuery.of(context).size.width * 0.44,
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
                        return LandingStateHandling()
                            .showServicesList(context, state, _controller);
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
}

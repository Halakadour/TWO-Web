import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/functions/device_utility.dart';
import 'package:two_website/core/widgets/layouts/templates/page_template.dart';
import 'package:two_website/features/landing/domain/entities/service_entity.dart';
import 'package:two_website/features/landing/presentation/bloc/landing_bloc.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.services.tr().toUpperCase(),
                  style: AppTextStyle.headerLg(color: AppColors.white),
                ),
              ],
            ),
            PaddingConfig.h40,
            Flexible(
              child: Text(
                TextStrings.serviceText,
                style: AppTextStyle.bodySm(color: AppColors.white),
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
                      child: ListView.builder(
                    itemCount: TextStrings.servicesList.length,
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ServiceCard(
                      serviceEntity: ServiceEntity(
                          idE: 0,
                          titleE: TextStrings.servicesList[index],
                          descriptionE: "",
                          imageE: TextStrings.servicesImagesList[index]),
                    ),
                  )),
                  // Expanded(
                  //   child: BlocBuilder<LandingBloc, LandingState>(
                  //     buildWhen: (previous, current) =>
                  //         previous.serviceListStatus !=
                  //         current.serviceListStatus,
                  //     builder: (context, state) {
                  //       return LandingStateHandling()
                  //           .showServicesList(context, state, _controller);
                  //     },
                  //   ),
                  // ),
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

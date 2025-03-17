import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/padding_config.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/config/theme/text_style.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/buttons/filter_button.dart';
import 'package:two_website/core/widgets/dialog/filter/filter_dialogs.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/core/widgets/shimmers/table-loading/loading_contact_us_table.dart';
import 'package:two_website/features/contact-us/presentation/bloc/contact_us_bloc.dart';
import 'package:two_website/features/contact-us/presentation/widgets/custom_contact_us_table.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  void didChangeDependencies() {
    context.read<ContactUsBloc>().add(GetContactUsWithSeenAndApprovedEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: BlocListener<ContactUsBloc, ContactUsState>(
          listener: (context, state) {
            manageContactUsState(state, context);
          },
          listenWhen: (previous, current) =>
              (previous.approvedMarkerStatus != current.approvedMarkerStatus ||
                  previous.seenMarkerStatus != current.seenMarkerStatus),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us",
                    style: AppTextStyle.heading03(),
                  ),
                ],
              ),
              const SizedBox(
                height: SizesConfig.spaceBtwSections,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PaddingConfig.w8,
                  FilterButton(
                    onPressed: () {
                      FilterDialogs()
                          .filterContactUs(context, ValueNotifier([0, 0]));
                    },
                  )
                ],
              ),
              const SizedBox(
                height: SizesConfig.spaceBtwSections,
              ),
              Flexible(
                child: BlocBuilder<ContactUsBloc, ContactUsState>(
                  buildWhen: (previous, current) =>
                      (previous.contactUsListStatus !=
                          current.contactUsListStatus),
                  builder: (context, state) {
                    return manageGetContactUsUI(state);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget manageGetContactUsUI(ContactUsState state) {
    if (state.contactUsListStatus == CasualStatus.loading) {
      return const LoadingContactUsTable();
    } else if (state.contactUsListStatus == CasualStatus.success) {
      return CustomContactUsTable(contactUsList: state.contactUsList);
    } else if (state.contactUsListStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return const SizedBox();
    }
  }

  void manageContactUsState(ContactUsState state, BuildContext context) {
    if (state.approvedMarkerStatus == CasualStatus.loading ||
        state.seenMarkerStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.approvedMarkerStatus == CasualStatus.success ||
        state.seenMarkerStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
    } else if (state.approvedMarkerStatus == CasualStatus.failure ||
        state.seenMarkerStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.approvedMarkerStatus == CasualStatus.noToken ||
        state.seenMarkerStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().failureAlert(context, TextStrings.noToken);
    }
  }
}

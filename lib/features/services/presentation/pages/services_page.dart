import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/routes/app_route_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/config/theme/color.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/widgets/buttons/create_button.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/core/widgets/shimmers/table-loading/loading_service_table.dart';
import 'package:two_website/core/widgets/texts/page_title.dart';
import 'package:two_website/features/services/presentation/bloc/service_bloc.dart';
import 'package:two_website/features/services/presentation/widgets/custom_service_table.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ShowPostsPageState();
}

class _ShowPostsPageState extends State<ServicesPage> {
  @override
  void didChangeDependencies() {
    context.read<ServiceBloc>().add(ShowServicesEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: BlocListener<ServiceBloc, ServiceState>(
          listener: (context, state) {
            manageDeleteServiceState(state, context);
          },
          listenWhen: (previous, current) =>
              (previous.deleteServiceStatus != current.deleteServiceStatus),
          child: Column(
            children: [
              const PageTitle(pageTitle: "Services"),
              const SizedBox(
                height: SizesConfig.spaceBtwSections,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CreateButton(
                    addingType: "Service",
                    onPressed: () {
                      context.pushNamed(AppRouteConfig.createService);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: SizesConfig.spaceBtwSections,
              ),
              Flexible(
                child: BlocBuilder<ServiceBloc, ServiceState>(
                  builder: (context, state) {
                    return manageGetServicesUI(state);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget manageGetServicesUI(ServiceState state) {
    if (state.serviceListStatus == CasualStatus.loading) {
      return const LoadingServiceTable();
    } else if (state.serviceListStatus == CasualStatus.success) {
      return CustomServiceTable(serviceList: state.serviceList);
    } else if (state.serviceListStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return const SizedBox();
    }
  }

  void manageDeleteServiceState(ServiceState state, BuildContext context) {
    if (state.deleteServiceStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.deleteServiceStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
    } else if (state.deleteServiceStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.deleteServiceStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().failureAlert(context, TextStrings.noToken);
    }
  }
}
